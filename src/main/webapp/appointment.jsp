<%@ page import="com.sunrise.dental.model.User" %>
<%@ page import="com.sunrise.dental.model.Patient" %>
<%@ page import="com.sunrise.dental.model.Dentist" %>
<%@ page import="com.sunrise.dental.model.Treatment" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User loggedInUser = (User) session.getAttribute("loggedInUser");

    if (loggedInUser == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    List<Patient> patients =
            (List<Patient>) request.getAttribute("patients");

    List<Dentist> dentists =
            (List<Dentist>) request.getAttribute("dentists");

    List<Treatment> treatments =
            (List<Treatment>) request.getAttribute("treatments");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Register Appointment | Sunrise Dental Clinic</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/style.css">
</head>

<body>

<div class="dashboard-container">

    <h1>Register Appointment</h1>

    <p>Enter the appointment details below.</p>

    <% if (request.getAttribute("successMessage") != null) { %>
        <div class="success-message">
            <%= request.getAttribute("successMessage") %>
        </div>
    <% } %>

    <% if (request.getAttribute("errorMessage") != null) { %>
        <div class="error-message">
            <%= request.getAttribute("errorMessage") %>
        </div>
    <% } %>


    <form action="<%= request.getContextPath() %>/appointment"
          method="post"
          class="appointment-form">


        <!-- Appointment Number -->
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


        <!-- Patient -->
        <div class="form-group">

            <label for="patientId">
                Patient
            </label>

            <select id="patientId"
                    name="patientId"
                    required>

                <option value="">
                    -- Select Patient --
                </option>

                <% if (patients != null) {
                    for (Patient patient : patients) { %>

                    <option value="<%= patient.getPatientId() %>">
                        <%= patient.getPatientName() %>
                    </option>

                <%  }
                   } %>

            </select>

        </div>


        <!-- Dentist -->
        <div class="form-group">

            <label for="dentistId">
                Dentist
            </label>

            <select id="dentistId"
                    name="dentistId"
                    required>

                <option value="">
                    -- Select Dentist --
                </option>

                <% if (dentists != null) {
                    for (Dentist dentist : dentists) { %>

                    <option value="<%= dentist.getDentistId() %>">
                        <%= dentist.getDentistName() %>
                    </option>

                <%  }
                   } %>

            </select>

        </div>


        <!-- Treatment -->
        <div class="form-group">

            <label for="treatmentId">
                Treatment
            </label>

            <select id="treatmentId"
                    name="treatmentId"
                    required>

                <option value="">
                    -- Select Treatment --
                </option>

                <% if (treatments != null) {
                    for (Treatment treatment : treatments) { %>

                    <option value="<%= treatment.getTreatmentId() %>">
                        <%= treatment.getTreatmentName() %>
                        - Rs. <%= String.format("%.2f",
                                treatment.getTreatmentFee()) %>
                    </option>

                <%  }
                   } %>

            </select>

        </div>


        <!-- Appointment Date -->
        <div class="form-group">

            <label for="appointmentDate">
                Appointment Date
            </label>

            <input type="date"
                   id="appointmentDate"
                   name="appointmentDate"
                   required>

        </div>


        <!-- Appointment Time -->
        <div class="form-group">

            <label for="appointmentTime">
                Appointment Time
            </label>

            <input type="time"
                   id="appointmentTime"
                   name="appointmentTime"
                   required>

        </div>


        <!-- Status -->
        <div class="form-group">

            <label for="status">
                Status
            </label>

            <select id="status"
                    name="status"
                    required>

                <option value="Scheduled">
                    Scheduled
                </option>

                <option value="Completed">
                    Completed
                </option>

                <option value="Cancelled">
                    Cancelled
                </option>

            </select>

        </div>


        <!-- Notes -->
        <div class="form-group full-width">

            <label for="notes">
                Notes
            </label>

            <textarea id="notes"
                      name="notes"
                      rows="4"
                      placeholder="Optional notes"></textarea>

        </div>


        <!-- Submit -->
        <button type="submit">
            Register Appointment
        </button>

    </form>


    <br>

    <a href="<%= request.getContextPath() %>/dashboard.jsp">
        ← Back to Dashboard
    </a>

</div>

<script>
    const appointmentDate =
        document.getElementById("appointmentDate");

    const today = new Date();

    const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, "0");
    const day = String(today.getDate()).padStart(2, "0");

    appointmentDate.min =
        year + "-" + month + "-" + day;
</script>

</body>

</html>