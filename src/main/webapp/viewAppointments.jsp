<%@ page import="com.sunrise.dental.model.User" %>
<%@ page import="com.sunrise.dental.model.Appointment" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User loggedInUser = (User) session.getAttribute("loggedInUser");

    if (loggedInUser == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    List<Appointment> appointments =
            (List<Appointment>) request.getAttribute("appointments");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>View Appointments | Sunrise Dental Clinic</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/style.css">
</head>

<body>

<div class="dashboard-container appointments-container">

    <h1>View Appointments</h1>

    <p>View all registered dental appointments.</p>

    <div class="table-wrapper">

        <table class="appointments-table">

            <thead>

            <tr>
                <th>Appointment No.</th>
                <th>Patient</th>
                <th>Dentist</th>
                <th>Treatment</th>
                <th>Date</th>
                <th>Time</th>
                <th>Status</th>
                <th>Notes</th>
            </tr>

            </thead>

            <tbody>

            <% if (appointments != null && !appointments.isEmpty()) {

                for (Appointment appointment : appointments) { %>

                    <tr>

                        <td>
                            <%= appointment.getAppointmentNumber() %>
                        </td>

                        <td>
                            <%= appointment.getPatientName() %>
                        </td>

                        <td>
                            <%= appointment.getDentistName() %>
                        </td>

                        <td>
                            <%= appointment.getTreatmentName() %>
                        </td>

                        <td>
                            <%= appointment.getAppointmentDate() %>
                        </td>

                        <td>
                            <%= appointment.getAppointmentTime() %>
                        </td>

                        <td>
                            <%= appointment.getStatus() %>
                        </td>

                        <td>
                            <%= appointment.getNotes() != null
                                    ? appointment.getNotes()
                                    : "-" %>
                        </td>

                    </tr>

            <%  }

               } else { %>

                <tr>
                    <td colspan="8" class="no-data">
                        No appointments found.
                    </td>
                </tr>

            <% } %>

            </tbody>

        </table>

    </div>

    <a href="<%= request.getContextPath() %>/dashboard.jsp">
        ← Back to Dashboard
    </a>

</div>

</body>

</html>