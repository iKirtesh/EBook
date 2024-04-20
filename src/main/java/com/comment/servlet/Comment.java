//package com.comment.servlet;
//
//import DAO.CommentDao;
//import com.db.DBConnect;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.SQLException;
//import java.util.List;
//
//
//@WebServlet("/comment")
//public class Comment extends HttpServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int bookId = Integer.parseInt(request.getParameter("bookId"));
//
//        try (Connection connection = DBConnect.getConnection()) {
//            CommentDao commentDAO = new CommentDao(connection);
//            List<entity.Comment> comments = commentDAO.getCommentsByBookId(bookId);
//
//            request.setAttribute("comments", comments);
//            request.getRequestDispatcher("/book/bookDetails.jsp").forward(request, response);
//
////             response.sendRedirect("bookInfo?id=" + bookId);
//        } catch (SQLException e) {
//            e.printStackTrace(); // Handle the exception properly in a real application
//        }
//    }
//}
