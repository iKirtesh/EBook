package com.book.servlet;


import DAO.BookDao;
import com.db.DBConnect;
import entity.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/book/updateBook")
public class UpdateBook extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
                    System.out.println("Book ID: " + req.getParameter("bookId"));

            String idString = req.getParameter("bookId");


            if (idString != null && !idString.isEmpty()) {
                try {
                    int id = Integer.parseInt(idString);
                    String title = req.getParameter("title");
                    String author = req.getParameter("author");
                    String description = req.getParameter("description");
                    String category = req.getParameter("category");
                    String bookStatus = req.getParameter("bookStatus");
                    String priceString = req.getParameter("price");
                    String bookImage = req.getParameter("bookImage");

                    int price = 0;  // Default value or any other appropriate default

                    if (priceString != null && !priceString.trim().isEmpty()) {
                        try {
                            price = Integer.parseInt(priceString);
                        } catch (NumberFormatException e) {
                            // Handle the case where the parameter is not a valid integer
                            e.printStackTrace();  // Log the exception for debugging
                        }
                    }

                     Book book = new Book();
                     book.setBookId(id);
                     book.setTitle(title);
                     book.setAuthor(author);
                     book.setDescription(description);
                     book.setCategory(category);
                     book.setBookStatus(bookStatus);
                     book.setPrice(price);
                     book.setBookImage(bookImage);

                     BookDao bookDao = new BookDao(DBConnect.getConnection());

                     if (bookDao.updateBook(book)) {
                          resp.sendRedirect("addBook.jsp?message=Book updated successfully");
                     } else {
                          System.out.println("Failed to update book");
                          resp.sendRedirect("addBook.jsp?error=Failed to update book");
                     }
                } catch (NumberFormatException e) {
                    System.out.println("Failed to update book: Invalid book ID");
                }
            } else {
                System.out.println("Failed to update book: Invalid or missing book ID");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        }
    }
}
