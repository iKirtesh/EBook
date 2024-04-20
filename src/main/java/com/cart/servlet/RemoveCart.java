package com.cart.servlet;


import DAO.CartDao;
import com.db.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

//@WebServlet("/removeCart")
//public class RemoveCart extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String id = req.getParameter("remove"); // Change "id" to "remove"
//
//        try {
//            int cartId = Integer.parseInt(id);
//            CartDao cartDao = new CartDao((DBConnect.getConnection()));
//
//            boolean f = cartDao.deleteCart(cartId);
//
//            if (f) {
//                // Redirect to order/checkout.jsp
//                resp.sendRedirect(req.getContextPath() + "/order/checkout.jsp");
//            } else {
//                resp.sendRedirect("error.jsp");
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//}


@WebServlet("/removeCart")
public class RemoveCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("remove");

        try {
            int cartId = Integer.parseInt(id);
            CartDao cartDao = new CartDao((DBConnect.getConnection()));

            boolean f = cartDao.deleteCart(cartId);

            if (f) {
                // Redirect back to the referring page
                String referrer = req.getHeader("referer");
                resp.sendRedirect(referrer);
            } else {
                resp.sendRedirect("error.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
