/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Pets.PetsDTO;
import Pets.PetsDAO;
import Users.UsersDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DO ANH KHOA
 */
public class PetController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            // Check security
            HttpSession session = request.getSession(false);
            UsersDTO currentUser = null;

            if (session != null) {
                currentUser = (UsersDTO) session.getAttribute("user");
            }

            log("Debug: " + currentUser);
            if (currentUser == null) {
                log("Debug: Redirect to login page" + currentUser);
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            String created_date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

            PetsDAO petDAO = new PetsDAO();
            if (action.equals("getall")) {
                int user_id;
                try {
                    user_id = Integer.parseInt(request.getParameter("user_id"));
                    List<PetsDTO> listPetsDTO = petDAO.getAll(user_id);
                    log("Error" + listPetsDTO);
                    request.setAttribute("listPetsDTO", listPetsDTO);
                    request.getRequestDispatcher("userProfile.jsp").forward(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                request.getRequestDispatcher("userProfile.jsp").forward(request, response);

            } else if (action.equals("add")) {
                int user_id;
                try {
                    user_id = Integer.parseInt(request.getParameter("user_id"));
                    
                    // Create a new PetsDTO object and set its properties
                    boolean idExists = petDAO.exists(Integer.parseInt(request.getParameter("petId")));
                    if (idExists) {
                        // ID đã tồn tại, hiển thị thông báo lên
                        System.out.println("qwe");
                        request.setAttribute("errorMessage", "ID already exists. Please choose a different ID.");
                        request.getRequestDispatcher("addPet.jsp").forward(request, response);
                      
                        return;
                    }
                    
                    PetsDTO newPet = new PetsDTO();
                    newPet.setUserId(user_id);
                    newPet.setPetId(Integer.parseInt(request.getParameter("petId")));
                    newPet.setPetName(request.getParameter("petName"));
                    newPet.setPetAge(Integer.parseInt(request.getParameter("petAge")));
                    newPet.setAllergy(request.getParameter("allergy"));
                    newPet.setProfilePicture(request.getParameter("profilePicture"));
                    newPet.setOrderDate(created_date);
                    
                    
                    
                    petDAO.addPet(newPet);
                    log("Error" + newPet);
                    request.setAttribute("newPet", newPet);
                    request.getRequestDispatcher("addPet.jsp").forward(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                request.getRequestDispatcher("addPet.jsp").forward(request, response);
            } else if (action.equals("edit")) {
                int pet_id;
                try {
                    pet_id = Integer.parseInt(request.getParameter("pet_id"));
                    PetsDTO newPet = new PetsDTO();
                    newPet = petDAO.loadInfo(pet_id);
                    session.setAttribute("pet", newPet);
                    log("Debug22: " + newPet);
//                    request.setAttribute("action", "update");
                    request.getRequestDispatcher("petedit.jsp").forward(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                    log("Debug23: ");
                }
                request.getRequestDispatcher("petedit.jsp").forward(request, response);
            } else if (action.equals("update")) {
                int pet_id;
                try {
                    pet_id = Integer.parseInt(request.getParameter("pet_id"));
                    PetsDTO newPet = petDAO.loadInfo(pet_id);
                    log("Debug24: " + newPet);
                    newPet.setPetName(request.getParameter("petName"));
                    newPet.setPetAge(Integer.parseInt(request.getParameter("petAge")));
                    newPet.setAllergy(request.getParameter("allergy"));
                    newPet.setProfilePicture(request.getParameter("profilePicture"));

                    petDAO.update(newPet);

                    session.setAttribute("pet", newPet);
                    request.getRequestDispatcher("userProfile.jsp").forward(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                    log("Debug25: ");
                }
                request.getRequestDispatcher("userProfile.jsp").forward(request, response);
            } else if (action.equals("delete")) {
                int petId;
                try {
                    petId = Integer.parseInt(request.getParameter("pet_id"));
                    // Call the deletePet method to delete the pet from the database
                    petDAO.deletePet(petId);
                    // Redirect back to the profile page after deletion
                    response.sendRedirect("userProfile.jsp");
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}