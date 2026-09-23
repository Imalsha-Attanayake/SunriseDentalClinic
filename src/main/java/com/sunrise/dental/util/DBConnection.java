package com.sunrise.dental.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String DEFAULT_URL =
            "jdbc:mysql://localhost:3306/sunrise_dental_clinic";

    private static final String DEFAULT_USERNAME = "root";

    private DBConnection() {
        // Prevent object creation
    }

    public static Connection getConnection() throws SQLException {

        String url = System.getenv("DB_URL");
        String username = System.getenv("DB_USERNAME");
        String password = System.getenv("DB_PASSWORD");

        // Use local defaults when environment variables are not provided
        if (url == null || url.isBlank()) {
            url = DEFAULT_URL;
        }

        if (username == null || username.isBlank()) {
            username = DEFAULT_USERNAME;
        }

        if (password == null) {
            password = "";
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException(
                    "MySQL JDBC Driver not found.",
                    e
            );
        }

        return DriverManager.getConnection(
                url,
                username,
                password
        );
    }
}