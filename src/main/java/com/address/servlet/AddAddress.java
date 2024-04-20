package com.address.servlet;

import com.db.DBConnect;
import DAO.AddressDao;
import entity.Address;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/addAddress")
public class AddAddress extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String addressStr = req.getParameter("address");
            String city = req.getParameter("city");
            String state = req.getParameter("state");
            String country = req.getParameter("country");
            String zip = req.getParameter("zip");
            String saveInfoStr = req.getParameter("saveInfo");

            HttpSession session = req.getSession();

            if (addressStr != null && !addressStr.trim().isEmpty() &&
                    city != null && !city.trim().isEmpty() &&
                    state != null && !state.trim().isEmpty() &&
                    country != null && !country.trim().isEmpty() &&
                    zip != null && !zip.trim().isEmpty()) {

                // Parse the saveInfo parameter to boolean
                boolean saveInfo = "on".equals(saveInfoStr);

                // Create an Address object with the entered information
                Address address = new Address();
                address.setAddress(addressStr);
                address.setCity(city);
                address.setState(state);
                address.setCountry(country);
                address.setZipCode(zip);
                address.setSaveInfo(saveInfo);

                // Store the address information in the session for further use
                session.setAttribute("address", address);

                if (saveInfo) {
                    // Save the address to the database if "Save this information" is selected
                    int userId = (int) session.getAttribute("userId");
                    AddressDao addressDao = new AddressDao(DBConnect.getConnection());
                    boolean savedToDatabase = addressDao.addAddress(address, userId);

                    if (savedToDatabase) {
                        session.setAttribute("message", "Address saved successfully!");
                    } else {
                        session.setAttribute("message", "Failed to save address in the database");
                    }
                }

                // Redirect to the next page (payment.jsp)
                resp.sendRedirect(req.getContextPath() + "/payment.jsp");


            } else {
                session.setAttribute("message", "Please fill all the fields");
                resp.sendRedirect(req.getContextPath() + "/order/checkout.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
