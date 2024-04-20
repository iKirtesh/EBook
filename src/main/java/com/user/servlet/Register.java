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

@WebServlet("/register")
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String firstname = req.getParameter("firstname");
            String lastname = req.getParameter("lastname");
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            User user = new User();
            user.setFirstname(firstname);
            user.setLastname(lastname);
            user.setEmail(email);
            user.setPassword(password);

            HttpSession session = req.getSession();

            // Create an instance of DBConnect and then get the connection
            DBConnect dbConnect = new DBConnect();
            UserDao userDao = new UserDao(dbConnect.getConnection());

            if (userDao.addUser(user)) {
                session.setAttribute("message", "Registration Successful");
//                System.out.println("Registration Success");
            } else {
                session.setAttribute("message", "Something went wrong");
//                System.out.println("Registration Failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}