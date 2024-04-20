package com.api;

import com.google.api.services.books.v1.model.Volume;
import com.google.api.services.books.v1.model.Volumes;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.List;

@WebServlet("/search")
public class BookSearch extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");
        try {
            Volumes volumes = GoogleBooksApi.searchBooks(query);
            List<Volume> items = volumes.getItems();

            request.setAttribute("books", items);
            request.getRequestDispatcher("result.jsp").forward(request, response);

        } catch (IOException | GeneralSecurityException e) {
            e.printStackTrace();
            response.getWriter().println("Error occurred during book search.");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
