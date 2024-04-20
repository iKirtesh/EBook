package com.comment.servlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;



@WebServlet("/UpdateComment")
public class UpdateComment extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Retrieve form data
            String userIdParam = req.getParameter("userId");
            String bookIdParam = req.getParameter("bookId");
            String commentText = req.getParameter("commentText");
            String ratingParam = req.getParameter("rating");

            // Check for null values
            if (userIdParam == null || bookIdParam == null || ratingParam == null) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parameters");
                return;
            }


            System.out.println("userIdParam: " + userIdParam);
            System.out.println("bookIdParam: " + bookIdParam);
            System.out.println("ratingParam: " + ratingParam);


            // Parse parameters as integers
            int userId = Integer.parseInt(userIdParam);
            int bookId = Integer.parseInt(bookIdParam);
            int rating = Integer.parseInt(ratingParam);

            // Create a Comment object
            entity.Comment comment = new entity.Comment();
            comment.setUserId(userId);
            comment.setBookId(bookId);
            comment.setCommentText(commentText);
            comment.setRating(rating);

            // Call the DAO method to update the comment in the database
            DAO.CommentDao commentDAO = new DAO.CommentDao(com.db.DBConnect.getConnection());
            boolean commentUpdated = commentDAO.updateComment(userId, bookId, comment);

            if (commentUpdated) {
                // Comment updated successfully, redirect to the bookInfo page with the bookId parameter
                resp.sendRedirect("bookInfo?bookId=" + bookId);
            } else {
                // Handle the case where comment update failed, redirect or forward to an error page
                resp.sendRedirect("error.jsp");
            }
        } catch (NumberFormatException e) {
            // Handle the case where parsing fails
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parameter format");
        }
    }
}
