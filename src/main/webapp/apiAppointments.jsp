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

    <title>Appointment API Viewer | Sunrise Dental Clinic</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/style.css">
</head>

<body>

<div class="dashboard-container">

    <h1>Appointment API Viewer</h1>

    <p>
        Search appointment information retrieved through the
        Sunrise Dental Clinic REST API.
    </p>

    <div class="search-form">

        <div class="form-group">

            <label for="apiAppointmentNumber">
                Appointment Number
            </label>

            <input type="text"
                   id="apiAppointmentNumber"
                   placeholder="e.g. APP001">

        </div>

        <button type="button"
                onclick="searchApiAppointment()">
            Search Using API
        </button>

    </div>

    <div id="apiMessage"></div>

    <div id="apiResult"
         class="appointment-details"
         style="display: none;">

        <h2>API Appointment Result</h2>

        <div class="details-grid">

            <div class="detail-item">
                <span>Appointment Number</span>
                <strong id="resultAppointmentNumber"></strong>
            </div>

            <div class="detail-item">
                <span>Patient Name</span>
                <strong id="resultPatientName"></strong>
            </div>

            <div class="detail-item">
                <span>Address</span>
                <strong id="resultAddress"></strong>
            </div>

            <div class="detail-item">
                <span>Contact Number</span>
                <strong id="resultContact"></strong>
            </div>

            <div class="detail-item">
                <span>Dentist</span>
                <strong id="resultDentist"></strong>
            </div>

            <div class="detail-item">
                <span>Treatment</span>
                <strong id="resultTreatment"></strong>
            </div>

            <div class="detail-item">
                <span>Appointment Date</span>
                <strong id="resultDate"></strong>
            </div>

            <div class="detail-item">
                <span>Appointment Time</span>
                <strong id="resultTime"></strong>
            </div>

            <div class="detail-item">
                <span>Status</span>
                <strong id="resultStatus"></strong>
            </div>

            <div class="detail-item">
                <span>Notes</span>
                <strong id="resultNotes"></strong>
            </div>

        </div>

    </div>

    <a href="<%= request.getContextPath() %>/dashboard.jsp">
        ← Back to Dashboard
    </a>

</div>


<script>

    const contextPath = '<%= request.getContextPath() %>';

    async function searchApiAppointment() {

        const appointmentNumber =
            document.getElementById("apiAppointmentNumber")
                .value.trim();

        const message =
            document.getElementById("apiMessage");

        const result =
            document.getElementById("apiResult");

        message.innerHTML = "";
        result.style.display = "none";

        if (appointmentNumber === "") {
            message.innerHTML =
                '<div class="error-message search-message">' +
                'Please enter an appointment number.' +
                '</div>';
            return;
        }

        try {

            const response = await fetch(
                contextPath +
                "/api/appointments?appointmentNumber=" +
                encodeURIComponent(appointmentNumber)
            );

            if (!response.ok) {

                const errorData = await response.json();

                message.innerHTML =
                    '<div class="error-message search-message">' +
                    (errorData.error || "Unable to find appointment.") +
                    '</div>';

                return;
            }

            const appointment = await response.json();

            document.getElementById("resultAppointmentNumber")
                .textContent = appointment.appointmentNumber;

            document.getElementById("resultPatientName")
                .textContent = appointment.patientName;

            document.getElementById("resultAddress")
                .textContent = appointment.patientAddress;

            document.getElementById("resultContact")
                .textContent = appointment.patientContactNumber;

            document.getElementById("resultDentist")
                .textContent = appointment.dentistName;

            document.getElementById("resultTreatment")
                .textContent = appointment.treatmentName;

            document.getElementById("resultDate")
                .textContent = appointment.appointmentDate;

            document.getElementById("resultTime")
                .textContent = appointment.appointmentTime;

            document.getElementById("resultStatus")
                .textContent = appointment.status;

            document.getElementById("resultNotes")
                .textContent =
                    appointment.notes &&
                    appointment.notes.trim() !== ""
                        ? appointment.notes
                        : "-";

            result.style.display = "block";

        } catch (error) {

            message.innerHTML =
                '<div class="error-message search-message">' +
                'Unable to connect to the Appointment API.' +
                '</div>';

            console.error(error);
        }
    }

</script>

</body>

</html>