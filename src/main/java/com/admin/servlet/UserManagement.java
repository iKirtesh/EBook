package com.admin.servlet;

import DAO.UserDao;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/admin/userManagement")
public class UserManagement extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve user list and forward to JSP
        UserDao userDao = new UserDao((Connection) getServletContext().getAttribute("connection"));
        List<User> userList = userDao.getAllUsers();

        request.setAttribute("userList", userList);
        request.getRequestDispatcher("/admin/userAllUsers.jsp").forward(request, response);
    }
}
