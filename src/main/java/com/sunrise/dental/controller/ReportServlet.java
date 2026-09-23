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

@WebServlet("/reports")
public class ReportServlet extends HttpServlet {

    private AppointmentDAO appointmentDAO;

    @Override
    public void init() {
        appointmentDAO = new AppointmentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<Appointment> appointments =
                appointmentDAO.getAllAppointments();

        int totalAppointments = appointments.size();
        int scheduledCount = 0;
        int completedCount = 0;
        int cancelledCount = 0;

        double totalRevenue = 0.0;

        for (Appointment appointment : appointments) {

            if ("Scheduled".equalsIgnoreCase(
                    appointment.getStatus())) {

                scheduledCount++;

            } else if ("Completed".equalsIgnoreCase(
                    appointment.getStatus())) {

                completedCount++;
                totalRevenue += appointment.getTotalBill();

            } else if ("Cancelled".equalsIgnoreCase(
                    appointment.getStatus())) {

                cancelledCount++;
            }
        }

        request.setAttribute(
                "appointments",
                appointments
        );

        request.setAttribute(
                "totalAppointments",
                totalAppointments
        );

        request.setAttribute(
                "scheduledCount",
                scheduledCount
        );

        request.setAttribute(
                "completedCount",
                completedCount
        );

        request.setAttribute(
                "cancelledCount",
                cancelledCount
        );

        request.setAttribute(
                "totalRevenue",
                totalRevenue
        );

        request.getRequestDispatcher("/reports.jsp")
                .forward(request, response);
    }
}