/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Ubtils.CookieUtil;
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
public class LoginController extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginController</title>");
            out.println("</head>");
            out.println("<body>");

            String action = request.getParameter("action");
            String userID = request.getParameter("email");
            String password = request.getParameter("password");
            String remember = request.getParameter("remember");

            if (action != null && action.equals("logout")) {
                HttpSession session = request.getSession(false);
                response.sendRedirect("login.jsp");
                if (session != null) {
                    session.invalidate();
                }

            } else {

                log("Debug user : " + userID + " " + password);

                if (userID == null && password == null) {

                    log("Debug user : Go to login " + userID + " " + password);
                    RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                    rd.forward(request, response);
                } else {

                    log("Debug user : Go to here " + userID + " " + password);
                    UsersDAO userDAO = new UsersDAO();
                    UsersDTO userDTO = userDAO.login(userID, password);

                    if (userDTO != null) {
                        if ("admin".equalsIgnoreCase(userDTO.getEmail()) && "admin".equalsIgnoreCase(userDTO.getPassword())) {
                            HttpSession session = request.getSession(true);
                            session.setAttribute("user", userDTO);
                            request.getRequestDispatcher("admin.jsp").forward(request, response);
                        }
                        HttpSession session = request.getSession(true);
                        session.setAttribute("user", userDTO);

                        if (remember != null && remember.equals("on")) {
                            CookieUtil.createCookie(response, "remember_email", userID);
                            CookieUtil.createCookie(response, "remember_password", password);
                        } else {
                            // Xóa cookie (nếu có)
                            CookieUtil.deleteCookie(request, response, "remember_email");
                            CookieUtil.deleteCookie(request, response, "remember_password");
                        }

                        response.sendRedirect("home.jsp");

                    } else {
                        request.setAttribute("error", "Incorrect UserID or Password");
                        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                        rd.forward(request, response);
                    }
                }
            }
            out.println("</body>");
            out.println("</html>");
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
