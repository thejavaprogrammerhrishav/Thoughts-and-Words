

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="commons/css.jsp" %>
        <link rel="stylesheet" type="text/css" href="css/homePage.css">
        <title>Sign Up Page</title>
    </head>
    <body>
        <%@include file="commons/js.jsp" %>
        <%@include file="commons/navbar.jsp" %>

        <div class="d-flex banner-background primary-bg p-0 m-0">
            <div class="container mt-3 mb-5 pb-5">
                <div class="row pb-3">
                    <div class="col-md-12">
                        <form action="Register" method="post" id="signupForm">
                            <div class="card">
                                <div class="card-header primary-bg text-white py-4 text-center">
                                    <i class="fa fa-user-circle fa-3x"> </i>
                                    <h3 class="mt-2">Sign Up</h3>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="name">Name</label>
                                        <input type="text" id="name" name="name" required class="form-control" placeholder="Enter Name">
                                    </div>
                                    <div class="row"> 
                                        <div class="col-md-6"> <div class="form-group">
                                                <label for="email">Email ID</label>
                                                <input type="email" id="email" name="email" required class="form-control" placeholder="Enter Email">
                                            </div></div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="contact">Contact</label>
                                                <input type="tel" id="contact" name="contact" required class="form-control" placeholder="Enter Contact">
                                            </div>
                                        </div>
                                    </div>
                                    

                                    <div class="form-group">
                                        <label for="about">About</label>
                                        <textarea name="about" id="about" class="form-control" rows="3" cols="30" placeholder="Enter Something About Yourself"></textarea>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="username">Username</label>
                                                <input type="text" id="username" name="username" required class="form-control" placeholder="Enter Username">
                                            </div>

                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="genders">Gender</label>
                                                <div class="mt-2" id="genders">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input form-control-md" type="radio" id="check1" value="Male" name="gender">
                                                        <label class="form-check-label" for="check1">Male</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" id="check2" value="Female" name="gender">
                                                        <label class="form-check-label" for="check2">Female</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="password">Password</label>
                                                <input type="password" id="password" name="password" required class="form-control" placeholder="Enter Password">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="password">Confirm Password</label>
                                                <input type="password" id="cpassword" name="cpassword" required class="form-control" placeholder="Confirm Password">
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="card-footer pt-4">
                                    <input type="submit" class="btn btn-outline-primary px-5" value="Sign Up">
                                    <input type="reset" class="btn btn-outline-secondary ml-3 px-5" value="Reset">
                                    <hr class="my-4">
                                    <div class="d-flex align-items-center">
                                        <h6 class="mr-3">Already Have An Account? </h6>
                                        <a href="login.jsp" class="btn btn-outline-success px-5"> Login </a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/signup.js"></script>
    </body>
</html>
