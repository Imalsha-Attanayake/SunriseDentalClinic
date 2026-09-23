package com.sunrise.dental.controller;

import com.sunrise.dental.dao.AppointmentDAO;
import com.sunrise.dental.model.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/search-appointment")
public class SearchAppointmentServlet extends HttpServlet {

    private AppointmentDAO appointmentDAO;

    @Override
    public void init() {
        appointmentDAO = new AppointmentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String appointmentNumber =
                request.getParameter("appointmentNumber");

        if (appointmentNumber != null &&
                !appointmentNumber.trim().isEmpty()) {

            Appointment appointment =
                    appointmentDAO.getAppointmentByNumber(
                            appointmentNumber.trim()
                    );

            if (appointment != null) {

                request.setAttribute(
                        "appointment",
                        appointment
                );

            } else {

                request.setAttribute(
                        "errorMessage",
                        "No appointment found with appointment number "
                                + appointmentNumber + "."
                );
            }
        }

        request.getRequestDispatcher("/searchAppointment.jsp")
                .forward(request, response);
    }
}