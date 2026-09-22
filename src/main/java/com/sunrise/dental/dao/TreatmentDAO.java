package com.sunrise.dental.dao;

import com.sunrise.dental.model.Treatment;
import com.sunrise.dental.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TreatmentDAO {

    public List<Treatment> getAllActiveTreatments() {

        List<Treatment> treatments = new ArrayList<>();

        String sql = "SELECT * FROM treatments " +
                "WHERE status = 'Active' " +
                "ORDER BY treatment_name";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                Treatment treatment = new Treatment();

                treatment.setTreatmentId(
                        resultSet.getInt("treatment_id")
                );

                treatment.setTreatmentName(
                        resultSet.getString("treatment_name")
                );

                treatment.setDescription(
                        resultSet.getString("description")
                );

                treatment.setTreatmentFee(
                        resultSet.getDouble("treatment_fee")
                );

                treatment.setStatus(
                        resultSet.getString("status")
                );

                treatments.add(treatment);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return treatments;
    }
}