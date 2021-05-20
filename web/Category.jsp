
<%@page import="java.sql.SQLException"%>
<%@page import="com.hdsoft.techblog.utils.Message"%>
<%@page import="com.hdsoft.techblog.utils.Dao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hdsoft.techblog.models.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.hdsoft.techblog.models.User"%>
<%
    String id = request.getParameter("id");
    Category cate;

    if (id == null || id.isEmpty()) {
        session.setAttribute("msg", new Message("Empty ID", "alert-danger"));
        response.sendRedirect("profile.jsp");
        return;
    } else {
        try {
            cate = Dao.getCategoryDao().findById(Long.parseLong(id));
            if (cate == null) {
                session.setAttribute("msg", new Message("Category Not Found", "alert-danger"));
                response.sendRedirect("profile.jsp");
                return;
            }
        } catch (NumberFormatException e) {
            session.setAttribute("msg", new Message("Invalid ID: " + id, "alert-danger"));
            response.sendRedirect("profile.jsp");
            return;
        } catch (SQLException e) {
            session.setAttribute("msg", new Message(e.getMessage(), "alert-danger"));
            response.sendRedirect("profile.jsp");
            return;
        }
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category | Thoughts and Words </title>
        <%@include file="commons/css.jsp" %>
        <link rel="stylesheet" href="css/homePage.css" type="text/css">
    </head>
    <body>
        <%@include file="commons/js.jsp" %>
        <%@include file="commons/navbar.jsp" %>

        <section style="height: 93vh;" class="banner-background primary-bg">
            <div class="container" style="height: 100%;">
                <div class="row align-items-center" style="height: 100%;">
                    <div class="col-md-12 col-lg-12">
                        <div class="card">
                            <div class="card-header primary-bg text-white pt-4 text-center">
                                <h3>Category Details</h3>
                                <p>Complete Details About A Post Category</p>
                            </div>
                            <div class="card-body">
                                <div class="form-group mb-5 mt-2">
                                    <label>Category</label>
                                    <input type="text" value="<%= cate.getCategory()%>" placeholder="Category" readonly class="form-control input-text">
                                </div>

                                <div class="form-group mb-5">
                                    <label>Category Description</label>
                                    <textarea type="text" value="<%= cate.getDescription()%>" rows="5" placeholder="Category Description" readonly class="form-control input-text"></textarea>
                                </div>
                                
                                <div class="form-group mb-5">
                                    <label>Date Added</label>
                                    <input type="text" value="<%= cate.getDate()%>" placeholder="Date Added" readonly class="form-control input-text">
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </body>
</html>
