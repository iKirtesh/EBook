<%@ page import="java.util.List" %>
<%@ page import="entity.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Books</title>
</head>
<body>

<!-- Add the search input form -->
<form action="books" method="get">
    <label for="searchQuery">Search for a book:</label>
    <input type="text" id="searchQuery" name="searchQuery" required>
    <button type="submit">Search</button>
</form>

<hr>

<h2>Books</h2>

<div class="container">
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
        <%
            List<Book> books = (List<Book>) request.getAttribute("books");
            if (books != null && !books.isEmpty()) {
                for (Book book : books) {
        %>
        <div class="col">
            <div class="card h-100">
                <img src="<%= book.getThumbnailLink() %>" alt="<%= book.getTitle() %>" class="card-img-top" />
                <div class="card-body">
                    <h5 class="card-title"><%= book.getTitle() %></h5>
                    <p class="card-text"><%= book.getAuthor() %></p>
                    <p class="card-text"><%= book.getPageCount() %> pages</p>
                    <a href="<%= book.getPreviewLink() %>" class="btn btn-primary">Preview</a>
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <p>No books found.</p>
        <%
            }
        %>
    </div>
</div>

</body>
</html>
