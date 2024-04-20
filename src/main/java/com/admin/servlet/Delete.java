package com.admin.servlet;

import DAO.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/adminDelete")
public class Delete extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");

        String referrer = null;
        try {
            int userId = Integer.parseInt(id);
            UserDao userDao = new UserDao((Connection) getServletContext().getAttribute("connection"));
            boolean deletionSuccess = userDao.deleteUser(userId);

            referrer = req.getHeader("referer");
            if (deletionSuccess) {

                resp.sendRedirect(referrer + "?message=User successfully deleted");


            } else {
                resp.sendRedirect(referrer + "?error=Failed to delete user");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            resp.sendRedirect(referrer + "?error=Invalid user ID");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        }
    }
}
