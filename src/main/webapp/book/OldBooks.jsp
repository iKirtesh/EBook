<%@ page import="DAO.BookDao" %>
<%@ page import="entity.Book" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page import="java.util.List" %>
<%@ page import="com.db.DBConnect" %>

<%@ include file="../components/bootstrap.jsp" %>
<%-- Include necessary imports and other parts of your JSP --%>

<div class="container">
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
        <%
            try {
                BookDao bookDao = new BookDao(DBConnect.getConnection());
                List<Book> books = bookDao.getOldBooks();

                for (Book book : books) {
        %>
        <div class="col">
            <div class="card h-100">
                <img src="<%= book.getBookImage()%>" class="card-img-top card-im" alt="Book Cover"/>
                <div class="card-body ms-2">
                    <h5 class="card-title"><%= book.getTitle() %></h5>
                    <p class="card-text"><%= book.getAuthor() %></p>
                    <%--                    <p class="card-text"><%= book.getDescription() %></p>--%>
                    <div class="text-center">
                        <h3 class="card-title pricing-card-title">$<%= book.getPrice() %></h3>
                        <a href="${pageContext.request.contextPath}/book/bookInfo?title=<%= book.getTitle() %>" class="btn btn-light border border-dark-subtle">
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
            } catch (Exception e) {
                e.printStackTrace();
                // Handle the exception appropriately in a real-world scenario
            }
        %>
    </div>
</div>
