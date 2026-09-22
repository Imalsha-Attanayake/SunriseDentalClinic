<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Login | Sunrise Dental Clinic</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>

<div class="login-container">

    <div class="login-card">

        <h1>Sunrise Dental Clinic</h1>
        <p class="login-subtitle">Appointment & Patient Management System</p>

        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/login"
              method="post">

            <div class="form-group">
                <label for="username">Username</label>
                <input type="text"
                       id="username"
                       name="username"
                       placeholder="Enter username"
                       required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password"
                       id="password"
                       name="password"
                       placeholder="Enter password"
                       required>
            </div>

            <button type="submit" class="login-button">
                Login
            </button>

        </form>

    </div>

</div>

</body>
</html>