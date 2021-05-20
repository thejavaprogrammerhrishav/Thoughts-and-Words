
package com.hdsoft.techblog.profile;

import com.hdsoft.techblog.models.User;
import com.hdsoft.techblog.utils.Dao;
import com.hdsoft.techblog.utils.Message;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Base64;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class EditProfile extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession s = request.getSession();
            User currentUser = (User) s.getAttribute("currentUser");
            
            User newUser = getUser(request);
            
            newUser.setId(currentUser.getId());
            newUser.setDate(currentUser.getDate());
            newUser.setPassword(currentUser.getPassword());
            
            try {
                boolean b = Dao.getUserDao().update(newUser);
                if (b) {
                    s.removeAttribute("currentUser");
                    s.setAttribute("currentUser", newUser);
                    s.setAttribute("msg", new Message("User Profile Updated Successfully", "alert-success"));
                } else {
                    s.setAttribute("msg", new Message("User Profile Update Failed", "alert-danger"));
                }
            } catch (SQLException ex) {
                s.setAttribute("msg", new Message("Error: " + ex.getMessage(), "alert-danger"));
            }
            response.sendRedirect("profile.jsp");
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
        
        String facebook = req.getParameter("facebook");
        String instagram = req.getParameter("instagram");
        String twitter = req.getParameter("twitter");
        
        if (facebook != null && !facebook.isEmpty()) {
            user.setFacebook(Base64.getEncoder().encodeToString(facebook.getBytes()));
        } else {
            user.setFacebook("");
        }
        
        if (instagram != null && !instagram.isEmpty()) {
            user.setInstagram(Base64.getEncoder().encodeToString(instagram.getBytes()));
        } else {
            user.setInstagram("");
        }
        
        if (twitter != null && !twitter.isEmpty()) {
            user.setTwitter(Base64.getEncoder().encodeToString(twitter.getBytes()));
        } else {
            user.setTwitter("");
        }
        return user;
    }
}
