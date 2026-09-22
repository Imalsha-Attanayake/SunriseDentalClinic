package com.sunrise.dental.dao;

import com.sunrise.dental.model.Appointment;
import com.sunrise.dental.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;
import java.sql.Time;

public class AppointmentDAO {

    public boolean addAppointment(Appointment appointment) {

        String sql = "INSERT INTO appointments " +
                "(appointment_number, patient_id, dentist_id, treatment_id, " +
                "appointment_date, appointment_time, status, notes) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, appointment.getAppointmentNumber());
            statement.setInt(2, appointment.getPatientId());
            statement.setInt(3, appointment.getDentistId());
            statement.setInt(4, appointment.getTreatmentId());

            statement.setDate(
                    5,
                    Date.valueOf(appointment.getAppointmentDate())
            );

            statement.setTime(
                    6,
                    Time.valueOf(appointment.getAppointmentTime())
            );

            statement.setString(7, appointment.getStatus());
            statement.setString(8, appointment.getNotes());

            int rowsInserted = statement.executeUpdate();

            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}