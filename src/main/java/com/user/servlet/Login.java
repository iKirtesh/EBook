package com.user.servlet;

import DAO.UserDao;
import com.db.DBConnect;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet("/login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDao userDao = null;

        // Retrieve parameters
        String email = req.getParameter("email");
        String password = req.getParameter("password");

// Trim and handle null values
        email = (email != null) ? email.trim() : "";
        password = (password != null) ? password.trim() : "";


        try {
            userDao = new UserDao(DBConnect.getConnection());
            User user = userDao.login(email, password);
            HttpSession session = req.getSession();

            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                // Set admin in session

                resp.sendRedirect("adminHome.jsp");
            } else if (user != null) {
                // Set user in session
                session.setAttribute("user", user);

                String referrer = req.getHeader("referer");
                resp.sendRedirect(referrer);

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (userDao != null) {
                userDao.close();
            }
        }

    }
}
