<%@page import="com.hdsoft.techblog.utils.Dao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@page import="com.hdsoft.techblog.models.Category"%>
<%@page import="com.hdsoft.techblog.models.User"%>
<%
    {
        User u = (User) session.getAttribute("currentUser");
        List<Category> list = new ArrayList<>();
        if (u == null) {
            list = Dao.getCategoryDao().findAll();
        } else {
            list = Dao.getCategoryDao().findByUserId(u.getId());
        }

%>

<script src="js/nav.js"></script>

<nav class="navbar navbar-expand-lg navbar-dark primary-bg pl-5">
    <a class="navbar-brand" href="home.jsp"> <i class="fa fa-th-large"></i> Thoughts and Words</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active mx-2">
                <a class="nav-link" href="profile.jsp"> <i class="fa fa-home"></i> My Posts <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active mx-2">
                <a class="nav-link" href="newpost.jsp"><i class="fa fa-list-alt"></i> Create New Post </a>
            </li>
            <li class="nav-item active dropdown mx-2">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fa fa-tags"></i>Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <%for (Category c : list) {%>
                    <a class="dropdown-item" onClick="showCategory(<%= c.getId()%>)"><%= c.getCategory()%></a>
                    <% } %>

                    <% if (session.getAttribute("currentUser") != null) { %>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="" data-toggle="modal" data-target="#addCategory">Add Category</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="allcategory.jsp">All Category</a>
                    <% } %>
                </div>
            </li>
        </ul>
        <%
            User user = (User) session.getAttribute("currentUser");
            if (user != null) {
        %>
        <ul class="navbar-nav mr-right mr-4">
            <li class="nav-item active mx-2">
                <a class="nav-link" href="myprofile.jsp"> <i class="fa fa-user-circle" style="font-size: 1.2rem;"></i> <%= user.getName()%> </a>
            </li>
            <li class="nav-item mx-2 active">
                <a class="nav-link" href="Logout"><i class="fa fa-power-off" style="font-size: 1.2rem"></i> Logout</a>
            </li>
        </ul>
        <% } else { %>
        <ul class="navbar-nav mr-right mr-4">
            <li class="nav-item active mx-2">
                <a class="nav-link" href="login.jsp"> <i class="fa fa-user-circle" style="font-size: 1.2rem;"></i> Login </a>
            </li>
            <li class="nav-item mx-2 active">
                <a class="nav-link" href="signup.jsp"><i class="fa fa-user-plus" style="font-size: 1.2rem"></i> Sign Up</a>
            </li>
        </ul>
        <% }%>
    </div>
</nav>

<% }%>

<%@include file="../addcategory.jsp" %>
