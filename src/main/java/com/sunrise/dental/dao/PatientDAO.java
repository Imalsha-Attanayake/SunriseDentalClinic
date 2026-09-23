package com.sunrise.dental.dao;

import com.sunrise.dental.model.Patient;
import com.sunrise.dental.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PatientDAO {

    // Add a new patient
    public boolean addPatient(Patient patient) {

        String sql = "INSERT INTO patients " +
                "(patient_name, address, contact_number) " +
                "VALUES (?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(
                    1,
                    patient.getPatientName()
            );

            statement.setString(
                    2,
                    patient.getAddress()
            );

            statement.setString(
                    3,
                    patient.getContactNumber()
            );

            int rowsAffected = statement.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    // Retrieve all patients
    public List<Patient> getAllPatients() {

        List<Patient> patients = new ArrayList<>();

        String sql =
                "SELECT * FROM patients ORDER BY patient_name";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                Patient patient = new Patient();

                patient.setPatientId(
                        resultSet.getInt("patient_id")
                );

                patient.setPatientName(
                        resultSet.getString("patient_name")
                );

                patient.setAddress(
                        resultSet.getString("address")
                );

                patient.setContactNumber(
                        resultSet.getString("contact_number")
                );

                patients.add(patient);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return patients;
    }
}