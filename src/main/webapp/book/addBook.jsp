<%@ page import="entity.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.BookDao" %>
<%@ page import="com.db.DBConnect" %>
<%--
  Created by IntelliJ IDEA.
  User: kirte
  Date: 05-01-2024
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <%@ include file="../admin/navbar.jsp"%>
    <%@ include file="bootstrap.jsp"%>
</head>
<body>

<div class="container-md-3">
    <div class="row gap-5 ">
        <div class="col-lg-2">

            <%@ include file="../admin/sidebar.jsp"%>
        </div>
        <div class="col-lg-9 border-gray-100">
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="card mt-5 mb-3">
                 <div class="card-header">
                <h2>Book List</h2>
                </div>

                <div class="card-body">
                    <div class="d-grid mb-2">
                        <button type="button" class="btn btn-primary me-2" data-bs-toggle="modal" data-bs-target="#modalAddBook"><i class="ri-login-box-line px-1"></i>Add Book</button>

                    </div>
                </div>


            <div class="card-body"> <div class="table-responsive"> <!-- Add this div to make the table responsive -->
                <table class="table table-bordered text-center"> <!-- Add text-center class to center the content -->
                    <thead>

                    <tr>
                        <th>Book Id</th>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Description</th>
                        <th>Category</th>
                        <th>Book Status</th>
                        <th>Price</th>
                        <th>Book Image</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <%
                            try {
                                BookDao bookDao = new BookDao(DBConnect.getConnection());
                                List<Book> books = bookDao.getAllBooks();
                                request.setAttribute("books", books);

                                for (Book book : books) {

                        %>
                        <td scope="row"><%= book.getBookId() %></td>
                        <td><%= book.getTitle() %></td>
                        <td><%= book.getAuthor() %></td>
                        <td><%= book.getDescription() %></td>
                        <td>
                            <% if (book.getCategory() != null && book.getCategory().equals("new")) { %>
                            <span class="badge text-bg-info">New</span>
                            <% } else if (book.getCategory() != null && book.getCategory().equals("old")) { %>
                            <span class="badge text-bg-warning">Old</span>
                            <% } else { %>
                            <!-- Handle the case where getCategory() is null or not "new" or "old" -->
                            <% } %>

                        </td>
                        <td>
                            <% if (book.getBookStatus() != null && book.getBookStatus().equals("available")) { %>
                            <span class="badge bg-success">Available</span>
                            <% } else if (book.getBookStatus() != null && book.getBookStatus().equals("sold")) { %>
                            <span class="badge bg-danger">Sold</span>
                            <% } else { %>
                            <!-- Handle the case where getBookStatus() is null or does not match "available" or "sold" -->
                            <% } %>

                        </td>
                        <td><%= book.getPrice() %></td>
                        <td><%= book.getBookImage() %></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/book/updateBook.jsp?id=<%= book.getBookId() %>" class="btn btn-primary" >Update</a>
                             <a href="${pageContext.request.contextPath}/book/deleteBook?id=<%= book.getBookId() %>" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            System.out.println(e);
                            response.sendRedirect("error.jsp");
                        }
                    %>
                    </tbody>
                </table>
            </div>
            </div>
        </div>
    </div>
</div>
</div>
        </div>
    </div>
</div>




<%--Add Book Modal--%>

<div class="modal p-4 py-md-5" id="modalAddBook" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <h1 class="fw-bold mb-0 fs-2">Add a Book</h1>
            </div>

            <div class="modal-body p-5 pt-0">
                <form method="post" action="${pageContext.request.contextPath}/book/addBook" class="needs-validation" novalidate>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control rounded-3" id="floatingTitle" placeholder="Book Title" name="title" required>
                        <label for="floatingTitle">Book Title</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control rounded-3" id="floatingAuthor" placeholder="Author" name="author" required>
                        <label for="floatingAuthor">Author</label>
                    </div>

                    <div class="form-floating mb-3">
                        <textarea class="form-control rounded-3" id="floatingDescription" placeholder="Book Description" name="description" required></textarea>
                        <label for="floatingDescription">Book Description</label>
                    </div>

                    <div class="form-floating mb-3">

                        <select class="form-select rounded-3" id="floatingCategory" name="category" required>
                            <option value="new">New One</option>
                            <option value="old">Old Book</option>

                        </select>
                        <label for="floatingCategory">Category</label>
                    </div>

                    <div class="form-floating mb-3">
                        <select class="form-select rounded-3" id="floatingBookStatus" name="bookStatus" required>
                            <option value="available">Available</option>
                            <option value="sold">Sold</option>
                            <!-- Add more options if needed -->
                        </select>
                        <label for="floatingBookStatus">Book Status</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="number" class="form-control rounded-3" id="floatingPrice" placeholder="Price" name="price" required>
                        <label for="floatingPrice">Price</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control rounded-3" id="floatingBookImage" placeholder="Book Image URL" name="bookImage" required>
                        <label for="floatingBookImage">Book Image URL</label>
                    </div>

<%--                    upload from local computer as well --%>



                    <div class="d-grid mb-2">
                        <button type="submit" class="btn btn-primary btn-lg" name="addBook">Add Book</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>




<script>
    var addBookModal = new bootstrap.Modal(document.getElementById('modalAddBook'), {
        keyboard: false
    });

    document.getElementById('addBookButton').addEventListener('click', function () {
        addBookModal.show();
    });
</script>


<!-- Add this in the head of your HTML -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>
