package com.sunrise.dental.service;

import com.sunrise.dental.dao.UserDAO;
import com.sunrise.dental.model.User;

public class AuthenticationService {

    private final UserDAO userDAO;

    public AuthenticationService() {
        this.userDAO = new UserDAO();
    }

    public User login(String username, String password) {

        if (username == null || username.trim().isEmpty()
                || password == null || password.trim().isEmpty()) {
            return null;
        }

        return userDAO.authenticateUser(username.trim(), password);
    }
}