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

@WebServlet("/activeUsers")
public class ActiveUser extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao userDao = new UserDao((Connection) getServletContext().getAttribute("connection"));
        List<User> activeUserList = userDao.getActiveUsers();

        request.setAttribute("activeUserList", activeUserList);
        request.getRequestDispatcher("/admin/ActiveUsers.jsp").forward(request, response);
    }
}
