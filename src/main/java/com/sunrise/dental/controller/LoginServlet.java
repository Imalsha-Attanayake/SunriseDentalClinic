package com.sunrise.dental.controller;

import com.sunrise.dental.model.User;
import com.sunrise.dental.service.AuthenticationService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private AuthenticationService authenticationService;

    @Override
    public void init() {
        authenticationService = new AuthenticationService();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = authenticationService.login(username, password);

        if (user != null) {

            HttpSession session = request.getSession();
            session.setAttribute("loggedInUser", user);
            session.setMaxInactiveInterval(30 * 60);

            response.sendRedirect(
                    request.getContextPath() + "/dashboard.jsp"
            );

        } else {

            request.setAttribute(
                    "errorMessage",
                    "Invalid username or password."
            );

            request.getRequestDispatcher("/login.jsp")
                    .forward(request, response);
        }
    }
}