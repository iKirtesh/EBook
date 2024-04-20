
<%@ page import="com.db.DBConnect" %>
<%@ page import="DAO.BookDao" %>
<%@ page import="entity.Book" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book Management</title>
    <%@ include file="bootstrap.jsp"%>

    <!-- Add your custom styles to center the form -->
    <style>
        .center-form {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* 100% of the viewport height */
        }

        .form-container {
            width: 400px; /* Set the width of the form container */
        }
    </style>
</head>
<body>


<%
    int bookId = 0; // Default value, you can change this to an appropriate default value
    String idParameter = request.getParameter("id");
    if (idParameter != null && !idParameter.isEmpty()) {
        try {
            bookId = Integer.parseInt(idParameter);
        } catch (NumberFormatException e) {
            // Handle the exception or log it if needed
            e.printStackTrace();
        }
    }

    BookDao bookDao = new BookDao(DBConnect.getConnection());
    Book book = bookDao.getBookById(bookId);
    assert book != null;%>

<div class="center-form">
    <div class="form-container">
        <h2 class="text-center mb-4">Update User Information</h2>

        <form method="post" action="${pageContext.request.contextPath}/book/updateBook" class="needs-validation" novalidate>
            <input type="hidden" name="bookId" id="updateBookId" value="<%= book.getBookId() %>">
            <div class="form-floating mb-3">
                <input type="text" class="form-control rounded-3" id="floatingTitle" placeholder="Book Title" name="title" value="<%= book.getTitle() %>" required>
                <label for="floatingTitle">Book Title</label>
            </div>

            <div class="form-floating mb-3">
                <input type="text" class="form-control rounded-3" id="floatingAuthor" placeholder="Author" name="author" value="<%= book.getAuthor() %>" required>
                <label for="floatingAuthor">Author</label>
            </div>

            <div class="form-floating mb-3">
                <textarea class="form-control rounded-3" id="floatingDescription" placeholder="Book Description" name="description" required><%= book.getDescription() %></textarea>
                <label for="floatingDescription">Book Description</label>
            </div>

            <div class="form-floating mb-3">

                <select class="form-select rounded-3" id="floatingCategory" name="category" required>
                    <option value="new" <%= "new".equals(book.getCategory()) ? "selected" : "" %>>New One</option>
                    <option value="old" <%= "old".equals(book.getCategory()) ? "selected" : "" %>>Old Book</option>
                </select>

                <label for="floatingCategory">Category</label>
            </div>

            <div class="form-floating mb-3">
                <select class="form-select rounded-3" id="floatingBookStatus" name="bookStatus" required>
                    <option value="available" <%= "available".equals(book.getBookStatus()) ? "selected" : "" %>>Available</option>
                    <option value="sold" <%= "sold".equals(book.getBookStatus()) ? "selected" : "" %>>Sold</option>
                    <!-- Add more options if needed -->
                </select>

                <label for="floatingBookStatus">Book Status</label>
            </div>

            <div class="form-floating mb-3">
                <input type="number" class="form-control rounded-3" id="floatingPrice" placeholder="Price" name="price" value="<%= book.getPrice() %>" required>
                <label for="floatingPrice">Price</label>
            </div>

            <div class="form-floating mb-3">
                <input type="text" class="form-control rounded-3" id="floatingBookImage" placeholder="Book Image URL" name="bookImage" value="<%= book.getBookImage() %>" required>
                <label for="floatingBookImage">Book Image URL</label>
            </div>

            <div class="d-grid mb-2">
                <button type="submit" class="btn btn-primary btn-lg" name="updateBook">Update Book</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
