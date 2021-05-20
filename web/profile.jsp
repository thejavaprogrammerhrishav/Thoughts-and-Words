
<%@page import="com.hdsoft.techblog.dao.LikeDao"%>
<%@page import="com.hdsoft.techblog.utils.DateUtils"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.hdsoft.techblog.models.Post"%>
<%@page import="com.hdsoft.techblog.utils.Message"%>
<%@page import="com.hdsoft.techblog.models.User"%>


<%
    User current = (User) session.getAttribute("currentUser");
    if (current == null) {
        session.setAttribute("msg", new Message("You Are Not Logged In.... Login First...", "alert-danger"));
        response.sendRedirect("login.jsp");
        return;
    }

    List<Post> posts = new ArrayList<>();
    List<Category> categories = new ArrayList<>();
    String currCate = "All Categories";

    LikeDao dao = Dao.getLikeDao();

    try {
        posts = Dao.getPostDao().findByUserId(current.getId());
        categories = Dao.getCategoryDao().findByUserId(current.getId());

        String cid = request.getParameter("category");
        String type = request.getParameter("type");
        String search = request.getParameter("search");
        String date = request.getParameter("date");

        if (cid != null && !cid.isEmpty()) {
            posts = posts.stream().filter(f -> f.getCategoryId() == Long.parseLong(cid)).collect(Collectors.toList());
            currCate = Dao.getCategoryDao().findById(Long.parseLong(cid)).getCategory();
        }

        if (search != null && !search.isEmpty() && type != null && !type.isEmpty()) {
            String str = search.replaceAll("%20", " ");
            if (type.equals("title")) {
                posts = posts.stream().filter(f -> f.getTitle().toLowerCase().contains(str.toLowerCase())).collect(Collectors.toList());
            } else if (type.equals("subtitle")) {
                posts = posts.stream().filter(f -> f.getSubTitle().toLowerCase().contains(str.toLowerCase())).collect(Collectors.toList());
            } else if (type.equals("content")) {
                posts = posts.stream().filter(f -> f.getContent().toLowerCase().contains(str.toLowerCase())).collect(Collectors.toList());
            } else {

            }
        }

        if (date != null && !date.isEmpty()) {
            String postDate = DateUtils.convert(date);
            posts = posts.stream().filter(f -> f.getDate().equals(postDate)).collect(Collectors.toList());
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="commons/css.jsp" %>
        <link rel="stylesheet" type="text/css" href="css/homePage.css">
        <title>Profile Page</title>
    </head>
    <body>
        <%@include file="commons/js.jsp" %>
        <%@include file="commons/navbar.jsp" %>


        <%
            Message msg = (Message) session.getAttribute("msg");
            if (msg != null) {
        %>

        <div class="alert <%= msg.getCssClass()%>" role="alert">
            <h5 class="mt-2"><%= msg.getMessage()%></h5>
        </div>

        <% session.removeAttribute("msg");
            }
        %>

        <div class="container-fluid px-5">
            <div class="row mt-4 mb-3">
                <div class="col-md-2">
                    <h2 class="my-1">All Posts</h2>
                </div>
                <div class="col-md-1 offset-md-9">
                    <button class="btn content-btn" onclick="window.location.href = 'profile.jsp?vtype=1'">
                        <i class="fa fa-list" style="font-size: 1.5rem;"></i>
                    </button>
                    <button class="btn content-btn" onclick="window.location.href = 'profile.jsp?vtype=0'">
                        <i class="fa fa-th-large" style="font-size: 1.5rem;"></i>
                    </button>
                </div>
            </div>
        </div>

        <div id="tiles">        
            <div class="container-fluid px-5">
                <div class="row">
                    <div class="col-md-12 col-lg-2">
                        <div class="my-5">
                            <ul class="list-group" id="categoryList">
                                <li class="list-group-item active searchbar">
                                    <a>Current Category</a>
                                </li>
                                <li class="list-group-item">
                                    <%
                                        if (currCate != null) {
                                    %>
                                    <a><%= currCate%></a>
                                    <%
                                        }
                                    %>
                                </li>
                            </ul>
                        </div>
                        <div class="my-3 mt-5">
                            <ul class="list-group" id="categoryList">
                                <li class="list-group-item active searchbar">
                                    <a>Post Categories</a>
                                </li>
                                <li class="list-group-item">
                                    <a onClick="changeClass(-1)" style="cursor: pointer;">All Categories</a>
                                </li>
                                <%
                                    for (Category c : categories) {
                                %>
                                <li class="list-group-item">
                                    <a onClick="changeClass(<%= c.getId()%>)" style="cursor: pointer;"><%= c.getCategory()%></a>
                                </li>
                                <%
                                    }
                                %>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-7">
                        <%
                            if (posts.size() == 0) {
                        %>
                        <h2 class="my-5">No Posts Found</h2>
                        <%
                        } else {
                            for (Post c : posts) {
                                int count = dao.countLikes(c.getId());
                        %>
                        <div class="row my-5">
                            <div class="col-md-12 col-lg-12">
                                <div class="card">
                                    <div class="card-header pt-4 primary-bg text-white">
                                        <h4><%= c.getTitle()%></h4>
                                        <p class="p-0 m-0"><%= c.getSubTitle()%></p>
                                        <div class="row p-0 m-0">
                                            <div class="col-md-12 col-lg-4  p-0 m-0">
                                                <p>Date: <%= c.getDate()%></p>
                                            </div>
                                            <div class="col-md-12 col-lg-4  p-0 m-0">
                                                <p>Time: <%= c.getTime()%></p>
                                            </div>
                                            <div class="col-md-12 col-lg-4  p-0 m-0">
                                                <p>Visibility: <%= c.getPrivacy()%></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body py-4" style="max-height: 10rem; height: 10rem; overflow: hidden;">
                                        <%= c.getContent()%>
                                    </div>
                                    <div class="card-footer">
                                        <%
                                            if (current != null) {
                                        %>
                                        <a href="#!" onclick="like_dislike(<%= c.getId()%>)" class="btn <%= (!dao.isliked(current.getId(), c.getId())) ? "btn-outline-primary" : "btn-primary"%> btn-sm" id="likebtn<%= c.getId()%>">
                                            <i class="fa fa-thumbs-o-up"></i>
                                            <span id="liketext<%= c.getId()%>"><%= (dao.isliked(current.getId(), c.getId()) ? "Liked" : "Like")%></span>
                                            <span class="mx-2" id="count<%= c.getId()%>"><%= count%></span>
                                        </a>
                                        <% }%>                                    
                                        <button onclick="goToPost(<%= c.getId()%>)" class="btn btn-outline-success btn-sm px-3 py-1 post-btn"><i class="fa fa-eye" style="font-size: 0.95rem;"></i><span>View Post</span></button>
                                        <button onclick="deletePost(<%= c.getId()%>)" class="btn btn-outline-danger btn-sm px-5 py-1 post-btn"><i class="fa fa-trash" style="font-size: 0.95rem;"></i><span>Delete</span></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                    <div class="col-md-12 col-lg-3">
                        <div class="my-3 mt-5">
                            <ul class="list-group">
                                <li class="list-group-item active searchbar">
                                    <a href="profile.jsp" class="text-white">Search Post Here</a>
                                </li>
                                <li class="list-group-item form-group px-3 pt-4 text-center">
                                    <input type="text" class="form-control" id="search" name="search" placeholder="Search Post Here..." value="" >
                                    <div class="row my-3 pt-2">
                                        <div class="col-md-6">
                                            <button onclick="search('title')" type="button" class="btn btn-outline-success mr-2 px-3 btn-sm btn-block">Search By Title</button>
                                        </div>
                                        <div class="col-md-6">
                                            <button onclick="search('subtitle')" type="button" class="btn btn-outline-primary ml-2 px-3 btn-sm btn-block">Search By Sub Title</button>
                                        </div>
                                    </div>
                                    <div class="my-3 pt-2">
                                        <button onclick="search('content')" type="button" class="btn btn-outline-danger mr-2 px-3 btn-sm btn-block">Search By Content</button>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="my-3 mt-5">
                            <ul class="list-group">
                                <li class="list-group-item active searchbar">
                                    <a href="profile.jsp" class="text-white">Search Post Here</a>
                                </li>
                                <li class="list-group-item form-group px-3 pt-4 text-center">
                                    <input type="date" class="form-control" id="searchDate" name="searchDate" value="" >
                                    <div class="my-3 pt-2">
                                        <button onclick="dateSearch()" type="button" class="btn btn-outline-danger mr-2 px-3 btn-sm btn-block">Search By Date</button>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="tables">
            <div class="container-fluid px-5">
                <div class="row my-5">
                    <div class="col-md-2">
                        <h4>Search Post Here</h4>
                    </div>
                    <div class="col-md-4">
                        <input type="text" class="form-control" id="tsearch" name="search" placeholder="Search Post Here..." value="" >
                    </div>
                    <div class="col-md-6">
                        <button onclick="searcht('title')" type="button" class="btn btn-outline-success px-3 mx-3">Search By Title</button>
                        <button onclick="searcht('subtitle')" type="button" class="btn btn-outline-primary px-3 mx-3">Search By Sub Title</button>
                        <button onclick="searcht('content')" type="button" class="btn btn-outline-danger px-3 mx-3">Search By Content</button>
                        <button onclick="window.location.href = 'profile.jsp?vtype=1';" type="button" class="btn btn-outline-danger px-5 mx-3">Load All Posts</button>
                    </div>
                </div>
                <div class="row my-5">
                    <div class="col-md-2">
                        <h4>Search Post By Date</h4>
                    </div>
                    <div class="col-md-4">
                        <input type="date" class="form-control" id="tsearchDate" name="searchDate" value="">
                    </div>
                    <div class="col-md-6 text-left">
                        <button onclick="tdateSearch()" type="button" class="btn btn-outline-danger mx-3 px-3">Search By Date</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-borderless" width="100%">
                            <thead class="bg-primary text-white">
                                <tr>
                                    <th scope="col" colspan="3" width="25%">Title</th>
                                    <th scope="col" colspan="3" width="15%">Category</th>
                                    <th scope="col">Date</th>
                                    <th scope="col" colspan="2" width="30%">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    if (posts.size() == 0) {
                                %>
                                <tr>
                                    <td colspan="7">
                                        <h1 class="text-center">No Post Found</h1>
                                    </td>
                                </tr>
                                <%
                                } else {
                                    for (Post p : posts) {
                                        Category c = Dao.getCategoryDao().findById(p.getCategoryId());
                                        int count = dao.countLikes(p.getId());
                                %>
                                <tr>
                                    <th scope="row" colspan="3" width="25%"><%= p.getTitle()%></th>
                                    <td colspan="3" width="15%"><%= c.getCategory()%></td>
                                    <td><%= p.getDate()%></td>
                                    <td colspan="3"width="30%">
                                        <div class="container-fluid">
                                            <div class="row">

                                                <%
                                                    if (current != null) {
                                                %>
                                                <div class="col-md-4 ml-0 pl-0">
                                                    <a href="#!" onclick="like_dislike(<%= p.getId()%>)" class="btn btn-block <%= (!dao.isliked(current.getId(), p.getId())) ? "btn-outline-primary" : "btn-primary"%> btn-sm" id="likebtn1<%= p.getId()%>">
                                                        <i class="fa fa-thumbs-o-up"></i>
                                                        <span id="liketext1<%= p.getId()%>"><%= (dao.isliked(current.getId(), p.getId()) ? "Liked" : "Like")%></span>
                                                        <span class="mx-2" id="count1<%= p.getId()%>"><%= count%></span>
                                                    </a>
                                                    <% }%>  
                                                </div>
                                                <div class="col-md-4 ml-0 pl-0">
                                                    <button onclick="goToPost(<%= p.getId()%>)" class="btn btn-block btn-outline-success btn-sm px-3 py-1 post-btn"><i class="fa fa-eye" style="font-size: 0.95rem;"></i><span>View Post</span></button>
                                                </div>
                                                <div class="col-md-4 ml-0 pl-0">
                                                    <button onclick="deletePost(<%= p.getId()%>)" class="btn btn-block btn-outline-danger btn-sm px-3 py-1 post-btn"><i class="fa fa-trash" style="font-size: 0.95rem;"></i><span>Delete</span></button>
                                                </div>
                                            </div>  
                                        </div>
                                    </td>
                                </tr>
                                <%
                                        }
                                    }
                                %>


                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/viewpost.js" defer></script>
        <script src="js/like.js" defer></script>
        <script>
                                                        let b = true;
                                                        $(document).ready(function () {
                                                            $('#tables').hide();
                                                            $('#tiles').show();

                                                            let val = window.location.href;
                                                            let url = new URL(val);
                                                            let vtype = url.searchParams.get("vtype");
                                                            if (vtype === "0") {
                                                                $('#tables').hide();
                                                                $('#tiles').show();
                                                                b = true;
                                                            } else if (vtype === "1") {
                                                                $('#tiles').hide();
                                                                $('#tables').show();
                                                                b = false;
                                                            }
                                                        })
        </script>

    </body>
</html>
