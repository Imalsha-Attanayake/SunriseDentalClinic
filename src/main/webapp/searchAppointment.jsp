<%@ page import="com.sunrise.dental.model.User" %>
<%@ page import="com.sunrise.dental.model.Appointment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User loggedInUser = (User) session.getAttribute("loggedInUser");

    if (loggedInUser == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    Appointment appointment =
            (Appointment) request.getAttribute("appointment");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Search Appointment | Sunrise Dental Clinic</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/style.css">
</head>

<body>

<div class="dashboard-container">

    <h1>Search Appointment</h1>

    <p>Enter the appointment number to view complete appointment details.</p>

    <!-- Search Form -->
    <form action="<%= request.getContextPath() %>/search-appointment"
          method="get"
          class="search-form">

        <div class="form-group">

            <label for="appointmentNumber">
                Appointment Number
            </label>

            <input type="text"
                   id="appointmentNumber"
                   name="appointmentNumber"
                   placeholder="e.g. APP001"
                   required>

        </div>

        <button type="submit">
            Search Appointment
        </button>

    </form>


    <!-- Error Message -->
    <% if (request.getAttribute("errorMessage") != null) { %>

        <div class="error-message search-message">
            <%= request.getAttribute("errorMessage") %>
        </div>

    <% } %>


    <!-- Appointment Details -->
    <% if (appointment != null) { %>

        <div class="appointment-details">

            <h2>Appointment Details</h2>

            <div class="details-grid">

                <div class="detail-item">
                    <span>Appointment Number</span>
                    <strong>
                        <%= appointment.getAppointmentNumber() %>
                    </strong>
                </div>

                <div class="detail-item">
                    <span>Patient Name</span>
                    <strong>
                        <%= appointment.getPatientName() %>
                    </strong>
                </div>

                <div class="detail-item">
                    <span>Address</span>
                    <strong>
                        <%= appointment.getPatientAddress() %>
                    </strong>
                </div>

                <div class="detail-item">
                    <span>Contact Number</span>
                    <strong>
                        <%= appointment.getPatientContactNumber() %>
                    </strong>
                </div>

                <div class="detail-item">
                    <span>Dentist</span>
                    <strong>
                        <%= appointment.getDentistName() %>
                    </strong>
                </div>

                <div class="detail-item">
                    <span>Treatment</span>
                    <strong>
                        <%= appointment.getTreatmentName() %>
                    </strong>
                </div>

                <div class="detail-item">
                    <span>Appointment Date</span>
                    <strong>
                        <%= appointment.getAppointmentDate() %>
                    </strong>
                </div>

                <div class="detail-item">
                    <span>Appointment Time</span>
                    <strong>
                        <%= appointment.getAppointmentTime() %>
                    </strong>
                </div>

                <div class="detail-item">
                    <span>Status</span>
                    <strong>
                        <%= appointment.getStatus() %>
                    </strong>
                </div>

                <div class="detail-item">
                    <span>Notes</span>
                    <strong>
                        <%= appointment.getNotes() != null
                                && !appointment.getNotes().trim().isEmpty()
                                ? appointment.getNotes()
                                : "-" %>
                    </strong>
                </div>

            </div>

        </div>

    <% } %>


    <a href="<%= request.getContextPath() %>/dashboard.jsp">
        ← Back to Dashboard
    </a>

</div>

</body>

</html>