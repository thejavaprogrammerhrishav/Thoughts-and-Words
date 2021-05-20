<%@page import="java.util.stream.Collectors"%>
<!DOCTYPE html>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
    List<Category> l;
    User x = (User) session.getAttribute("currentUser");
    String s = request.getParameter("s");
    String t = request.getParameter("t");
    if (x == null) {
        session.setAttribute("msg", new Message("You are not logged in... Login first...", "alert-danger"));
        response.sendRedirect("login.jsp");
        return;
    } else {
        l = Dao.getCategoryDao().findByUserId(x.getId());
        if (t != null && s != null && !t.isEmpty() && !s.isEmpty()) {
            System.out.println(s);
            List<Category> list = new ArrayList<>(l);
            l.clear();
            if (t.equalsIgnoreCase("c")) {
                /*for (Category c : list) {
                    if (c.getCategory().toLowerCase().contains(s.toLowerCase())) {
                        l.add(c);
                    }
                }*/
                l=list.stream().filter(f->f.getCategory().toLowerCase().contains(s.toLowerCase())).collect(Collectors.toList());

            } else if (t.equalsIgnoreCase("d")) {
                for (Category c : list) {
                    if (c.getDescription().toLowerCase().contains(s.toLowerCase())) {
                        l.add(c);
                    }
                }
            } else {
                l = new ArrayList<>(list);
            }
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="commons/css.jsp" %>
        <link rel="stylesheet" type="text/css" href="css/homePage.css">
        <title>All Categories | Thoughts and Words </title>
    </head>
    <body>
        <%@include file="commons/js.jsp" %>

        <%@include file="commons/navbar.jsp" %>
        <%@include file="commons/editcategory.jsp" %>

        <div class="container-fluid mt-5 px-5">
            <div class="px-5">
                <h1>All Categories</h1>
                <div class="container-fluid my-5">
                    <div class="row form-inline">
                        <div class="col-md-1 form-group">
                            <label for="search">Search Here</label>
                        </div>
                        <div class="col-md-5 form-group">
                            <input type="text" class="form-control" style="width: 100%;"  id="search" name="search" placeholder="Enter Category or Description Here">
                        </div>
                        <div class="col-md-5 search-actions">
                            <button id="serByCate" class="btn btn-outline-primary px-4 mr-3"><i class="fa fa-search mr-2"></i>Search By Category</button>
                            <button id="serByDesc" class="btn btn-outline-success px-4 mr-3"><i class="fa fa-search mr-2"></i>Search By Description</button>
                            <button id="showAll" class="btn btn-outline-secondary px-4"><i class="fa fa-refresh mr-2"></i>Refresh</button>
                        </div>
                    </div>
                </div>
                <%
                    Message msg = (Message) session.getAttribute("msg");
                    if (msg != null) {
                %>
                <div class="alert <%= msg.getCssClass()%>"><%= msg.getMessage()%></div>
                <%
                        session.removeAttribute("msg");
                    }
                %>
                <div id="err-msg"></div>
                <table class="table mt-3">
                    <thead class="primary-bg text-white">
                        <tr>
                            <th scope="col">Category ID</th>
                            <th scope="col">Category</th>
                            <th scope="col" style="width: 60%;">Description</th>
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Category c : l) {
                        %>
                        <tr>
                            <th scope="row"><%= c.getId()%></th>
                            <td><%= c.getCategory()%></td>
                            <td><%= c.getDescription()%></td>
                            <td>
                                <button class="btn btn-outline-success btn-sm mr-3 px-4 edit" data-id="<%= c.getId()%>"><i class="fa fa-edit mr-2"></i>Edit</button>
                                <a href="Category?id=<%= c.getId()%>" class="btn btn-outline-danger btn-sm px-4"><i class="fa fa-trash mr-2"></i>Delete</a>
                            </td>
                        </tr>
                        <%}%>

                    </tbody>
                </table>
            </div>
        </div>
        <h1 id="txt-msg"></h1>


        <script src="js/allcategory.js" type="text/javascript"></script>


    </body>
</html>
