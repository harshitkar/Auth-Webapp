<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <title>Register Page</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <h2 class="text-center">Registration</h2>

                    <%
                    String registration_success = (String) session.getAttribute("reg-success");
                    if (registration_success != null) { %>
                        <div class="alert alert-success" role="alert">
                            <%= registration_success %>
                            <a href="login.jsp" class="alert-link">Click here to login!</a>
                        </div>
                        <% session.removeAttribute("reg-success");
                    } %>

                    <%
                    String registration_failed = (String) session.getAttribute("failed-msg");
                    if (registration_failed != null) { %>
                        <div class="alert alert-danger" role="alert">
                            <%= registration_failed %>
                        </div>
                        <% session.removeAttribute("failed-msg");
                    } %>

                    <form action="<%= request.getContextPath() %>/Register" method="post">
                        <div class="form-group">
                            <label for="user_name">Full Name</label>
                            <input type="text" class="form-control" id="user_name" name="user_name" placeholder="Enter your full name" required>
                        </div>

                        <div class="form-group">
                            <label for="user_email">Email</label>
                            <input type="email" class="form-control" id="user_email" name="user_email" placeholder="Enter your email" required>
                        </div>

                        <div class="form-group">
                            <label for="user_password">Password</label>
                            <input type="password" class="form-control" id="user_password" name="user_password" placeholder="Enter your password" required>
                        </div>

                        <button type="submit" class="btn btn-primary btn-block">Register</button>
                    </form>

                    <div class="text-center mt-3">
                        Already have an account?
                        <a href="login.jsp" class="btn btn-link">Login here</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>