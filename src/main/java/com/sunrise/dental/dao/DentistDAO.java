package com.sunrise.dental.dao;

import com.sunrise.dental.model.Dentist;
import com.sunrise.dental.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DentistDAO {

    public List<Dentist> getAllActiveDentists() {

        List<Dentist> dentists = new ArrayList<>();

        String sql = "SELECT * FROM dentists " +
                "WHERE status = 'Active' " +
                "ORDER BY dentist_name";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                Dentist dentist = new Dentist();

                dentist.setDentistId(
                        resultSet.getInt("dentist_id")
                );

                dentist.setDentistName(
                        resultSet.getString("dentist_name")
                );

                dentist.setSpecialization(
                        resultSet.getString("specialization")
                );

                dentist.setContactNumber(
                        resultSet.getString("contact_number")
                );

                dentist.setStatus(
                        resultSet.getString("status")
                );

                dentists.add(dentist);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return dentists;
    }
}