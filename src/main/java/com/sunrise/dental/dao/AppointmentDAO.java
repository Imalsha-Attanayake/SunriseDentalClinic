package com.sunrise.dental.dao;

import com.sunrise.dental.model.Appointment;
import com.sunrise.dental.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;
import java.sql.Time;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

    public List<Appointment> getAllAppointments() {

        List<Appointment> appointments = new ArrayList<>();

        String sql = "SELECT a.appointment_id, a.appointment_number, " +
                "a.patient_id, p.patient_name, " +
                "a.dentist_id, d.dentist_name, " +
                "a.treatment_id, t.treatment_name, " +
                "a.appointment_date, a.appointment_time, " +
                "a.status, a.notes " +
                "FROM appointments a " +
                "JOIN patients p ON a.patient_id = p.patient_id " +
                "JOIN dentists d ON a.dentist_id = d.dentist_id " +
                "JOIN treatments t ON a.treatment_id = t.treatment_id " +
                "ORDER BY a.appointment_date, a.appointment_time";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                Appointment appointment = new Appointment();

                appointment.setAppointmentId(
                        resultSet.getInt("appointment_id"));

                appointment.setAppointmentNumber(
                        resultSet.getString("appointment_number"));

                appointment.setPatientId(
                        resultSet.getInt("patient_id"));

                appointment.setPatientName(
                        resultSet.getString("patient_name"));

                appointment.setDentistId(
                        resultSet.getInt("dentist_id"));

                appointment.setDentistName(
                        resultSet.getString("dentist_name"));

                appointment.setTreatmentId(
                        resultSet.getInt("treatment_id"));

                appointment.setTreatmentName(
                        resultSet.getString("treatment_name"));

                appointment.setAppointmentDate(
                        resultSet.getDate("appointment_date").toLocalDate());

                appointment.setAppointmentTime(
                        resultSet.getTime("appointment_time").toLocalTime());

                appointment.setStatus(
                        resultSet.getString("status"));

                appointment.setNotes(
                        resultSet.getString("notes"));

                appointments.add(appointment);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return appointments;
    }
}