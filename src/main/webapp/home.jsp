<%@ page import="com.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Home</title>
</head>
<body>

<div class="container mt-5">
    <%
    User user = (User) session.getAttribute("userD");
    if (user != null) {
    %>
    <div class="row justify-content-center">
        <div class="col-md-8 text-center">
            <h2>Hello, <%= user.getName() %>! Welcome to our website.</h2>
            <p>Email: <%= user.getEmail() %></p>
            <p>Password: <%= user.getPassword() %></p>

            <form action="<%= request.getContextPath() %>/logout" method="post">
                <button type="submit" class="btn btn-danger">Logout</button>
            </form>
        </div>
    </div>
    <%
    } else {
    %>
    <div class="row justify-content-center">
        <div class="col-md-6 text-center">
            <h2>Please <a href="login.jsp" class="btn btn-primary">Login</a> to access your account.</h2>
        </div>
    </div>
    <%
    }
    %>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>