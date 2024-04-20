package com.book.servlet;

import DAO.BookDao;
import DAO.CommentDao;
import DAO.UserDao;
import com.db.DBConnect;
import entity.Book;
import entity.Comment;
import entity.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/bookInfo")
public class BookInfo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the book ID from the request parameters
        String bookIdParam = request.getParameter("bookId");

        if (bookIdParam == null || bookIdParam.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Book id parameter is missing or empty");
            return;
        }

        int bookId = Integer.parseInt(bookIdParam);

        try (Connection connection = DBConnect.getConnection()) {
            // Fetch book details from the database using the book ID
            BookDao bookDao = new BookDao(connection);
            Book book = bookDao.getBookById(bookId);

            // Set book information in the request attribute
            request.setAttribute("book", book);

            // Fetch comments for the book
            CommentDao commentDAO = new CommentDao(connection);
            List<Comment> comments = commentDAO.getCommentsByBookId(bookId);

            // Set comments in the request attribute
            request.setAttribute("comments", comments);

            // Fetch the associated User object for each comment
            UserDao userDao = new UserDao(DBConnect.getConnection());

            // Set the associated User object for each comment
            for (Comment comment : comments) {
                User user = userDao.getUserById(comment.getUserId());
                comment.setUser(user);
            }

            // Forward the request to bookDetails.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("/book/bookDetails.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

