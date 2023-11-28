/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Contact.ContactDAO;
import Contact.ContactDTO;
import Pets.PetsDAO;
import Pets.PetsDTO;
import Resources.ResourcesDAO;
import Resources.ResourcesDTO;
import ServiceProvider.PurchasedServiceDAO;
import ServiceProvider.PurchasedServiceWithDetailsDTO;
import ServiceProvider.ServiceProviderDAO;
import ServiceProvider.ServiceProviderDTO;
import Users.UsersDAO;
import Users.UsersDTO;
import java.io.IOException;
import java.io.PrintWriter;
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
public class AdminController extends HttpServlet {

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

            UsersDAO userDAO = new UsersDAO();
            Pets.PetsDAO petDAO = new PetsDAO();
            Resources.ResourcesDAO resourceDAO = new ResourcesDAO();
            PurchasedServiceDAO purserDAO = new PurchasedServiceDAO();
            if (action.equals("getalluser")) {
                List<UsersDTO> listUsersDTO = userDAO.getAllUsers();
                request.setAttribute("listUsersDTO", listUsersDTO);
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            } else if (action.equals("getallpet")) {
                List<PetsDTO> listPetsDTO = petDAO.getAllPet();
                request.setAttribute("listPetsDTO", listPetsDTO);
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            }else if (action.equals("deleteuser")){
                petDAO.deletePetByUsingUserID(request.getParameter("user_id"));
                resourceDAO.deleteAuthorByUsingUserID(request.getParameter("user_id"));               
                userDAO.deleteUser(request.getParameter("user_id"));
                purserDAO.deleteService(request.getParameter("user_id"));
                
                response.sendRedirect("admin.jsp");               
            }else if (action.equals("getallresource")) {
                ResourcesDAO resourcesdao = new ResourcesDAO();
                List<ResourcesDTO> list = resourcesdao.getAllSource();
                request.setAttribute("list", list);
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            } else if (action.equals("Remove")) {
                int re_id = Integer.parseInt(request.getParameter("re_id"));
                ResourcesDAO resourcesdao = new ResourcesDAO();
                List<ResourcesDTO> removelist = resourcesdao.deleteAllResource(re_id);
                request.setAttribute("list", removelist);
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            } else if (action.equals("search")) {
                String searchKeyword = request.getParameter("searchKeyword");
                String filterBy = request.getParameter("filterBy");
                ResourcesDAO dao = new ResourcesDAO();
                List<ResourcesDTO> resultListbyAuthor = dao.searchAndFilterAuthor(searchKeyword);
                List<ResourcesDTO> resultListbyCategory = dao.searchAndFilterCategory(searchKeyword);
                if (filterBy.equals("author_name")) {
                    if (resultListbyAuthor != null && !resultListbyAuthor.isEmpty()) {
                        request.setAttribute("list", resultListbyAuthor);
                        request.getRequestDispatcher("admin.jsp").forward(request, response);
                    }
                } else if (filterBy.equals("category")) {
                    if (resultListbyCategory != null && !resultListbyCategory.isEmpty()) {
                        request.setAttribute("list", resultListbyCategory);
                        request.getRequestDispatcher("admin.jsp").forward(request, response);
                    }
                } else {
                    List<ResourcesDTO> resultListAll = dao.searchResources(searchKeyword);
                    request.setAttribute("list", resultListAll);
                    request.getRequestDispatcher("admin.jsp").forward(request, response);
                }
           
            }
            else if(action.equals("getallservice")){
                 ServiceProviderDAO serDAO = new ServiceProviderDAO();
               List<ServiceProviderDTO> serCheck = serDAO.getAllService();   
               request.setAttribute("serList1", serCheck);
               request.getRequestDispatcher("admin.jsp").forward(request, response);
                }else if(action.equals("deleteservice")){
                    String get = request.getParameter("ser_id");
                    Integer input = Integer.parseInt(get);
                     ServiceProviderDAO serDAO = new ServiceProviderDAO();
                     serDAO.deleteService(input);
     
               request.getRequestDispatcher("admin.jsp").forward(request, response);
                }else if(action.equals("insertservice")){                 
                   response.sendRedirect(request.getContextPath() + "/insertservice.jsp"); 
                }else if(action.equals("getallcontact")){
                   ContactDAO conDAO = new ContactDAO();
                      List<ContactDTO> conCheck = conDAO.getAllContact();
                   request.setAttribute("conList", conCheck);
               request.getRequestDispatcher("admin.jsp").forward(request, response);             
                }else if(action.equals("deletecontact")){
                    String get = request.getParameter("contact_id");
                    Integer input = Integer.parseInt(get);
//                    System.out.println(input);
                     ContactDAO conDAO = new ContactDAO();
                     conDAO.deleteContact(input);
                   request.getRequestDispatcher("admin.jsp").forward(request, response); 
                }else if(action.equals("deletepur")){
                     PurchasedServiceDAO test = new PurchasedServiceDAO();
                    String get1 = request.getParameter("seruser");
                    String get2 = request.getParameter("serid");
                    Integer input1 = Integer.parseInt(get1);
                    Integer input2= Integer.parseInt(get2);
                    test.deleteService(input2, input1);
                     request.getRequestDispatcher("admin.jsp").forward(request, response); 
                }else if(action.equals("getallpur")){
                    PurchasedServiceDAO test = new PurchasedServiceDAO();
                    List<PurchasedServiceWithDetailsDTO> testlist = test.getAllPurchasedServiceWithDetails();
                    System.out.println(testlist);
                     request.setAttribute("purList", testlist);
                     request.getRequestDispatcher("admin.jsp").forward(request, response); 
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
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String location = request.getParameter("location");
        String description = request.getParameter("description");
        float price = Float.parseFloat(request.getParameter("price"));
        String dateStr = request.getParameter("date");
       
        String mess="Insert Successful";
        ServiceProviderDTO serviceProvider = new ServiceProviderDTO(0, name, type, location, description, price, dateStr, true);
   
        ServiceProviderDAO serviceProviderDAO = new ServiceProviderDAO();
        serviceProviderDAO.insertService(serviceProvider);
            request.setAttribute("messdone", mess);
                  request.getRequestDispatcher("insertservice.jsp").forward(request, response);  
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
