package com.hdsoft.techblog.user;

import com.hdsoft.techblog.models.User;
import com.hdsoft.techblog.utils.Dao;
import com.hdsoft.techblog.utils.Message;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ForgotPassword extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();

            String username = request.getParameter("username");
            String email = request.getParameter("email");

            if (username == null || username.isEmpty()) {
                session.setAttribute("msg", create("alert-danger", "Username Cannot Be Empty"));
                response.sendRedirect("forgotpassword.jsp");
            }
            if (email == null || email.isEmpty()) {
                session.setAttribute("msg", create("alert-danger", "Email Cannot Be Empty"));
               response.sendRedirect("forgotpassword.jsp");
            }

            User user = Dao.getUserDao().findByUsernameEmail(username, email);
            if (user == null) {
                session.setAttribute("msg", create("alert-danger", "User Not Found"));
                response.sendRedirect("forgotpassword.jsp");
            } else {
                session.setAttribute("resetUser", user);
                session.setAttribute("resetPassword", true);
                response.sendRedirect("resetpassword.jsp");
            }
        }
    }

    private Message create(String css, String msg) {
        Message m = new Message(msg, css);
        return m;
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
