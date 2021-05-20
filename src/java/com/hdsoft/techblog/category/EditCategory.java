package com.hdsoft.techblog.category;

import com.hdsoft.techblog.utils.Dao;
import com.hdsoft.techblog.utils.DateUtils;
import com.hdsoft.techblog.utils.Message;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EditCategory extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession s = request.getSession();
            try {
                com.hdsoft.techblog.models.Category c = getCategory(request);
                boolean b = Dao.getCategoryDao().update(c);
                if (b) {
                    s.setAttribute("msg", new Message("Category Updated Successfully", "alert-success"));
                } else {
                    s.setAttribute("msg", new Message("Category Updation Failed", "alert-danger"));
                }
            } catch (SQLException e) {
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

    private com.hdsoft.techblog.models.Category getCategory(HttpServletRequest req) {
        com.hdsoft.techblog.models.Category category = new com.hdsoft.techblog.models.Category();
        category.setId(Long.parseLong(req.getParameter("id")));
        category.setCategory(req.getParameter("category"));
        category.setDescription(req.getParameter("desc"));
        category.setDate(req.getParameter("date"));
        category.setUserId(Long.parseLong(req.getParameter("userid")));
        
        return category;
    }
    
}
