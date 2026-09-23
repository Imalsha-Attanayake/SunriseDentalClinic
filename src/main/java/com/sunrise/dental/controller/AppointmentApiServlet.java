package com.sunrise.dental.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sunrise.dental.dao.AppointmentDAO;
import com.sunrise.dental.model.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import com.sunrise.dental.util.LocalDateAdapter;
import com.sunrise.dental.util.LocalTimeAdapter;

import java.time.LocalDate;
import java.time.LocalTime;

@WebServlet("/api/appointments")
public class AppointmentApiServlet extends HttpServlet {

    private AppointmentDAO appointmentDAO;
    private Gson gson;

    @Override
    public void init() throws ServletException {

        appointmentDAO = new AppointmentDAO();

        gson = new GsonBuilder()
                .registerTypeAdapter(
                        LocalDate.class,
                        new LocalDateAdapter()
                )
                .registerTypeAdapter(
                        LocalTime.class,
                        new LocalTimeAdapter()
                )
                .setPrettyPrinting()
                .create();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String appointmentNumber =
                request.getParameter("appointmentNumber");

        if (appointmentNumber != null &&
                !appointmentNumber.trim().isEmpty()) {

            Appointment appointment =
                    appointmentDAO.getAppointmentByNumber(
                            appointmentNumber.trim()
                    );

            if (appointment != null) {

                response.setStatus(
                        HttpServletResponse.SC_OK
                );

                response.getWriter().write(
                        gson.toJson(appointment)
                );

            } else {

                response.setStatus(
                        HttpServletResponse.SC_NOT_FOUND
                );

                response.getWriter().write(
                        "{\"error\":\"Appointment not found\"}"
                );
            }

        } else {

            List<Appointment> appointments =
                    appointmentDAO.getAllAppointments();

            response.setStatus(
                    HttpServletResponse.SC_OK
            );

            response.getWriter().write(
                    gson.toJson(appointments)
            );
        }
    }
}