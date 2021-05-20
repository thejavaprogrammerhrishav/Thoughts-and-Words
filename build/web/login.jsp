

<%@page import="com.hdsoft.techblog.utils.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="commons/css.jsp" %>
        <link rel="stylesheet" type="text/css" href="css/homePage.css">
        <title>Login Page</title>
    </head>
    <body>
        <%@include file="commons/js.jsp" %>
        <%@include file="commons/navbar.jsp" %>

        <div class="d-flex align-items-center primary-bg banner-background" style="height: 90vh;">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <form action="Login" method="post" id="loginForm">
                            <div class="card">
                                <div class="card-header primary-bg text-white">
                                    <div class="text-center mt-2">
                                        <div>
                                            <i class="fa fa-user-plus fa-3x"></i>
                                        </div>
                                        <h2 class="card-title m-3">Login Here</h2>
                                    </div>
                                </div>

                                <%
                                    Message msg = (Message) session.getAttribute("msg");
                                    if (msg != null) {
                                %>

                                <div class="alert <%=msg.getCssClass()%>" role="alert">
                                    <p class="m-0 p-0 pt-1"><%=msg.getMessage()%></p>
                                </div>

                                <%
                                        session.removeAttribute("msg");
                                    }
                                %>

                                <div class="card-body">

                                    <div class="form-group mt-0">
                                        <label for="username" class="card-text">Username</label>
                                        <input type="text" id="username" name="username" class="form-control py-2" placeholder="Enter Username" required>
                                    </div>
                                    <div class="form-group mt-4">
                                        <label for="password">Password</label>
                                        <input type="password" id="password" name="password" class="form-control py-2" placeholder="Enter Password" required>
                                    </div>

                                </div>
                                <div class="card-footer">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <input type="submit" class="btn btn-outline-success px-5" value="Login">
                                        </div>
                                        <div class="col-md-6 offset-md-3 py-2 d-flex pr-2">
                                            <p> Forgot Password? </p>
                                            <a class="ml-4" href="forgotpassword.jsp">Click Here</a>
                                        </div>
                                    </div>
                                    <div class="mt-5 mb-3">
                                        <p class="card-text"> Don't Have Account? </p>
                                        <a href="signup.jsp" class="form-control btn btn-outline-primary">Create Account</a>
                                    </div>
                                </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
