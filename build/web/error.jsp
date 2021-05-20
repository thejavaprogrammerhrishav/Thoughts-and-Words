
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="commons/css.jsp" %>
        <title>Error || Thoughts and Words </title>
    </head>
    <body>

        <div class="d-flex align-items-center" style="height: 100vh;">
            <div class="container text-center my-0 p-0">
                <div>
                    <div class="mx-auto my-3">
                        <img src="img/error.jpg" class="img-fluid">
                    </div>

                    <div class="mx-auto my-1">
                        <h2 class="display-4">Something Error Occurred</h2>
                        <p> <%=exception%>
                    </div>

                    <div class="mx-auto my-5">
                        <a href="home.jsp" class="btn btn-outline-success px-5">Home</a>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="commons/js.jsp" %>
    </body>
</html>
