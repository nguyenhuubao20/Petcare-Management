/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;



import ServiceProvider.PurchasedServiceDAO;
import ServiceProvider.PurchasedServiceDTO;
import ServiceProvider.ServiceProviderDAO;
import ServiceProvider.ServiceProviderDTO;
import Users.UsersDTO;
import java.io.IOException;
import java.util.ArrayList;

import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sontv
 */
public class ServiceBookingServlet extends HttpServlet {

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
          HttpSession session = request.getSession(false);
            UsersDTO currentUser = null;
            String message ="<h3>Login in to see Service you can purchase !</h3>";
           
            if (session != null) {
                currentUser = (UsersDTO) session.getAttribute("user");
            }
             if (currentUser != null) {
                 Long user_id = currentUser.getUser_id();
               
             ServiceProviderDAO serviceDAO = new ServiceProviderDAO();
             String location = currentUser.getAddress();
            List<ServiceProviderDTO> serviceList1 = serviceDAO.GetServiceByUser(location);

               List<Integer> purchasedServiceIds = serviceDAO.getPurchasedServiceIdsByUser(user_id);


//                 for (Long purchasedServiceId : purchasedServiceIds) {
//                     System.out.println(purchasedServiceId);
//                 }
          
           List<ServiceProviderDTO> filterServiceList = new ArrayList<>();
            for (ServiceProviderDTO service : serviceList1) {
            if (!purchasedServiceIds.contains(service.getServiceID())) {
            filterServiceList.add(service);
        }
    }
            request.setAttribute("serList1", filterServiceList);      
            List<ServiceProviderDTO> serviceList2 = serviceDAO.getAllService();
            request.setAttribute("serList2", serviceList2);
            request.getRequestDispatcher("service.jsp").forward(request, response);
           
            }        
            ServiceProviderDAO serviceDAO = new ServiceProviderDAO();
            List<ServiceProviderDTO> serviceList2 = serviceDAO.getAllService();
            request.setAttribute("serList2", serviceList2);
            request.setAttribute("mess",message);
            request.getRequestDispatcher("service.jsp").forward(request, response);
       
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
     
        String serID = request.getParameter("serID");
        String serUser = request.getParameter("userID");
         String message ="<h3>Thank you for using this service. The service contact will call you for more information.</h3>";
        PurchasedServiceDAO purDAO = new PurchasedServiceDAO();
        request.setAttribute("mess2",message);
        
        purDAO.purchaseService(Integer.parseInt(serUser),Integer.parseInt(serID));
              response.sendRedirect("ServiceBooking");
         
      
//        PurchasedServiceDAO purchasedServiceDAO = new PurchasedServiceDAO();
//        purchasedServiceDAO.addPurchasedService(purchasedService);
//
//        response.sendRedirect("success.jsp");
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
