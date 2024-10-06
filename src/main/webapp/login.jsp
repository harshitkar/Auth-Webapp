<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <title>Login Page</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <h1 class="text-center">Login</h1>

                    <%
                    String login_invalid = (String) session.getAttribute("login-failed");
                    if (login_invalid != null) { %>
                        <div class="alert alert-danger" role="alert">
                            <%= login_invalid %>
                        </div>
                        <% session.removeAttribute("login-failed");
                    } %>

                    <%
                    String logoutMsg = (String) session.getAttribute("logout-msg");
                    if (logoutMsg != null) { %>
                        <div class="alert alert-success" role="alert">
                            <%= logoutMsg %>
                        </div>
                        <% session.removeAttribute("logout-msg");
                    } %>

                    <form action="<%= request.getContextPath() %>/login" method="post">
                        <div class="form-group">
                            <label for="user_email">Email</label>
                            <input type="email" class="form-control" id="user_email" name="user_email" placeholder="Enter your email" required>
                        </div>

                        <div class="form-group">
                            <label for="user_password">Password</label>
                            <input type="password" class="form-control" id="user_password" name="user_password" placeholder="Enter your password" required>
                        </div>

                        <button type="submit" class="btn btn-primary btn-block">Login</button>
                    </form>

                    <div class="text-center mt-3">
                        Don't have an account?
                        <a href="register.jsp" class="btn btn-link">Register here</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>