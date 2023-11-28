/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DO ANH KHOA
 */
public class MainController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "login";
    private static final String REGISTER = "register";
    private static final String GET_ALL_RESOURCES = "ListSourceController";
    private static final String GET_DOG_PAGE = "DogPageController";
    private static final String CHANGE_INF_USER = "ProfileController";
    private static final String INSERT = "InsertResourceController";
    private static final String DOG_NEW = "NewsContronller";
    private static final String DELETE_SOURCE = "DeleteResourcesController";
    private static final String UPDATE_SOURCE = "UpdateResourceController";
    private static final String UPDATE = "Update";
    private static final String FIND_SOURCE = "FindResourceController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String url = ERROR;
            try {
//                your code here
                String action = request.getParameter("action");
                if (action == null) {
                    url = ERROR;
                } else if (action.equals("Login")) {
                    url = LOGIN;
                } else if (action.equals("Register")) {
                    url = REGISTER;
                } else if (action.equals("GetAll")) {
                    url = GET_ALL_RESOURCES;
                } else if (action.equals("getdogpage")) {
                    url = GET_DOG_PAGE;
                } else if (action.equals("addResource")) {
                    url = INSERT;
                } else if (action.equals("dognew")) {
                    url = DOG_NEW;
                } else if (action.equals("deleteResource")) {
                    url = DELETE_SOURCE;
                }else if (action.equals("updateResource")) {
                    url = UPDATE_SOURCE;
                }else if (action.equals("update")) {
                    url = UPDATE;
                }else if (action.equals("findResource")) {
                    url = FIND_SOURCE;
                }

            } catch (Exception e) {
                log("Error at MainController: " + e.toString());
            } finally {
                request.getRequestDispatcher(url).forward(request, response);
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
