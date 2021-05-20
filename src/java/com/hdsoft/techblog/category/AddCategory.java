package com.hdsoft.techblog.category;

import com.hdsoft.techblog.models.Category;
import com.hdsoft.techblog.models.User;
import com.hdsoft.techblog.utils.Dao;
import com.hdsoft.techblog.utils.DateUtils;
import com.hdsoft.techblog.utils.Message;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@MultipartConfig
public class AddCategory extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Category category = getCategory(request);
            HttpSession s = request.getSession();
            try {
                if (!Dao.getCategoryDao().existsCategory(category.getCategory())) {

                    User user = (User) s.getAttribute("currentUser");
                    category.setUserId(user.getId());

                    Long save = Dao.getCategoryDao().save(category);
                    if (save > 0) {
                        out.println("Success");
                    } else {
                        out.println("Category Saving Failed");
                    }

                } else {
                    out.println("Category Already Exists");
                }
            } catch (SQLException ex) {
                out.println(ex.getMessage());
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

    private Category getCategory(HttpServletRequest req) {
        Category category = new Category();
        category.setCategory(req.getParameter("category"));
        category.setDescription(req.getParameter("description"));
        category.setDate(DateUtils.getDate());

        return category;
    }

}
