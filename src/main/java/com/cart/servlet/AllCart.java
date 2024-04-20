package com.cart.servlet;

import DAO.BookDao;
import DAO.CartDao;
import com.db.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/allCart")
public class AllCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       CartDao cartDao = new CartDao((Connection) getServletContext().getAttribute("connection"));
        int userId = Integer.parseInt(req.getParameter("userId"));

        List<entity.Cart> cartList = cartDao.getAllCart(userId);

        req.setAttribute("cartList", cartList);
        req.getRequestDispatcher("/order/checkout.jsp").forward(req, resp);

    }
}