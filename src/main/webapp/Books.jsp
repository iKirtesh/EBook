<%@ page import="DAO.BookDao" %>
<%@ page import="entity.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="com.db.DBConnect" %>

<div class="container">
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
        <%
            try {
                List<Book> books;

                // Check if the books attribute is available (from search)
                if (request.getAttribute("books") != null) {
                    books = (List<Book>) request.getAttribute("books");
                } else {
                    // If not, get the regular book list
                    BookDao bookDao = new BookDao(DBConnect.getConnection());
                    books = bookDao.getAllBooks();
                }

                for (Book book : books) {
        %>
        <!-- Your existing book card code -->
        <div class="col">
            <div class="card h-100">
                <img src="<%= book.getBookImage()%>" class="card-img-top card-im" alt="Book Cover"/>
                <div class="card-body ms-2">
                    <h5 class="card-title"><%= book.getTitle() %></h5>
                    <p class="card-text"><%= book.getAuthor() %></p>
                    <!-- Other card details -->
                </div>
            </div>
        </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
                // Handle the exception appropriately in a real-world scenario
            }
        %>
    </div>
</div>
