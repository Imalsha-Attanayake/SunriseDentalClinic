<%@ page import="com.sunrise.dental.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
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

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Help | Sunrise Dental Clinic</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/style.css">
</head>

<body>

<div class="dashboard-container help-container">

    <h1>Help & User Guide</h1>

    <p>
        Follow the instructions below to use the Sunrise Dental Clinic system.
    </p>

    <div class="help-section">

        <div class="help-item">
            <h2>1. Register an Appointment</h2>

            <p>
                Select <strong>Register Appointment</strong> from the dashboard.
                Enter the appointment number, select the patient, dentist and
                treatment, choose the appointment date and time, and enter any
                necessary notes. Click <strong>Register Appointment</strong>
                to save the appointment.
            </p>
        </div>


        <div class="help-item">
            <h2>2. View Appointments</h2>

            <p>
                Select <strong>View Appointments</strong> from the dashboard
                to view all appointments currently registered in the system.
                The page displays the patient, dentist, treatment, date,
                time, status and notes for each appointment.
            </p>
        </div>


        <div class="help-item">
            <h2>3. Search for an Appointment</h2>

            <p>
                Select <strong>Search Appointment</strong> and enter the
                appointment number, such as APP001. Click
                <strong>Search Appointment</strong> to display the complete
                patient and appointment information.
            </p>
        </div>


        <div class="help-item">
            <h2>4. Calculate a Patient Bill</h2>

            <p>
                Select <strong>Billing</strong> from the dashboard and enter
                the appointment number. Click <strong>Calculate Bill</strong>.
                The system will calculate the total using the treatment fee
                and consultation fee.
            </p>
        </div>


        <div class="help-item">
            <h2>5. Print a Patient Bill</h2>

            <p>
                After calculating the bill, click
                <strong>Print Bill</strong>. The browser print window will
                open, allowing the bill to be printed or saved as a PDF.
            </p>
        </div>


        <div class="help-item">
            <h2>6. Exit the System</h2>

            <p>
                When you have finished using the system, return to the
                dashboard and use the <strong>Logout</strong> option to
                securely end your session.
            </p>
        </div>

    </div>


    <a href="<%= request.getContextPath() %>/dashboard.jsp">
        ← Back to Dashboard
    </a>

</div>

</body>

</html>