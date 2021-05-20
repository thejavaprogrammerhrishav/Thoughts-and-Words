package com.hdsoft.techblog.user;

import com.hdsoft.techblog.models.User;
import com.hdsoft.techblog.utils.Dao;
import com.hdsoft.techblog.utils.Message;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ResetPassword extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();

            if (session.getAttribute("resetPassword") != null) {
                session.removeAttribute("resetPassoword");
            }

            User user = (User) session.getAttribute("resetUser");

            if (user != null) {

                String password = request.getParameter("password");
                String cpassword = request.getParameter("cpassword");

                if (password == null || password.isEmpty() || cpassword == null || cpassword.isEmpty()) {
                    session.setAttribute("msg", create("alert-danger", "Password Cannot Be Empty"));
                    response.sendRedirect("resetpassword.jsp");
                }

                if (password.equals(cpassword)) {
                    try {
                        user.setPassword(password);
                        boolean update = Dao.getUserDao().update(user);
                        if (update) {
                            String msg = "Password Reset Successfully......  <b> <a href=\"login.jsp\"> Login Now </a> </b>";
                            session.setAttribute("msg", create("alert-success", msg));
                            response.sendRedirect("resetpassword.jsp");
                        } else {
                            session.setAttribute("msg", create("alert-danger", "Password Updation Failed"));
                            response.sendRedirect("resetpassword.jsp");
                        }
                    } catch (SQLException e) {
                        session.setAttribute("msg", create("alert-danger", e.getMessage()));
                        response.sendRedirect("resetpassword.jsp");
                    }
                } else {
                    session.setAttribute("msg", create("alert-danger", "Password Doesn't Match"));
                    response.sendRedirect("resetpassword.jsp");
                }

            } else {
                session.setAttribute("msg", new Message("No User Found", "alert-danger"));
                response.sendRedirect("forgotpassword.jsp");
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
