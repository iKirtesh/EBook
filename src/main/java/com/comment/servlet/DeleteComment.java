package com.comment.servlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/DeleteComment")
public class DeleteComment extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String commentId = req.getParameter("commentId");

        try {
            int id = Integer.parseInt(commentId);
            DAO.CommentDao commentDao = new DAO.CommentDao(com.db.DBConnect.getConnection());
            boolean deletionSuccess = commentDao.deleteComment(id);

            if (deletionSuccess) {
                resp.sendRedirect("bookInfo?bookId=" + req.getParameter("bookId"));
            } else {
                resp.sendRedirect("error.jsp");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        }

    }
}
