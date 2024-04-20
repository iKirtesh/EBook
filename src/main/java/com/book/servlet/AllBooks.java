package com.book.servlet;


import DAO.BookDao;
import DAO.UserDao;
import entity.Book;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/book/allBooks")
public class AllBooks extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookDao bookDao = new BookDao((Connection) getServletContext().getAttribute("connection"));
        List<Book> bookList = bookDao.getAllBooks();

        request.setAttribute("bookList", bookList);
        request.getRequestDispatcher("/book/allBooks.jsp").forward(request, response);
    }

}
