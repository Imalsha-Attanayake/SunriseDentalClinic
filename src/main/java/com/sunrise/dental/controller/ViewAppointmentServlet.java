package com.sunrise.dental.controller;

import com.sunrise.dental.dao.AppointmentDAO;
import com.sunrise.dental.model.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/view-appointments")
public class ViewAppointmentServlet extends HttpServlet {

    private AppointmentDAO appointmentDAO;

    @Override
    public void init() {
        appointmentDAO = new AppointmentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve all appointments from the database
        List<Appointment> appointments =
                appointmentDAO.getAllAppointments();

        // Send appointment list to JSP page
        request.setAttribute("appointments", appointments);

        // Open View Appointments page
        request.getRequestDispatcher("/viewAppointments.jsp")
                .forward(request, response);
    }
}