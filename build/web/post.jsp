
<%@page import="java.util.Map"%>
<%@page import="java.util.function.Function"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="com.hdsoft.techblog.models.Comment"%>
<%@page import="com.hdsoft.techblog.utils.DateUtils"%>
<%@page import="com.hdsoft.techblog.dao.LikeDao"%>
<%@page import="com.hdsoft.techblog.models.PostFile"%>
<%@page import="com.hdsoft.techblog.utils.Files"%>
<%@page import="com.hdsoft.techblog.models.Post"%>
<%@page import="com.hdsoft.techblog.utils.Message"%>
<%@page import="com.hdsoft.techblog.models.User"%>
<%
    String post = (String) request.getParameter("post");
    if (post == null || post.isEmpty()) {
        session.setAttribute("msg", new Message("Post Id Not Found", "alert-danger"));
        response.sendRedirect("profile.jsp");
        return;
    }

    Post currentPost = null;
    Post p = null;
    User postUser = null;
    Category category;
    LikeDao dao = Dao.getLikeDao();

    User current = (User) session.getAttribute("currentUser");

    try {
        long postId = Long.parseLong(post);

        currentPost = Dao.getPostDao().findById(postId);

        if (currentPost == null) {
            session.setAttribute("msg", new Message("Post Not Found", "alert-danger"));
            response.sendRedirect("profile.jsp");
            return;
        }
        if (currentPost.getPrivacy().equalsIgnoreCase("private") && (current == null)) {
            session.setAttribute("msg", new Message("Post Visibility Is Set To Private, Cannot view the post", "alert-danger"));
            response.sendRedirect("login.jsp");
            return;
        }
        if (currentPost.getPrivacy().equalsIgnoreCase("private") && currentPost.getUserId() != current.getId()) {
            session.setAttribute("msg", new Message("Post Visibility Is Set To Private, Cannot view the post", "alert-danger"));
            response.sendRedirect("profile.jsp");
            return;
        }
        p = currentPost;

        postUser = Dao.getUserDao().findById(currentPost.getUserId());
        category = Dao.getCategoryDao().findById(currentPost.getCategoryId());

    } catch (Exception e) {
        session.setAttribute("msg", new Message(e.getMessage(), "alert-danger"));
        response.sendRedirect("profile.jsp");
        return;
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="commons/css.jsp" %>
        <link rel="stylesheet" type="text/css" href="css/homePage.css">
        <title>View Post Page</title>
    </head>
    <body>
        <%@include file="commons/js.jsp" %>
        <%@include file="commons/navbar.jsp" %>
        <script src="js/viewpost.js"></script>
        <div class="container-fluid m-0 px-5 pt-5">
            <div class="mx-5 px-5">
                <div class="mx-5 px-5">
                    <div class="card">
                        <div class="card-header primary-bg text-white" style="padding: 2.3rem !important;">
                            <div class="row">
                                <div class="col-md-12 col-lg-12">
                                    <h1><%= currentPost.getTitle()%></h1>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-lg-12">
                                    <h4><%= currentPost.getSubTitle()%></h4>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-lg-12">
                                    <p class="p-0 m-0 py-2"><%= currentPost.getDate()%> &nbsp; &nbsp; <%= currentPost.getTime()%></p>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 col-lg-12">
                                    <p cl>Posted By: <%= postUser.getName()%> &nbsp;&nbsp;&nbsp;&nbsp; Category: <%= category.getCategory()%></p>
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-md-12 col-lg-12">
                                    <%
                                        if (current != null) {
                                            int count = dao.countLikes(p.getId());
                                    %>
                                    <button href="#!" onclick="like_dislike(<%= p.getId()%>)" class="btn px-4 mr-3 <%= (!dao.isliked(current.getId(), p.getId())) ? "btn-primary" : "btn-primary"%> btn-sm" id="likebtn<%= p.getId()%>">
                                        <i class="fa fa-thumbs-o-up"></i>
                                        <span id="liketext<%= p.getId()%>"><%= (dao.isliked(current.getId(), p.getId()) ? "Liked" : "Like")%></span>
                                        <span class="mx-2" id="count<%= p.getId()%>"><%= count%></span>
                                    </button>
                                    <% }%>
                                    <%
                                        if (current != null && current.getId() == currentPost.getUserId()) {
                                    %>
                                    <button onClick="deletePost(<%= currentPost.getId()%>)" class="btn btn-sm btn-danger px-5 ml-3">
                                        <i class="fa fa-trash"></i>
                                        <span>Delete Post</span>
                                    </button>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row my-4">
                                <div class="col-md-12 col-lg-12">
                                    <p><%= currentPost.getContent()%></p>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer"  style="background-color: #fff !important;">
                            <div class="row my-4">
                                <div class="col-md-12 col-lg-12">
                                    <%
                                        session.removeAttribute("postFiles");
                                        if (!currentPost.getFiles().isEmpty()) {
                                            List<PostFile> files = Files.getFiles(currentPost.getFiles(), request, postUser);
                                            session.setAttribute("postFiles", files);
                                            if (files.size() > 0) {
                                    %>
                                    <h3 class="d-block text-center bg-primary py-3 text-white">File Downloads</h3>

                                    <ul id="fileList" class="list-group list-group-horizontal-md d-flex justify-content-start flex-wrap">
                                        <%
                                            for (PostFile file : files) {
                                        %>
                                        <li class="list-group-item m-2 p-0 ml-0">
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="File Name" aria-label="File Name" aria-describedby="button-addon2" readonly value="<%= file.getName()%>">
                                                <div class="input-group-append">
                                                    <button onclick="window.location.href = 'Download?file=<%= file.getName()%>'" class="btn btn-primary" type="button" id="button-addon2">Download</button>
                                                </div>
                                            </div>
                                        </li>
                                        <%
                                            }
                                        %>
                                    </ul> 

                                    <%
                                            }
                                        }
                                    %>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <h3 class="d-block bg-primary text-center py-3 text-white">Comments</h3>
                                    <%
                                        List<Comment> comments = Dao.getCommentDao().findByPostId(currentPost.getId());
                                        List<User> users = Dao.getUserDao().findAll();
                                        Map<Long, User> map = users.parallelStream().collect(Collectors.toMap(User::getId, Function.identity()));
                                        for (Comment com : comments) {
                                            User user = map.get(com.getUserid());
                                            User author = map.get(currentPost.getUserId());
                                    %>
                                    <div class="card my-4">
                                        <div class="card-header p-0 pt-3 bg-secondary text-white">
                                            <div class="container-fluid m-0 p-0">
                                                <div class="row p-0 m-0">
                                                    <div class="col-md-6">
                                                        <p>
                                                            <a href="profileview.jsp?id=<%= user.getId()%>" class="text-white">
                                                                <b><%= user.getName()%></b>
                                                            </a>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-6 text-right">
                                                        <p>Date: <%= com.getDate()%> &nbsp;&nbsp; <%= com.getTime()%> </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <h5><%= com.getComment()%></h5>
                                        </div>
                                        <%
                                            if (current != null && currentPost.getUserId() == current.getId() && com.getReply().isEmpty()) {
                                        %>
                                        <div class="comment-footer bg-light m-0 p-3">
                                            <p>Reply Here</p>
                                            <div class="form-group">
                                                <textarea class="form-control" placeholder="Enter Your Reply Here" id="replytxt<%= com.getId()%>" rows="3"></textarea>
                                            </div>
                                            <div>
                                                <button onclick="reply(<%= com.getId()%>,<%= currentPost.getId()%>)" class="btn btn-outline-success btn-sm px-4">Reply To Comment</button>
                                            </div>
                                        </div>
                                        <%
                                        } else if (!com.getReply().isEmpty()) {
                                        %>
                                        <div class="comment-footer m-0 p-3">
                                            <p class="m-0 p-0 my-2">
                                                <a href="profileview.jsp?id=<%= author.getId()%>" class="text-dark">
                                                    <b><%= author.getName()%> Replied:</b>
                                                </a>
                                            </p>
                                            <p class="m-0 p-0"><%= com.getReply()%></p>
                                        </div>
                                        <% } %>
                                    </div>
                                    <%
                                        }
                                    %>

                                    <%
                                        if (current != null) {
                                    %>
                                    <!--Add New Comment-->
                                    <div class="card my-4 p-0">
                                        <div class="card-header pt-3 bg-primary text-white p-0">
                                            <div class="container-fluid p-0 m-0">
                                                <div class="row p-0 m-0">
                                                    <div class="col-md-6">
                                                        <h4 class="d-block">Add New Comment</h4>
                                                    </div>
                                                    <div class="col-md-6 text-right">
                                                        <h4 id="commenterName"><%= current.getName()%></h4>
                                                        <p id="commentDateTime">Date: <%= DateUtils.getDate() + "    " + DateUtils.getTime()%></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div> 
                                        <div class="card-body">
                                            <div class="form-group">
                                                <textarea class="form-control" placeholder="Enter Your Comment Here" id="commenttxt" rows="3"></textarea>
                                            </div>
                                            <div>
                                                <button onclick="comment(<%= current.getId()%>,<%= currentPost.getId()%>, '<%= DateUtils.getDate()%>', '<%= DateUtils.getTime()%>')" class="btn btn-outline-success btn-sm px-4">Add Comment to the post</button>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                    <!--Add New COmment END-->
                                </div>
                            </div>    
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/like.js"></script>
        <script src="js/comment.js"></script>
    </body>
</html>
