<%@page import="java.util.Base64"%>
<%@page import="com.hdsoft.techblog.utils.Message"%>
<%@page import="com.hdsoft.techblog.models.User"%>
<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null) {
        session.setAttribute("msg", new Message("You Are Not Logged In..... Login First...", "alert-danger"));
        response.sendRedirect("login.jsp");
        return;
    }

    boolean b = currentUser.getGender().equalsIgnoreCase("Male");
%>

<div class="modal fade" id="editProfile" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-md">
        <div class="modal-content">
            <div class="modal-header primary-bg">
                <h5 class="modal-title text-white ml-2" id="staticBackdropLabel">Thoughts and Words - Edit Profile</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="EditProfile" method="post" id="signupForm">
                <div class="modal-body m-0 p-0">

                    <div class="container p-0 m-0">
                        <div class="row pb-3">
                            <div class="col-md-12">
                                <form action="EditProfile" method="post" id="signupForm">
                                    <div class="card">
                                        <div class="card-header primary-bg text-white py-4 text-center">
                                            <i class="fa fa-user-circle fa-3x"> </i>
                                            <h3 class="mt-2">Please Enter Details Very Carefully</h3>
                                        </div>
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="name">Name</label>
                                                <input type="text" id="name" name="name" required class="form-control" placeholder="Enter Name" value="<%= currentUser.getName()%>">
                                            </div>
                                            <div class="row"> 
                                                <div class="col-md-7"> <div class="form-group">
                                                        <label for="email">Email ID</label>
                                                        <input type="email" id="email" name="email" required class="form-control" placeholder="Enter Email" value="<%= currentUser.getEmail()%>">
                                                    </div></div>
                                                <div class="col-md-5">
                                                    <div class="form-group">
                                                        <label for="contact">Contact</label>
                                                        <input type="tel" id="contact" name="contact" required class="form-control" placeholder="Enter Contact" value="<%= currentUser.getContact()%>">
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <label for="about">About</label>
                                                <textarea name="about" id="about" class="form-control" rows="3" cols="30" placeholder="Enter Something About Yourself" ><%= currentUser.getAbout()%></textarea>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-7">
                                                    <div class="form-group">
                                                        <label for="username">Username</label>
                                                        <input type="text" id="username" name="username" required class="form-control" placeholder="Enter Username" value="<%= currentUser.getUsername()%>">
                                                    </div>

                                                </div>
                                                <div class="col-md-5">
                                                    <div class="form-group">
                                                        <label for="genders">Gender</label>
                                                        <div class="mt-2" id="genders">
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input form-control-md" type="radio" id="check1" value="Male" name="gender" <%= (b) ? "checked" : ""%>>
                                                                <label class="form-check-label" for="check1">Male</label>
                                                            </div>
                                                            <div class="form-check form-check-inline">
                                                                <input class="form-check-input" type="radio" id="check2" value="Female" name="gender"  <%= (!b) ? "checked" : ""%>>
                                                                <label class="form-check-label" for="check2">Female</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <%
                                                String facebookLink, instagramLink, twitterLink;
                                                try {
                                                    facebookLink = new String(Base64.getDecoder().decode(currentUser.getFacebook()));
                                                    instagramLink = new String(Base64.getDecoder().decode(currentUser.getInstagram()));
                                                    twitterLink = new String(Base64.getDecoder().decode(currentUser.getTwitter()));
                                                } catch (Exception e) {
                                                    facebookLink = "#";
                                                    instagramLink = "#";
                                                    twitterLink = "#";
                                                }
                                            %>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="facebook"> <i class="fa fa-facebook-official mx-2"></i>Facebook Link</label>
                                                        <input type="text" name="facebook" id="facebook" class="form-control" placeholder="Enter Facebook Link" value="<%= facebookLink%>">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="instagram"><i class="fa fa-instagram mx-2"></i>Instagram Link</label>
                                                        <input type="text" name="instagram" id="instagram" class="form-control" placeholder="Enter Instagram Link" value="<%= instagramLink%>">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="twitter"><i class="fa fa-twitter-square mx-2"></i>Twitter Link</label>
                                                        <input type="text" name="twitter" id="twitter" class="form-control"  placeholder="Enter Twitter Link" value="<%= twitterLink%>">
                                                    </div>
                                                </div>
                                            </div>                    

                                            <div class="form-group">
                                                <label for="date">Account Creation Date</label>
                                                <input type="text" id="date" name="date" required class="form-control" placeholder="Account Creation Date" disabled value="<%= currentUser.getDate()%>">
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer py-3">
                    <div class="container text-center">
                        <button type="submit" class="btn btn-outline-primary px-5 mx-3">Edit Profile</button>
                        <button type="button" class="btn btn-outline-secondary px-5 mx-3"  data-dismiss="modal">Close</button>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
