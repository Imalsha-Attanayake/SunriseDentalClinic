package com.sunrise.dental.controller;

import com.sunrise.dental.dao.AppointmentDAO;
import com.sunrise.dental.dao.PatientDAO;
import com.sunrise.dental.dao.DentistDAO;
import com.sunrise.dental.dao.TreatmentDAO;

import com.sunrise.dental.model.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

@WebServlet("/appointment")
public class AppointmentServlet extends HttpServlet {

    private AppointmentDAO appointmentDAO;
    private PatientDAO patientDAO;
    private DentistDAO dentistDAO;
    private TreatmentDAO treatmentDAO;

    @Override
    public void init() {

        appointmentDAO = new AppointmentDAO();
        patientDAO = new PatientDAO();
        dentistDAO = new DentistDAO();
        treatmentDAO = new TreatmentDAO();
    }

    // Display appointment registration form
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        loadFormData(request);

        request.getRequestDispatcher("/appointment.jsp")
                .forward(request, response);
    }

    // Register new appointment
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String appointmentNumber =
                    request.getParameter("appointmentNumber");

            int patientId =
                    Integer.parseInt(request.getParameter("patientId"));

            int dentistId =
                    Integer.parseInt(request.getParameter("dentistId"));

            int treatmentId =
                    Integer.parseInt(request.getParameter("treatmentId"));

            LocalDate appointmentDate =
                    LocalDate.parse(request.getParameter("appointmentDate"));

            LocalTime appointmentTime =
                    LocalTime.parse(request.getParameter("appointmentTime"));

            String status =
                    request.getParameter("status");

            String notes =
                    request.getParameter("notes");

            // Create Appointment object
            Appointment appointment = new Appointment();

            appointment.setAppointmentNumber(appointmentNumber);
            appointment.setPatientId(patientId);
            appointment.setDentistId(dentistId);
            appointment.setTreatmentId(treatmentId);
            appointment.setAppointmentDate(appointmentDate);
            appointment.setAppointmentTime(appointmentTime);
            appointment.setStatus(status);
            appointment.setNotes(notes);

            // Save appointment
            boolean success =
                    appointmentDAO.addAppointment(appointment);

            if (success) {

                request.setAttribute(
                        "successMessage",
                        "Appointment registered successfully."
                );

            } else {

                request.setAttribute(
                        "errorMessage",
                        "Unable to register appointment."
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "An error occurred while registering the appointment."
            );
        }

        // Reload dropdown data after form submission
        loadFormData(request);

        request.getRequestDispatcher("/appointment.jsp")
                .forward(request, response);
    }

    // Load patients, dentists and treatments for dropdowns
    private void loadFormData(HttpServletRequest request) {

        request.setAttribute(
                "patients",
                patientDAO.getAllPatients()
        );

        request.setAttribute(
                "dentists",
                dentistDAO.getAllActiveDentists()
        );

        request.setAttribute(
                "treatments",
                treatmentDAO.getAllActiveTreatments()
        );
    }
}