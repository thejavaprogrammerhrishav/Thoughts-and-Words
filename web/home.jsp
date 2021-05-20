<%@page import="com.hdsoft.techblog.utils.HomeUtils"%>
<%@page import="java.util.Map"%>
<%@page import="com.hdsoft.techblog.utils.DateUtils"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="com.hdsoft.techblog.dao.LikeDao"%>
<%@page import="java.util.Collections"%>
<%@page import="com.hdsoft.techblog.models.Post"%>
<%
    List<Post> posts = Dao.getPostDao().findAll();
    List<Category> categories = Dao.getCategoryDao().findAll();

    User cu = (User) session.getAttribute("currentUser");

    String search = request.getParameter("search");
    if (search != null && !search.isEmpty()) {
        posts = posts.parallelStream().filter(f -> {
            return f.getTitle().toLowerCase().contains(search.toLowerCase())
                    || f.getSubTitle().toLowerCase().contains(search.toLowerCase())
                    || f.getContent().toLowerCase().contains(search.toLowerCase());
        }).collect(Collectors.toList());
    }

    String date = request.getParameter("date");
    if (date != null && !date.isEmpty()) {
        posts = posts.parallelStream().filter(f -> {
            return f.getDate().equals(DateUtils.convert(date));
        }).collect(Collectors.toList());
    }

    String auth = request.getParameter("auth");
    if (auth != null && !auth.isEmpty()) {
        posts = HomeUtils.users(posts, auth);

    }

    String cate = request.getParameter("cate");
    if (cate != null && !cate.isEmpty()) {
        try {
            posts = posts.parallelStream().filter(f -> f.getCategoryId() == Long.parseLong(cate)).collect(Collectors.toList());
        } catch (Exception e) {

        }

    }

%>


<%@page import="com.hdsoft.techblog.utils.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="commons/css.jsp" %>
        <link rel="stylesheet" type="text/css" href="css/homePage.css">

        <title>Home Page</title>
    </head>
    <body>
        <%@include file="commons/js.jsp" %>
        <%@include file="commons/navbar.jsp" %>
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron  primary-bg text-white m-0" style="height: 30vh;">
                <div class="container">
                    <h1 class="display-4">Welcome To Titi's Thoughts and Words </h1>
                    <p> Write your thoughts and untold words.... </p>

                    <%
                        User current = (User) session.getAttribute("currentUser");
                        if (current == null) {
                    %>
                    <a href="signup.jsp" class="btn btn-outline-light mt-4 px-5">
                        <i class="fa fa-user-plus"></i> Sign Up 
                    </a>
                    <a href="login.jsp" class="btn btn-outline-light mt-4 px-5 ml-3">
                        <i class="fa fa-lock"></i> Login 
                    </a>
                    <% } else {%>
                    <a href="#postlist" class="btn btn-outline-light px-5">Show Posts</a>
                    <%}%>

                </div>
            </div>
        </div>
        <div class="container-fluid py-3 mb-5 searchbar">
            <div class="px-5 mx-3" style="max-height: 40px !important;">
                <div class="row">
                    <div class="col-md-3 col-sm-5 m-0">
                        <div>
                            <input type="text" class="form-control my-0" name="searchtxt" id="searchtxt" placeholder="Search Post Here">
                        </div>
                    </div>
                    <div class="col-md-3 m-0">
                            <button class="btn btn-outline-light px-3 mr-3" onclick="searchtxt()">Search Post</button>
                            <button class="btn btn-outline-light px-3 mr-3" onclick="searchauth()">Search By Author</button>
                            <button class="btn btn-outline-light px-3 mr-3" onclick="window.location.href = 'home.jsp'">All Posts</button>
                        </div>

                    <div class="col-md-2 col-sm-4 m-0">
                        <div class="form-group">
                            <input type="date" class="form-control d-block my-0" name="searchdate" id="searchtxtdate" placeholder="Search Post By Date">
                        </div>
                    </div>
                    <div class="col-md-1 col-sm-1 m-0">
                        <button class="btn btn-outline-light btn-block px-3" onclick="searchDate()">Search Post</button>
                    </div>
                    <div class="col-md-2 col-sm-4 m-0">
                        <div class="form-group">
                            <select class="form-control" id="categorySel">
                                <option value="-1" selected disabled>Select Category</option>
                                <%
                                    for (Category c : categories) {
                                %>
                                <option value="<%= c.getId()%>"><%= c.getCategory()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-1 col-sm-1 text-center">
                        <button class="btn btn-outline-light btn-block px-3" onclick="searchCategory()">Search Post</button>
                    </div>
                </div> 
            </div>
        </div>
        <div class="container-fluid px-5" id="postlist">
            <div class="px-5 mx-5">
                <div class="card-deck">
                    <%
                        if (posts.size() == 0) {
                    %>
                    <div class="col-md-12 text-center">
                        <h1>No Posts Found</h1>
                    </div>
                    <%
                    } else {
                        Collections.reverse(posts);
                        LikeDao dao = Dao.getLikeDao();
                        for (Post p : posts) {
                            if (!p.getPrivacy().equalsIgnoreCase("public")) {
                                continue;
                            }
                            User user = Dao.getUserDao().findById(p.getUserId());
                            Category c = Dao.getCategoryDao().findById(p.getCategoryId());
                            int count = dao.countLikes(p.getId());
                    %>
                    <div class="col-md-3 mb-4 px-0">
                        <div class="card">
                            <div class="card-header primary-bg text-white pb-2">
                                <h4 class="card-title p-0 pt-2"><%= p.getTitle()%></h4>
                                <p class="m-0"><%= c.getCategory()%></p>
                                <small class="p-0"><%= p.getDate()%> &nbsp;&nbsp;  <%= p.getTime()%></small>
                            </div>
                            <div class="card-body" style="max-height: 5rem; height: 5rem; overflow: hidden;">
                                <p class="card-text"><%= p.getContent()%></p>
                            </div>
                            <div class="card-body">
                                <p class="m-0 posted-by"> Posted By</p>

                                <p class="m-0 post"> <%= user.getName()%></p>
                            </div>
                            <div class="card-footer comment-footer">
                                <%
                                    if (cu != null) {
                                %>
                                <a href="#!" onclick="like_dislike(<%= p.getId()%>)" class="btn <%= (!dao.isliked(current.getId(), p.getId())) ? "btn-outline-primary" : "btn-primary"%> btn-sm py-1" id="likebtn<%= p.getId()%>">
                                    <i class="fa fa-thumbs-o-up"></i>
                                    <span id="liketext<%= p.getId()%>"><%= (dao.isliked(current.getId(), p.getId()) ? "Liked" : "Like")%></span>
                                    <span class="mx-2" id="count<%= p.getId()%>"><%= count%></span>
                                </a>
                                <% }%>
                                <a href="#!" onClick="goToPost(<%= p.getId()%>)" class="btn btn-outline-success btn-sm p-2 px-3">Read More</a>
                            </div>
                        </div>
                    </div>

                    <%
                            }
                        }
                    %> 

                </div>
            </div>
        </div>

        <script src="js/viewpost.js"></script>
        <script src="js/like.js"></script>
        <script src="js/home.js"></script>
    </body>
</html>
