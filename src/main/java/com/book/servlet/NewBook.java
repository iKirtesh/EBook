package com.book.servlet;

import DAO.BookDao;
import com.db.DBConnect;
import entity.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/book/addBook")
public class NewBook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String title = req.getParameter("title");
            String author = req.getParameter("author");
            String description = req.getParameter("description");
            String category = req.getParameter("category");
            String bookStatus = req.getParameter("bookStatus");

            String priceParameter = req.getParameter("price");
            int price = 0;  // Default value or any other appropriate default
            String bookImage = req.getParameter("bookImage");

            if (priceParameter != null && !priceParameter.trim().isEmpty()) {
                try {
                    price = Integer.parseInt(priceParameter);
                } catch (NumberFormatException e) {
                    // Handle the case where the parameter is not a valid integer
                    e.printStackTrace();  // Log the exception for debugging
                }
            }

            Book book = new Book();
            book.setTitle(title);
            book.setAuthor(author);
            book.setDescription(description);
            book.setCategory(category);
            book.setBookStatus(bookStatus);
            book.setPrice(price);
            book.setBookImage(bookImage);

            // Create an instance of DBConnect and then get the connection
            HttpSession session = req.getSession();
            DBConnect dbConnect = new DBConnect();
            BookDao bookDao = new BookDao(dbConnect.getConnection());

            if (bookDao.addBook(book)) {
                session.setAttribute("message", "Book Added Successfully");
                System.out.println("Book Added Successfully");
            } else {
                session.setAttribute("message", "Something went wrong");
                System.out.println("Book Addition Failed");
            }

            resp.sendRedirect(req.getContextPath() + "/book/addBook.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        }
    }

}