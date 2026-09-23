package com.sunrise.dental.controller;

import com.sunrise.dental.dao.PatientDAO;
import com.sunrise.dental.model.Patient;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/patient")
public class PatientServlet extends HttpServlet {

    private PatientDAO patientDAO;

    @Override
    public void init() {
        patientDAO = new PatientDAO();
    }

    // Display patient registration form
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
                session.getAttribute("loggedInUser") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp"
            );
            return;
        }

        request.getRequestDispatcher("/patient.jsp")
                .forward(request, response);
    }

    // Register new patient
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
                session.getAttribute("loggedInUser") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp"
            );
            return;
        }

        String patientName =
                request.getParameter("patientName");

        String address =
                request.getParameter("address");

        String contactNumber =
                request.getParameter("contactNumber");

        // Server-side validation
        if (patientName == null ||
                patientName.trim().isEmpty() ||
                address == null ||
                address.trim().isEmpty() ||
                contactNumber == null ||
                contactNumber.trim().isEmpty()) {

            request.setAttribute(
                    "errorMessage",
                    "Please complete all patient details."
            );

            request.getRequestDispatcher("/patient.jsp")
                    .forward(request, response);

            return;
        }

        patientName = patientName.trim();
        address = address.trim();
        contactNumber = contactNumber.trim();

        Patient patient = new Patient();

        patient.setPatientName(patientName);
        patient.setAddress(address);
        patient.setContactNumber(contactNumber);

        boolean success =
                patientDAO.addPatient(patient);

        if (success) {

            request.setAttribute(
                    "successMessage",
                    "Patient registered successfully."
            );

        } else {

            request.setAttribute(
                    "errorMessage",
                    "Unable to register patient."
            );
        }

        request.getRequestDispatcher("/patient.jsp")
                .forward(request, response);
    }
}