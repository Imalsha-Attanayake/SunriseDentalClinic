<%@ page import="com.sunrise.dental.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User loggedInUser =
            (User) session.getAttribute("loggedInUser");

    if (loggedInUser == null) {
        response.sendRedirect(
                request.getContextPath() + "/login.jsp"
        );
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Register Patient | Sunrise Dental Clinic</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/style.css">
</head>

<body>

<div class="dashboard-container">

    <h1>Register Patient</h1>

    <p>Enter the patient's details below.</p>


    <!-- Success Message -->
    <% if (request.getAttribute("successMessage") != null) { %>

        <div class="success-message">
            <%= request.getAttribute("successMessage") %>
        </div>

    <% } %>


    <!-- Error Message -->
    <% if (request.getAttribute("errorMessage") != null) { %>

        <div class="error-message">
            <%= request.getAttribute("errorMessage") %>
        </div>

    <% } %>


    <!-- Patient Registration Form -->
    <form action="<%= request.getContextPath() %>/patient"
          method="post"
          class="appointment-form">


        <!-- Patient Name -->
        <div class="form-group">

            <label for="patientName">
                Patient Name
            </label>

            <input type="text"
                   id="patientName"
                   name="patientName"
                   placeholder="Enter patient name"
                   required>

        </div>


        <!-- Address -->
        <div class="form-group">

            <label for="address">
                Address
            </label>

            <input type="text"
                   id="address"
                   name="address"
                   placeholder="Enter patient address"
                   required>

        </div>


        <!-- Contact Number -->
        <div class="form-group">

            <label for="contactNumber">
                Contact Number
            </label>

            <input type="tel"
                   id="contactNumber"
                   name="contactNumber"
                   placeholder="Enter contact number"
                   required>

        </div>


        <!-- Submit -->
        <button type="submit">
            Register Patient
        </button>

    </form>


    <br>

    <a href="<%= request.getContextPath() %>/dashboard.jsp">
        ← Back to Dashboard
    </a>

</div>

</body>

</html>