
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
public class MyServices extends HttpServlet {

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
        String message = "<h3>Login to see the services you can purchase and your owned services.</h3>";

        if (session != null) {
            currentUser = (UsersDTO) session.getAttribute("user");
        }

        if (currentUser != null) {
            Long user_id = currentUser.getUser_id();
            ServiceProviderDAO serDAO = new ServiceProviderDAO();
            PurchasedServiceDAO purSerDAO = new PurchasedServiceDAO();

  
            List<PurchasedServiceDTO> ownedServices1 = purSerDAO.getOwnedServices(user_id);
            List<PurchasedServiceDTO> ownedServices2 = purSerDAO.getAlreadyOwnedServices(user_id);

          
            List<ServiceProviderDTO> serCheck = serDAO.getAllService();

            List<Integer> ownedServiceIds1 = new ArrayList<>();
            List<Integer> ownedServiceIds2 = new ArrayList<>();

            for (PurchasedServiceDTO purchasedServiceDTO : ownedServices1) {
                ownedServiceIds1.add(purchasedServiceDTO.getProviderId());
                System.out.println(purchasedServiceDTO.getProviderId());
            }

            for (PurchasedServiceDTO purchasedServiceDTO : ownedServices2) {
                ownedServiceIds2.add(purchasedServiceDTO.getProviderId());
            }

            List<ServiceProviderDTO> filterServiceList1 = new ArrayList<>();
            List<ServiceProviderDTO> filterServiceList2 = new ArrayList<>();

            for (ServiceProviderDTO serviceProviderDTO : serCheck) {
                if (ownedServiceIds1.contains(serviceProviderDTO.getServiceID())) {
                    filterServiceList1.add(serviceProviderDTO);
                     System.out.println("yes");
                }
                System.out.println("no");
            }

       
            for (ServiceProviderDTO serviceProviderDTO : serCheck) {
                if (ownedServiceIds2.contains(serviceProviderDTO.getServiceID())) {
                    filterServiceList2.add(serviceProviderDTO);
                     System.out.println("yes");
                }
                System.out.println("no");
            }

            request.setAttribute("serList1", filterServiceList1);
            request.setAttribute("serList2", filterServiceList2);
            request.getRequestDispatcher("purchased_services.jsp").forward(request, response);
        } else {
            request.setAttribute("mess", message);
            request.getRequestDispatcher("service.jsp").forward(request, response);
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
