package com.book.servlet;


import DAO.BookDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/book/deleteBook")
public class DeleteBook extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");

        try {
            int bookId = Integer.parseInt(id);
            BookDao bookDao = new BookDao((Connection) getServletContext().getAttribute("connection"));
            boolean deletionSuccess = bookDao.deleteBook(bookId);

            if (deletionSuccess) {
                resp.sendRedirect("addBook.jsp?message=Book successfully deleted");
            } else {
                resp.sendRedirect("addBook.jsp?error=Failed to delete book");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            resp.sendRedirect("addBook.jsp?error=Invalid book ID");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        }
    }
}
