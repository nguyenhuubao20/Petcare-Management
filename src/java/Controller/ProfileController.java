/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Users.UsersDAO;
import Users.UsersDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DO ANH KHOA
 */
public class ProfileController extends HttpServlet {

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

            log("Debug: " + currentUser.getUser_id());
            if (currentUser == null) {
                log("Debug: Redirect to login page" + currentUser);
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            UsersDAO userDAO = new UsersDAO();
            if (action.equals("edit")) {
                Long user_id = null;
                try {

                    user_id = Long.parseLong(request.getParameter("user_id"));
                    UsersDTO user = null;
                    if (user_id != null) {
                        user = userDAO.load(user_id);
                        session.setAttribute("user", user);

                        request.setAttribute("action", "update");
                        RequestDispatcher rd = request.getRequestDispatcher("useredit.jsp");
                        rd.forward(request, response);
                    }

                } catch (NumberFormatException ex) {
                    log("Debug: " + user_id);
                    System.out.println(user_id);
                }
                RequestDispatcher rd = request.getRequestDispatcher("useredit.jsp");
                rd.forward(request, response);

            } else if (action == null || action.equals("update")) {
                Long user_id = null;
                try {
                    user_id = Long.parseLong(request.getParameter("user_id"));
                    UsersDTO user = userDAO.load(user_id);
                    
                    user.setName(request.getParameter("name"));
                    user.setPassword(request.getParameter("password"));
                    user.setEmail(request.getParameter("email"));
//                    user.setAddress(request.getParameter("address"));
                    user.setPhonenumber(request.getParameter("phonenumber"));

                    if (user_id != null) {
                        boolean updated;
                        updated = userDAO.updateUser(user);
                        if (updated) {
                            // Hiển thị thông báo cập nhật thành công
                            out.println("Profile updated successfully");
                        } else {
                            // Hiển thị thông báo lỗi cập nhật
                            out.println("Failed to update profile");
                        }
                    }

                    session.setAttribute("user", user);
                    RequestDispatcher rd = request.getRequestDispatcher("userProfile.jsp");
                    rd.forward(request, response);
                } catch (NumberFormatException ex) {
                    ex.printStackTrace();
                }
                RequestDispatcher rd = request.getRequestDispatcher("userProfile.jsp");
                rd.forward(request, response);

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