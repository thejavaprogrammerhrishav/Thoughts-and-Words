
<%@page import="com.hdsoft.techblog.utils.DateUtils"%>
<%
    User cu = (User) session.getAttribute("currentUser");
    if (cu == null) {
        session.setAttribute("msg", new Message("You are not logged in... Login first...", "alert-danger"));
        response.sendRedirect("login.jsp");
        return;
    }

    List<Category> cl = Dao.getCategoryDao().findAll();
%>
<%%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="commons/css.jsp" %>
        <link rel="stylesheet" type="text/css" href="css/homePage.css">
        <link rel="stylesheet" type="text/css" href="css/post.css">
        <title>Add Blog | Thoughts and Words </title>
    </head>
    <body>
        <%@include file="commons/js.jsp" %>
        <%@include file="commons/navbar.jsp" %>

        <div class="container-fluid px-5 mt-5">
            <div class="mx-5 px-5">
                <h2 class="my-3">Add New Post</h2>

                <%
                    Message msg = (Message) session.getAttribute("msg");
                    if (msg != null) {
                %>
                <div class="alert <%= msg.getCssClass()%>"><%= msg.getMessage()%></div>
                <%
                        session.removeAttribute("msg");
                    }
                %>


                <form id="postForm" class="mb-5" action="NewPost" method="post" enctype="multipart/form-data">
                     <input type="hidden" readonly id="userid" name="currentUser" value="<%= cu.getId() %>">
                    <div class="row my-2 mx-0">
                 
                        <div class="form-group col-md-4">
                            <label for="name">User Name</label>
                            <input type="text" readonly id="name" name="name" value="<%= cu.getName()%>" class="form-control" placeholder="Current User Name">
                        </div>
                         <div class="form-group col-md-3 offset-md-1">
                            <label for="date">Date</label>
                            <input type="text" id="date" name="date" value="<%= DateUtils.getDate() %>" class="form-control" placeholder="Post Date" readonly>
                        </div>
                        <div class="form-group col-md-3 offset-md-1">
                            <label for="time">Time</label>
                            <input type="text" id="time" name="time" value="<%= DateUtils.getTime() %>" class="form-control" placeholder="Post Time" readonly>
                        </div>
                       
                    </div>
                    <div class="row my-2 mx-0">
                        <div class="form-group col-md-12">
                            <label for="title">Post Title</label>
                            <input type="text" id="title" name="title" value="" class="form-control" placeholder="Enter Post Title">
                        </div>
                    </div>
                    <div class="row my-2 mx-0">
                        <div class="form-group col-md-12">
                            <label for="sub-title">Post Sub Title</label>
                            <input type="text" id="sub-title" name="subtitle" value="" class="form-control" placeholder="Enter Post Sub Title">
                        </div>
                    </div>
                    <div class="row my-2 mx-0">
                        <div class="form-group col-md-6">
                            <label for="category">Category</label>
                            <select class="form-control" name="category" id="category" required>
                                <option class="my-1" value="-1" selected disabled>Select Category</option>
                                <%
                                    for (Category c : cl) {
                                %>
                                <option class="my-1" value="<%= c.getId()%>"><%= c.getCategory()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group col-md-4 offset-md-1">
                            <label for="visibility">Post Visibility</label>
                            <select class="form-control" name="visibility" id="visibility" required>
                                <option class="my-1" value="-1" selected disabled>Select Post Visibility</option>
                                <option class="my-1" value="Public">Visible To All</option>
                                <option class="my-1" value="Protected">Visible To User With Link</option>
                                <option class="my-1" value="Private">Visible To Me Only</option>
                            </select>
                        </div>
                    </div>
                    <div class="row my-2 mx-0 p-0">
                        <div class="form-group col-md-12 px-0">
                            <label for="content">Post Content</label>
                            <%@include file="commons/postcontent.jsp" %>
                            <iframe id="content" class="form-control p-0" name="content" style="height: 40rem;"></iframe>
                            <input type="hidden" name="postContent" id="postContent" value="">
                        </div>
                    </div>
                    <div class="row my-2 mx-0">
                        <div class="col-md-8">
                            <h3>Files List</h3>
                        </div>
                        <div class="col-md-4 text-right">
                            <button type="button" id="addFile" class="btn btn-outline-success px-5 mr-3">Add File</button>
                            <button type="button" id="clearFiles" class="btn btn-outline-danger px-5">Clear</button>
                        </div>
                    </div>
                    <hr>
                    <div class="row my-3 mx-0">
                        <ul id="fileList" class="list-group list-group-horizontal-md d-flex justify-content-start flex-wrap">

                        </ul>
                    </div>
                    <hr>
                    <div class="my-5 p-0">
                        <input type="hidden" id="totalFiles" name="totalFiles">
                        <input type="submit" id="savePost" class="btn btn-outline-primary px-5" value="Save Post">
                    </div>
                </form>
            </div>
        </div>
        <script src="js/post.js"></script>
    </body>
</html>
