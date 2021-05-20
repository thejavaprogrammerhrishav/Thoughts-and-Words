package com.hdsoft.techblog.post;

import com.hdsoft.techblog.models.Post;
import com.hdsoft.techblog.models.User;
import com.hdsoft.techblog.utils.Dao;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class NewPost extends HttpServlet {

    protected void processRequest(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = req.getSession();

            try {
                int c = Integer.parseInt(req.getParameter("totalFiles"));

                User user = (User) session.getAttribute("currentUser");

                Post post = new Post(get(req.getParameter("currentUser")), req.getParameter("name"), req.getParameter("title"), req.getParameter("subtitle"),
                        req.getParameter("date"), req.getParameter("time"), get(req.getParameter("category")), req.getParameter("postContent"),"", req.getParameter("visibility"));

                String files = getFiles(c, req, user);

                post.setFiles(files);

                Long save = Dao.getPostDao().save(post);

                if (save > 0) {
                    out.println("done");
                } else {
                    out.println("Failed Saving Post");
                }

            } catch (NumberFormatException | SQLException ex) {
                ex.printStackTrace();
                out.println("Error: " + ex.getMessage());
            }
        }
    }

    private long get(String s) {
        return Long.parseLong(s);
    }

    private String getFiles(int total, HttpServletRequest req, User user) throws IOException, ServletException {
        List<String> files = new ArrayList<String>();
        StringBuilder sb = new StringBuilder();
        String path = req.getServletContext().getRealPath("/");
        path = path + "userdata";
        createDir(path);
        path = path + File.separator + "user_" + user.getId() + File.separator;
        createDir(path);

        if (total > 0) {
            for (int i = 1; i <= total; i++) {
                Part part = req.getPart("customFile" + i);

                InputStream in = part.getInputStream();

                byte[] b = new byte[in.available()];

                in.read(b);

                String named = part.getSubmittedFileName();

                int count = 0;
                String name=named;

                while (new File(path + name).exists()) {
                    count++;
                    name = "(" + count + ")" + named;
                }

                System.out.println("New Path: " + path + name);

                saveFile(path + name, b, user);

                files.add(name);
            }
        }
        return files.stream().collect(Collectors.joining(","));
    }

    private void saveFile(String path, byte[] data, User user) {
        try {
            
            FileOutputStream fout = new FileOutputStream(path);
            fout.write(data);
            fout.flush();
            fout.close();
        } catch (IOException ex) {
            Logger.getLogger(NewPost.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void createDir(String path){
        File temp = new File(path);
        if (!temp.exists()) {
            temp.mkdir();
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
