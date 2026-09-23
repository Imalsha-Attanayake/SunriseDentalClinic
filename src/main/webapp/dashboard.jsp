<%@ page import="com.sunrise.dental.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Prevent browser from caching the protected dashboard
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    User loggedInUser = (User) session.getAttribute("loggedInUser");

    if (loggedInUser == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Dashboard | Sunrise Dental Clinic</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>

<div class="dashboard-container">

    <h1>Sunrise Dental Clinic</h1>

    <p>
        Welcome,
        <strong><%= loggedInUser.getUsername() %></strong>
    </p>

    <div class="dashboard-menu">

        <button type="button"
                onclick="window.location.href='<%= request.getContextPath() %>/appointment'">
            Register Appointment
        </button>

        <button type="button"
                onclick="window.location.href='<%= request.getContextPath() %>/view-appointments'">
            View Appointments
        </button>

        <button type="button"
                onclick="window.location.href='<%= request.getContextPath() %>/search-appointment'">
            Search Appointment
        </button>

        <button type="button"
                onclick="window.location.href='<%= request.getContextPath() %>/billing'">
            Billing
        </button>

        <button type="button"
                onclick="window.location.href='<%= request.getContextPath() %>/reports'">
            Reports
        </button>

        <button type="button"
                onclick="window.location.href='<%= request.getContextPath() %>/help.jsp'">
            Help
        </button>


        <button type="button"
               onclick="window.location.href='<%= request.getContextPath() %>/apiAppointments.jsp'">
           Appointment API Viewer
        </button>
    </div>


 <div class="logout-section">
     <button type="button"
             class="logout-button"
             onclick="window.location.href='<%= request.getContextPath() %>/logout'">
         Logout
     </button>
 </div>

</div>

</body>
</html>