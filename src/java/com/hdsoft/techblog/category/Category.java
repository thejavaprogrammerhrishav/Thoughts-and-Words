package com.hdsoft.techblog.category;

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

public class Category extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            long id = Long.parseLong(request.getParameter("id"));

            HttpSession s = request.getSession();

            try {
                if (id < 0) {
                    s.setAttribute("msg", new Message("Invalid Category ID", "alert-danger"));
                } else {
                    com.hdsoft.techblog.models.Category c = Dao.getCategoryDao().findById(id);
                    if (c != null) {
                        boolean b = Dao.getCategoryDao().delete(c);
                        if (b) {
                            s.setAttribute("msg", new Message("Category Deleted Successfully", "alert-success"));
                        } else {
                            s.setAttribute("msg", new Message("Category Deletion Failed", "alert-danger"));
                        }
                    } else {
                        s.setAttribute("msg", new Message("Category Not Found", "alert-danger"));
                    }
                }
            } catch (Exception e) {
                s.setAttribute("msg", new Message(e.getMessage(), "alert-danger"));
            }
            response.sendRedirect("allcategory.jsp");
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
