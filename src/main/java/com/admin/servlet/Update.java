package com.admin.servlet;

import DAO.UserDao;
import com.db.DBConnect;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet("/admin/userUpdate")
public class Update extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idString = request.getParameter("id");

            if (idString != null && !idString.isEmpty()) {
                try {
                    int id = Integer.parseInt(idString);
                    String firstname = request.getParameter("firstname");
                    String lastname = request.getParameter("lastname");
                    String email = request.getParameter("email");
                    String status = request.getParameter("status");
                    String password = request.getParameter("password");

                    UserDao userDao = new UserDao(DBConnect.getConnection());

                    if (!userDao.isEmailTaken(email, id)) {
                        User user = new User();
                        user.setId(id);
                        user.setFirstname(firstname);
                        user.setLastname(lastname);
                        user.setEmail(email);
                        user.setStatus(status);
                        user.setPassword(password);

                        if (userDao.updateUser(user)) {
                            response.sendRedirect("AllUsers.jsp?message=User updated successfully");
                        } else {
//                            System.out.println("Failed to update user");
                            response.sendRedirect("AllUsers.jsp");
                        }
                    } else {
                        System.out.println("Failed to update user: Email is already taken");
                        response.sendRedirect("AllUsers.jsp?error=Email is already taken");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Failed to update user: Invalid user ID");
                }
            } else {
                System.out.println("Failed to update user: Invalid or missing user ID");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
