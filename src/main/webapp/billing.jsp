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

    <title>Billing | Sunrise Dental Clinic</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/style.css">
</head>

<body>

<div class="dashboard-container billing-container">

    <h1>Patient Billing</h1>

    <p>Enter an appointment number to calculate the patient's bill.</p>

    <!-- Search Form -->
    <form action="<%= request.getContextPath() %>/billing"
          method="get"
          class="billing-search-form no-print">

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
            Calculate Bill
        </button>

    </form>


    <!-- Error Message -->
    <% if (request.getAttribute("errorMessage") != null) { %>

        <div class="error-message billing-message no-print">
            <%= request.getAttribute("errorMessage") %>
        </div>

    <% } %>


    <!-- Bill / Receipt -->
    <% if (appointment != null) { %>

        <div class="bill-receipt">

            <div class="receipt-header">

                <h2>Sunrise Dental Clinic</h2>

                <p>Patient Bill / Receipt</p>

            </div>


            <div class="receipt-details">

                <div>
                    <span>Appointment Number</span>
                    <strong>
                        <%= appointment.getAppointmentNumber() %>
                    </strong>
                </div>

                <div>
                    <span>Patient Name</span>
                    <strong>
                        <%= appointment.getPatientName() %>
                    </strong>
                </div>

                <div>
                    <span>Contact Number</span>
                    <strong>
                        <%= appointment.getPatientContactNumber() %>
                    </strong>
                </div>

                <div>
                    <span>Dentist</span>
                    <strong>
                        <%= appointment.getDentistName() %>
                    </strong>
                </div>

                <div>
                    <span>Treatment</span>
                    <strong>
                        <%= appointment.getTreatmentName() %>
                    </strong>
                </div>

                <div>
                    <span>Appointment Date</span>
                    <strong>
                        <%= appointment.getAppointmentDate() %>
                    </strong>
                </div>

            </div>


            <div class="bill-summary">

                <div class="bill-row">
                    <span>Treatment Fee</span>

                    <strong>
                        Rs.
                        <%= String.format("%.2f",
                                appointment.getTreatmentFee()) %>
                    </strong>
                </div>

                <div class="bill-row">
                    <span>Consultation Fee</span>

                    <strong>
                        Rs.
                        <%= String.format("%.2f",
                                appointment.getConsultationFee()) %>
                    </strong>
                </div>

                <div class="bill-row bill-total">
                    <span>Total Amount</span>

                    <strong>
                        Rs.
                        <%= String.format("%.2f",
                                appointment.getTotalBill()) %>
                    </strong>
                </div>

            </div>


            <button type="button"
                    class="print-button no-print"
                    onclick="window.print()">
                Print Bill
            </button>

        </div>

    <% } %>


    <a class="no-print"
       href="<%= request.getContextPath() %>/dashboard.jsp">
        ← Back to Dashboard
    </a>

</div>

</body>

</html>