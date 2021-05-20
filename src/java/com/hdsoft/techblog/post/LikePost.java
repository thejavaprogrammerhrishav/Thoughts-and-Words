package com.hdsoft.techblog.post;

import com.hdsoft.techblog.dao.LikeDao;
import com.hdsoft.techblog.models.User;
import com.hdsoft.techblog.utils.Dao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LikePost extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            LikeDao dao = Dao.getLikeDao();

            HttpSession s = request.getSession();

            User user = (User) s.getAttribute("currentUser");

            String parameter = request.getParameter("id");

            if (user != null) {
                try {
                    long postid = Long.parseLong(parameter);

                    if (!dao.isliked(user.getId(), postid)) {
                        boolean like = dao.like(user.getId(), postid);
                        if (like) {
                            out.println("liked;" + count(dao, postid));
                        } else {
                            out.println("likedfailed;" + count(dao, postid));
                        }
                    } else {
                        boolean dislike = dao.dislike(user.getId(), postid);
                        if (dislike) {
                            out.println("disliked;" + count(dao, postid));
                        } else {
                            out.println("dislikedfailed;" + count(dao, postid));
                        }
                    }

                } catch (NumberFormatException e) {
                    out.println("Invalid ID");
                }
            } else {
                out.println("User Null");
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

    private int count(LikeDao dao, long postid) {
        return dao.countLikes(postid);
    }

}
