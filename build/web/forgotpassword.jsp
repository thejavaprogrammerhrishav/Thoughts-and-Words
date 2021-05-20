
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password | Thoughts and Words </title>
        <%@include file="commons/css.jsp" %>
        <link rel="stylesheet" href="css/homePage.css" type="text/css">

    </head>
    <body>
        <%@include file="commons/navbar.jsp" %>

        <section style="height: 90vh;">
            <div class="container" style="height: 100%;">
                <div class="row align-items-center" style="height: 100%;">
                    <div class="col-md-12">
                        <div class="card p-4 m-4">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <img src="img/forgot.jpg" class="img-fluid" alt="Image" >
                                    </div>
                                    <div class="col-md-5 offset-md-1 px-4">
                                        <form action="ForgotPassword" method="post">
                                            <div class="text-center my-3">
                                                <h3> Forgot Password </h3>
                                                <p>Enter The Details Below To Reset Password</p>
                                            </div>
                                            <div class="form-group my-5">
                                                <label for="username">Username</label>
                                                <input type="text" class="form-control" name="username" id="username" placeholder="Enter Username" required>
                                            </div>
                                            <div class="form-group my-5">
                                                <label for="email">Email ID</label>
                                                <input type="email" class="form-control" name="email" id="email" placeholder="Enter Email ID" required>
                                            </div>
                                            <div class="my-5">
                                                <input type="submit" value="Reset Password" class="btn btn-success px-4 mr-2">
                                                <input type="reset" value="Clear" class="btn btn-danger px-5 ml-2">
                                            </div>
                                            <%
                                                Message msg=(Message) session.getAttribute("msg");
                                                if(msg!=null){
                                            %>
                                            <div class="alert <%= msg.getCssClass() %>">
                                                <p><%= msg.getMessage() %></p>
                                            </div>
                                            <%
                                                session.removeAttribute("msg");
                                                }
                                            %>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>





        <%@include file="commons/js.jsp" %>
    </body>
</html>
