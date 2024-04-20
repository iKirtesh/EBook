package com.comment.servlet;

import DAO.CommentDao;
import com.db.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import entity.Comment;

@WebServlet("/AddComment")
public class NewComment extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Retrieve form data
            String userIdParam = req.getParameter("userId");
            String bookIdParam = req.getParameter("bookId");
            String commentText = req.getParameter("commentText");
            String ratingParam = req.getParameter("rating");

            // Logging for troubleshooting
            System.out.println("userIdParam: " + userIdParam);
            System.out.println("bookIdParam: " + bookIdParam);
            System.out.println("commentText: " + commentText);
            System.out.println("ratingParam: " + ratingParam);

            // Check for null values
            if (userIdParam == null || bookIdParam == null || ratingParam == null) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parameters");
                return;
            }

            // Check if bookIdParam is not null before parsing
            int userId = Integer.parseInt(userIdParam);
            int bookId = Integer.parseInt(bookIdParam); // This may throw NumberFormatException
            int rating = Integer.parseInt(ratingParam);



            // Create a Comment object
            Comment comment = new Comment();
            comment.setUserId(userId);
            comment.setBookId(bookId);
            comment.setCommentText(commentText);
            comment.setRating(rating);

            // Set the timestamp to the current date and time
            comment.setTimestamp(new Timestamp(new Date().getTime()));

            // Call the DAO method to add the comment to the database
            CommentDao commentDAO = new CommentDao(DBConnect.getConnection());
            boolean commentAdded = commentDAO.addComment(userId, bookId, comment);

            if (commentAdded) {
                // Comment added successfully, redirect to the bookInfo page with the bookId parameter
                resp.sendRedirect("bookInfo?bookId=" + bookId);
            } else {
                // Handle the case where comment addition failed, redirect or forward to an error page
                resp.sendRedirect("error.jsp");
            }
        } catch (NumberFormatException e) {
            // Handle the case where parsing fails
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parameter format");
        }
    }
}
