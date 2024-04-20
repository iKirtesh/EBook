package com.cart.servlet;

import DAO.BookDao;
import DAO.CartDao;
import com.db.DBConnect;
import entity.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/addCart")
public class Cart extends HttpServlet {

    private void processCartRequest(HttpServletRequest req, HttpServletResponse resp, String status)
            throws ServletException, IOException {
        try {
            // Retrieve parameters
            String bookIdParam = req.getParameter("bookId");
            String userIdParam = req.getParameter("userId");
            String quantityParam = req.getParameter("quantity");
            String action = req.getParameter("action");

            // Validate parameters
            if (bookIdParam == null || userIdParam == null || quantityParam == null || action == null) {
                // Handle the case where one or more parameters are missing
                req.setAttribute("errorMessage", "Invalid parameters");
                req.getRequestDispatcher("error.jsp").forward(req, resp);
                return; // Return to avoid further processing
            }

            // Parse parameters to integers
            int bookId = Integer.parseInt(bookIdParam);
            int userId = Integer.parseInt(userIdParam);
            int quantity = Integer.parseInt(quantityParam);


            HttpSession session = req.getSession();

            BookDao bookDao = new BookDao(DBConnect.getConnection());
            Book book = bookDao.getBookById(bookId);

            entity.Cart cart = new entity.Cart();
            cart.setBookId(bookId);
            cart.setUserId(userId);
            cart.setBookName(book.getTitle());
            cart.setBookAuthor(book.getAuthor());
            cart.setQuantity(quantity);
            cart.setBookPrice(book.getPrice());
            cart.setTotalAmount(book.getPrice() * quantity);


            if ("buyNow".equals(action)) {
                cart.setStatus("Buy Now");
                // Additional logic for Buy Now
            } else {
                cart.setStatus("In Cart");
                // Additional logic for Add to Cart
            }

            CartDao cartDao = new CartDao(DBConnect.getConnection());
            boolean f = cartDao.addCart(cart);


            if (f) {
                session.setAttribute("addCart", "Added to cart");
            } else {
                session.setAttribute("failed", "Failed to add to cart");
            }

            // Redirect to a different page after processing the cart addition
            if ("buyNow".equals(action)) {
                resp.sendRedirect(req.getContextPath() + "/order/checkout.jsp");
            } else {
                resp.sendRedirect(req.getContextPath() + "/bookInfo?bookId=" + bookId);
            }

        } catch (Exception e) {
            e.printStackTrace();
            // Forward to an error page in case of an exception
            req.setAttribute("errorMessage", "Error processing the request");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processCartRequest(req, resp, "In Cart");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processCartRequest(req, resp, "In Cart");
    }
}

