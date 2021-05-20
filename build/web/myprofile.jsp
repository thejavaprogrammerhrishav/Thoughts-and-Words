
<%@page import="java.util.Base64"%>
<%@page import="com.hdsoft.techblog.utils.Message"%>
<%@page import="com.hdsoft.techblog.models.User"%>
<%
    User current = (User) session.getAttribute("currentUser");
    if (current == null) {
        session.setAttribute("msg", new Message("You Are Not Logged In... Login First...", "alert-danger"));
        response.sendRedirect("login.jsp");
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
        <title>My Profile || Thoughts and Words </title>
        <style>
            .instagram{
                background: radial-gradient(circle at 30% 107%, #fdf497 0%, #fdf497 5%, #fd5949 45%, #d6249f 60%, #285AEB 90%);
                -webkit-background-clip: text;
                background-clip: text;
                -webkit-text-fill-color: transparent;
            }

        </style>
    </head>
    <body>
        <%@include file="commons/js.jsp" %>

        <%@include file="commons/navbar.jsp" %>
        <div class="d-flex align-items-center primary-bg banner-background" style="height: 93vh; padding-bottom: 50px;">
            <div class="container text-center">
                <div class="row">
                    <div class="col-md-8 offset-md-2">
                        <div class="card">
                            <div class="card-header primary-bg text-white">
                                <h3 class="mt-3"> Thoughts and Words - User Profile</h3>
                            </div>
                            <div class="card-body text-left">
                                <div class="text-center">
                                    <i class="fa fa-user-circle my-2" style="font-size: 7rem;"></i>
                                    <br>
                                    <h3 class="mt-2 mb-3"><%=current.getName()%></h3>
                                </div>
                                <div class="text-center my-2"> 
                                    <%
                                        String facebook, instagram, twitter;
                                        try {
                                            facebook = new String(Base64.getDecoder().decode(current.getFacebook()));
                                            instagram = new String(Base64.getDecoder().decode(current.getInstagram()));
                                            twitter = new String(Base64.getDecoder().decode(current.getTwitter()));
                                        } catch (Exception e) {
                                            facebook = "#";
                                            instagram = "#";
                                            twitter = "#";
                                        }
                                    %>
                                    <a class="mx-3" href="<%= facebook%>"> <i class="fa fa-facebook-official fa-2x" style="color: #1877f2;"></i></a>
                                    <a class="mx-3" href="<%= instagram%>"><i class="fa fa-instagram fa-2x instagram"></i></a>
                                    <a class="mx-3" href="<%= twitter%>"><i class="fa fa-twitter-square fa-2x" style="color: #28a8e0;"></i></a>
                                </div>
                                <div class="container px-5">
                                    <table class="table mt-4 px-5">
                                        <tbody>
                                            <tr>
                                                <th scope="row">ID:</th>
                                                <td><%=current.getId()%></td>
                                            </tr>

                                            <tr>
                                                <th scope="row">Contact:</th>
                                                <td><%=current.getContact()%></td>
                                            </tr>

                                            <tr>
                                                <th scope="row">Email ID:</th>
                                                <td><%=current.getEmail()%></td>
                                            </tr>

                                            <tr>
                                                <th scope="row">About:</th>
                                                <td><%=current.getAbout()%></td>
                                            </tr>

                                            <tr>
                                                <th scope="row">Gender:</th>
                                                <td><%=current.getGender()%></td>
                                            </tr>

                                            <tr>
                                                <th scope="row">Username</th>
                                                <td><%=current.getUsername()%></td>
                                            </tr>

                                            <tr>
                                                <th scope="row">Date of Creation:</th>
                                                <td><%=current.getDate()%></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="card-footer py-4">
                                <button class="btn btn-outline-primary mx-3 px-5" id="updateProfile"  data-toggle="modal" data-target="#editProfile"> Update Profile </button>
                                <button class="btn btn-outline-success mx-3 px-5" id="chngPassowrd" data-toggle="modal" data-target="#changePassword"> Change Password </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div> 

        <%@include file="commons/editprofile.jsp" %>
        <%@include file="commons/changepassword.jsp" %>



        <script src="js/changepassword.js"></script>

    </body>
</html>
