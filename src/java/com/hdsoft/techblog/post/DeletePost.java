package com.hdsoft.techblog.post;

import com.hdsoft.techblog.models.Post;
import com.hdsoft.techblog.utils.Dao;
import com.hdsoft.techblog.utils.Message;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeletePost extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String rem = request.getParameter("rem");
            String pg = request.getParameter("pg");

            if (rem != null && !rem.isEmpty()) {
                try {
                    long remid = Long.parseLong(rem);
                    Post p = new Post();
                    p.setId(remid);
                    boolean b = Dao.getPostDao().delete(p);
                    if (b) {
                        session.setAttribute("msg", new Message("Post Deleted Successfully", "alert-success"));
                    } else {
                        session.setAttribute("msg", new Message("Post Deletion Failed", "alert-danger"));
                    }
                } catch (Exception e) {
                    session.setAttribute("msg", new Message(e.getMessage(), "alert-danger"));
                }
                if(pg!=null && !pg.isEmpty()){
                    response.sendRedirect("home.jsp");
                }
                response.sendRedirect("profile.jsp");
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
