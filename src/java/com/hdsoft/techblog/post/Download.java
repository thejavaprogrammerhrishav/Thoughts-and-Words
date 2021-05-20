package com.hdsoft.techblog.post;

import com.hdsoft.techblog.models.PostFile;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Download extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            List<PostFile> files = (List<PostFile>) session.getAttribute("postFiles");
            String fileName = request.getParameter("file");
            if (fileName != null && !fileName.isEmpty() && files.size()>0) {
                List<PostFile> collect = files.stream().filter(f->f.getName().equals(fileName)).collect(Collectors.toList());
                if(collect.size()==1){
                    response.setContentType("application/octet-stream");
                    response.setContentLengthLong(collect.get(0).getData().length);
                    
                    response.setHeader("Content-Disposition", "attachment; filename=\""+collect.get(0).getName()+"\"");
                    
                    ByteArrayInputStream bin=new ByteArrayInputStream(collect.get(0).getData());
                    
                    int i;
                    while((i=bin.read())!=-1){
                        out.write(i);
                    }
                    bin.close();
                    out.close();
                }
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
