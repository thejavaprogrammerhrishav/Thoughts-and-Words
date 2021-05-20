package com.hdsoft.techblog.profile;

import com.hdsoft.techblog.models.User;
import com.hdsoft.techblog.utils.Dao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class ChangePassword extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String newPassword = request.getParameter("newPassword");
            String conPassword = request.getParameter("conPassword");

            if (newPassword.equals(conPassword)) {
                User user = (User) request.getSession().getAttribute("currentUser");
                user.setPassword(newPassword);

                try {
                    boolean b = Dao.getUserDao().update(user);
                    if (b) {
                        out.println("Success");
                    } else {
                        out.println("Password Change Failed");
                    }
                } catch (SQLException ex) {
                    out.println(ex.getMessage());
                }

                request.getSession().removeAttribute("currentUser");
                request.getSession().setAttribute("currentUser", user);

            } else {
                out.println("Passwords Doesn't Match");
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
