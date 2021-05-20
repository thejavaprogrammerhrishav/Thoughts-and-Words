
<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    User current = (User) session.getAttribute("currentUser");
    if (current == null) {
        session.setAttribute("msg", new Message("You Are Not Logged In... Login First...", "alert-danger"));
        response.sendRedirect("login.jsp");
        return;
    }

    String id = request.getParameter("id");
    User cuser = null;
    if (id != null && !id.isEmpty()) {
        cuser = Dao.getUserDao().findById(Long.parseLong(id));
    }

    if (cuser == null) {
        session.setAttribute("msg", new Message("You Are Not Logged In... Login First...", "alert-danger"));
        response.sendRedirect("home.jsp");
        return;
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Thoughts and Words || View Author Profile</title>

        <%@include file="commons/css.jsp" %>
        <link href="css/homePage.css" rel="stylesheet" type="text/css">

        <style>
            .insta{
                background: linear-gradient(to bottom right, #fdf497 0%, #fdf497 5%, #fd5949 45%, #d6249f 60%, #285AEB 90%) !important;
                -webkit-background-clip: text;
                background-clip: text;
                color: #fff !important;
            }
            #body{
                background-image: radial-gradient( circle 422px at -10.3% 110.7%,  rgba(219,76,180,1) 9.5%, rgba(231,119,209,1) 50.8%, rgba(255,180,241,1) 88.5% );
            }
        </style>
    </head>
    <body>
        <%@include file="commons/js.jsp" %>
        <%@include file="commons/navbar.jsp" %>

        <div id="body" style="height: calc(100vh - 61px); width: 100% !important;" class="d-flex justify-content-center align-items-center">
            <div class="card m-auto p-3 primary-bg" style="width: 50%;">
                <div class="card-body text-white">
                    <div class="container-fluid p-0 m-0">
                        <div class="row">
                            <div class="col-md-3 text-center d-flex justify-content-center align-items-center">
                                <i class="fa fa-user" style="font-size: 200px;"></i>
                            </div>
                            <div class="col-md-9">
                                <h2 class="my-2 cl"><%= cuser.getName()%></h2>
                                <p cl><%= cuser.getContact()%></p>
                                <p cl><%= cuser.getEmail()%></p>
                                <p cl><%= cuser.getGender()%></p>
                                <p cl><%= cuser.getDate()%></p>

                                <div class="my-4 py-3" style="height: 5rem;">
                                    <p class="d-block"><%= cuser.getAbout()%></p>
                                </div>
                            </div>
                        </div>
                        <%
                            String facebook, instagram, twitter;
                            try {
                                facebook = new String(Base64.getDecoder().decode(cuser.getFacebook()));
                                instagram = new String(Base64.getDecoder().decode(cuser.getInstagram()));
                                twitter = new String(Base64.getDecoder().decode(cuser.getTwitter()));
                                System.out.println(cuser.getFacebook());
                            } catch (Exception e) {
                                facebook = "#"; 
                                instagram = "#";
                                twitter = "#";
                            }
                        %>
                        <div class="row text-center">
                            <div class="col-md-4" >
                                <buttton onclick="window.location.href = '<%= facebook%>'" class="btn px-5" style="background-color: #1877f2 !important; color: #fff !important">
                                    <i class="fa fa-facebook-official mr-2"></i>Connect With Facebook
                                </buttton>
                            </div>
                            <div class="col-md-4">
                                <buttton onclick="window.location.href = '<%= instagram%>'" class="btn px-5 insta">
                                    <i class="fa fa-instagram mr-2"></i>Connect With Instagram
                                </buttton>
                            </div>
                            <div class="col-md-4" >
                                <buttton onclick="window.location.href = '<%= twitter%>'" class="btn px-5" style="background-color: #28a8e0 !important; color: #fff !important">
                                    <i class="fa fa-twitter-square mr-2"></i>Connect With Twitter
                                </buttton>
                            </div>                          

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
