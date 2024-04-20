package com.admin.servlet;

import DAO.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/adminDisable")
public class Disable extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");

        try {
            int userId = Integer.parseInt(id);
            UserDao userDao = new UserDao((Connection) getServletContext().getAttribute("connection"));
            boolean disableSuccess = userDao.disableUser(userId);

            if (disableSuccess) {
                System.out.println("User successfully disabled");
                resp.sendRedirect("adminHome.jsp?message=User successfully disabled");
            } else {
                System.out.println("Failed to disable user");
                resp.sendRedirect("adminHome.jsp?error=Failed to disable user");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            System.out.println("Invalid user ID");
            resp.sendRedirect("adminHome.jsp?error=Invalid user ID");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        }
    }
}
