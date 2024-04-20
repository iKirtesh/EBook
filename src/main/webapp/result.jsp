<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book Search</title>
    <%@ include file="components/bootstrap.jsp"%>
</head>
<body>
<h2>Book Search</h2>
<form action="search" method="post">
    <label for="query">Search Books:</label>
    <input type="text" id="query" name="query" required>
    <input type="submit" value="Search">
</form>

<h3>Search Results:</h3>
<ul>
    <%@ page import="java.util.List" %>
    <%@ page import="com.google.api.services.books.v1.model.Volume" %>
    <% List<Volume> books = (List<Volume>) request.getAttribute("books");
        if (books != null && !books.isEmpty()) {
            for (Volume book : books) { %>
<%--    <li><%= book.getVolumeInfo().getTitle() %></li>--%>
    <% }
    } else { %>
    <li>No results found.</li>
    <% }
    %>
</ul>
</body>
</html>

<div class="container">
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
        <%
            try {
                 books = (List<Volume>) request.getAttribute("books");
                if (books != null && !books.isEmpty()) {
                    for (Volume book : books) {
        %>
        <!-- Your existing book card code -->
        <div class="col">
            <div class="card h-100">
                <img src="<%= book.getVolumeInfo().getImageLinks().getThumbnail() %>" class="card-img-top card-im" alt="Book Cover"/>
                <div class="card-body ms-2">
                    <h5 class="card-title"><%= book.getVolumeInfo().getTitle() %></h5>
                    <p class="card-text"><%= book.getVolumeInfo().getAuthors().get(0) %></p>
                    <div class="text-center">
                        <h3 class="card-title pricing-card-title">$<%= book.getSaleInfo().getListPrice().getAmount() %></h3>
                        <a href="#" class="btn btn-light border border-dark-subtle">
                            <i class="ri-information-line px-2"></i>Info
                        </a>
                        <a href="#" class="btn btn-warning text-white">
                            <i class="ri-handbag-line px-2"></i>Buy Now
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <%
                    }
                } else {
                    out.println("<p>No results found.</p>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                // Handle the exception appropriately in a real-world scenario
            }
        %>
    </div>
</div>

<%--login button --%>