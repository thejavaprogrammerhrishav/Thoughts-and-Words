package com.hdsoft.techblog.user;

import com.hdsoft.techblog.models.User;
import com.hdsoft.techblog.utils.Dao;
import com.hdsoft.techblog.utils.DateUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@MultipartConfig
public class Register extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String p = request.getParameter("password");
            String c = request.getParameter("cpassword");

            if (p.equals(c) && !p.isEmpty() && !c.isEmpty()) {
                User user = getUser(request);
                try{
                Long save = Dao.getUserDao().save(user);
                if (save > 0) {
                    out.println("User Saved Successfully");
                } else {
                    out.println("User Saving Failed");
                }
                }catch(SQLException e){
                    out.println(e.getMessage());
                }
            } else {
                out.println("Password's Doesn't Match");
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

    private User getUser(HttpServletRequest req) {
        User user = new User();
        user.setName(req.getParameter("name"));
        user.setContact(req.getParameter("contact"));
        user.setEmail(req.getParameter("email"));
        user.setAbout(req.getParameter("about"));
        user.setGender(req.getParameter("gender"));
        user.setUsername(req.getParameter("username"));
        user.setPassword(req.getParameter("password"));
        user.setDate(DateUtils.getDate());
        user.setFacebook("");
        user.setInstagram("");
        user.setTwitter("");
        return user;
    }

}
