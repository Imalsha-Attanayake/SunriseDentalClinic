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

    Integer totalAppointments =
            (Integer) request.getAttribute("totalAppointments");

    Integer scheduledCount =
            (Integer) request.getAttribute("scheduledCount");

    Integer completedCount =
            (Integer) request.getAttribute("completedCount");

    Integer cancelledCount =
            (Integer) request.getAttribute("cancelledCount");

    Double totalRevenue =
            (Double) request.getAttribute("totalRevenue");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Reports | Sunrise Dental Clinic</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/style.css">

</head>

<body>

<div class="dashboard-container reports-container">

    <h1>Appointment Reports</h1>

    <p>
        View appointment statistics and billing information.
    </p>


    <!-- Summary Cards -->
    <div class="report-summary">

        <div class="report-card">

            <span>Total Appointments</span>

            <strong>
                <%= totalAppointments != null
                        ? totalAppointments : 0 %>
            </strong>

        </div>


        <div class="report-card">

            <span>Scheduled</span>

            <strong>
                <%= scheduledCount != null
                        ? scheduledCount : 0 %>
            </strong>

        </div>


        <div class="report-card">

            <span>Completed</span>

            <strong>
                <%= completedCount != null
                        ? completedCount : 0 %>
            </strong>

        </div>


        <div class="report-card">

            <span>Cancelled</span>

            <strong>
                <%= cancelledCount != null
                        ? cancelledCount : 0 %>
            </strong>

        </div>


        <div class="report-card revenue-card">

            <span>Total Revenue</span>

            <strong>
                Rs.
                <%= String.format(
                        "%.2f",
                        totalRevenue != null
                                ? totalRevenue : 0.0
                ) %>
            </strong>

        </div>

    </div>


    <!-- Detailed Report -->
    <div class="report-table-section">

        <h2>Detailed Appointment Report</h2>

        <div class="table-wrapper">

            <table class="appointments-table report-table">

                <thead>

                <tr>
                    <th>Appointment No.</th>
                    <th>Patient</th>
                    <th>Dentist</th>
                    <th>Treatment</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Treatment Fee</th>
                    <th>Consultation Fee</th>
                    <th>Total</th>
                </tr>

                </thead>

                <tbody>

                <% if (appointments != null &&
                       !appointments.isEmpty()) {

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
                            <%= appointment.getStatus() %>
                        </td>

                        <td>
                            Rs.
                            <%= String.format(
                                    "%.2f",
                                    appointment.getTreatmentFee()
                            ) %>
                        </td>

                        <td>
                            Rs.
                            <%= String.format(
                                    "%.2f",
                                    appointment.getConsultationFee()
                            ) %>
                        </td>

                        <td>
                            <strong>
                                Rs.
                                <%= String.format(
                                        "%.2f",
                                        appointment.getTotalBill()
                                ) %>
                            </strong>
                        </td>

                    </tr>

                <%  }

                   } else { %>

                    <tr>

                        <td colspan="9"
                            class="no-data">

                            No appointment records found.

                        </td>

                    </tr>

                <% } %>

                </tbody>

            </table>

        </div>

    </div>


    <a href="<%= request.getContextPath() %>/dashboard.jsp">
        ← Back to Dashboard
    </a>

</div>

</body>

</html>