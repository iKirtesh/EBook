<%@ page import="entity.Book" %>
<%@ page import="entity.Comment" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.User" %>
<%@ page import="entity.Cart" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="bootstrap.jsp" %>

<html>
<head>
    <title>Book Details</title>
    <%@ include file="../components/bootstrap.jsp"%>
    <style>
        .rating {
            display: inline-flex;
            align-items: center;
            color: #ffc107; /* Set the default color for stars */
        }

        .stars .bi-star-fill {
            color: #ffc107; /* Color for filled stars */
        }

        .stars .bi-star {
            color: #ddd; /* Color for unfilled stars */
        }

        .review-no {
            margin-left: 5px;
            font-size: 14px;
            color: #6c757d; /* Set the color for the review count */
        }

        .checked {
            color: orange;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .comment {
            background-color: #ffffff;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            margin-bottom: 15px;
            padding: 15px;
        }

        .comment-actions {
            display: flex;
            justify-content: space-between;
        }

        .comment-section {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            /*box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);*/
        }

        .comment-user {
            color: #007bff;
            font-weight: bold;
        }

    </style>
</head>
<body>
<%@ include file="../navbar.jsp"%>

<div class="container mt-5">
    <!-- Book Details Section -->
    <div class="col">
        <div>
            <%
                // Retrieve the book information from the request attribute
                Book book = (Book) request.getAttribute("book");

                if (book != null) {
            %>

            <div class="container mt-5">
                <div class="row">
                    <!-- Book Image Column -->
                    <div class="col-md-6">
                        <img src="<%=book.getBookImage()%>" alt="Book Cover" class="img-fluid mb-3" style="max-height: 475px">
                    </div>

                    <!-- Book Details Column -->
                    <div class="col-md-6">
                        <h1><%=book.getTitle()%></h1>
                        <p class="text-muted mb-2">Author: <%=book.getAuthor()%></p>

                        <!-- Star Rating Display -->
                        <div class="rating mb-3">
                            <div class="stars">
                                <span class="bi bi-star-fill checked"></span>
                                <span class="bi bi-star-fill checked"></span>
                                <span class="bi bi-star-fill checked"></span>
                                <span class="bi bi-star"></span>
                                <span class="bi bi-star"></span>
                            </div>
                            <span class="review-no ml-2">41 reviews</span>
                        </div>

                        <p><%=book.getDescription()%></p>

                        <div class="row">
                            <dt class="col-3">Category:</dt>
                            <dd class="col-9"><%=book.getCategory()%></dd>
                            <dt class="col-3">Book Status:</dt>
                            <dd class="col-9"><%=book.getBookStatus()%></dd>
                        </div>

                        <div class="mb-3 mt-3">
                            <span class="h5">$<%=book.getPrice()%></span>
                            <span class="text-muted">/per book</span>
                        </div>




                        <%
                            user = (User) session.getAttribute("user");
                            if (user == null) {
                        %>
                        <div class="mb-3 d-flex align-items-center">
                            <label for="quantity" class="form-label fw-bold mb-0 me-2">Quantity</label>
                            <select name="quantity" class="form-select form-select-sm" id="quantity" style="width: 30%; border-color: #007bff;">
                                <option selected>1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </div>
                        <div class="d-flex align-items-center">
                            <button type="button" class="btn btn-primary me-2" data-bs-toggle="modal" data-bs-target="#modalLogin">
                                <i class="ri-shopping-cart-line px-2"></i>Add to Cart
                            </button>
                            <button type="button" class="btn btn-warning text-white" data-bs-toggle="modal" data-bs-target="#modalLogin">
                                <i class="ri-shopping-cart-line me-2"></i>Buy Now
                            </button>
                            <p class="text-danger ms-2 mt-3 fst-italic">Please login to add to cart</p>
                        </div>
                        <%
                        } else {
                        %>
                        <form id="addToCartForm" method="post" action="${pageContext.request.contextPath}/addCart">
                            <input type="hidden" name="bookId" value="<%= book.getBookId() %>">
                            <input type="hidden" name="action" id="action" value="addToCart">
                            <input type="hidden" name="userId" value="<%= user.getId() %>">
                            <div class="mb-3 d-flex align-items-center">
                                <label for="quantity" class="form-label fw-bold mb-0 me-2">Quantity</label>
                                <select name="quantity" class="form-select form-select-sm" id="quantity" style="width: 30%; border-color: #007bff;">
                                    <option selected>1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                            <div class="d-flex align-items-center">

                                <button type="button" class="btn btn-primary me-2" onclick="submitAddToCartForm()"> <i class="ri-shopping-cart-line px-2"></i>Add to Cart</button>
                                <button type="button" class="btn btn-warning text-white" onclick="submitBuyNowForm()"> <i class="ri-shopping-cart-line px-2"></i>Buy Now</button>

                            </div>
                        </form>
                        <%
                            }
                        %>

                        <script>
                            function addToCart(bookId) {
                                document.getElementById("action").value = "addToCart";
                                var quantity = document.getElementById("quantity").value;
                                window.location.href = "${pageContext.request.contextPath}/addCart?bookId=" + bookId + "&quantity=" + quantity;
                            }

                            function submitBuyNowForm() {
                                document.getElementById("action").value = "buyNow";
                                document.getElementById("addToCartForm").submit();
                            }

                            function submitAddToCartForm() {
                                document.getElementById("action").value = "addToCart";
                                document.getElementById("addToCartForm").submit();
                            }

                        </script>









                    </div>
                </div>
            </div>
            <%
            } else {
            %>
            <p>No book details found.</p>
            <%
                }
            %>
        </div>
    </div>
</div>


<hr>


<!-- Comment Section -->
<div class="container mt-5">

    <div class="row">

        <div class="col-lg-8">

            <h2 class="mb-4">Book Comments</h2>

            <!-- Display existing comments -->
            <div class="comment-section">
                <%
                    List<Comment> comments = (List<Comment>) request.getAttribute("comments");

                    if (comments != null) {
                        for (Comment comment : comments) {
                %>
                <div class="comment border-bottom">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="comment-user h5"><span style="color: #007bff; font-weight: bold;"><%= comment.getUser().getFirstname() %></span></div>
                            <div class="comment-text mb-2 fs-6"><em><%= comment.getCommentText() %></em></div>
                        </div>
                        <div class="col-md-4">
                            <div class="comment-actions text-muted text-lg-right">
                                <span class="comment-rating">Rating: <%= comment.getRating() %></span>
<%--                                <span class="comment-date ml-3"><%= comment.getTimestamp() %></span>--%>





                                <%  user = (User) session.getAttribute("user");
                                    if (user != null && user.getId() == comment.getUser().getId()) { %>
                                <div class="d-flex justify-content-end">
                                    <form method="get" action="DeleteComment">
                                        <input type="hidden" name="commentId" value="<%= comment.getCommentId() %>">
                                        <input type="hidden" name="bookId" value="<%= request.getParameter("bookId") %>">
                                        <button type="submit" class="btn btn-link text-danger">Delete</button>
                                    </form>
                                </div>
                                <% } %>
                            </div>
                        </div>
                    </div>
                    <!--
<%--                    <% User user = (User) session.getAttribute("user");--%>
                        if (user != null && user.getId() == comment.getUser().getId()) { %>
                    <div class="d-flex justify-content-end">


                        <form method="post" action="UpdateComment" class="mr-2">
                            <input type="hidden" name="commentId" value="<%= comment.getCommentId() %>">
                            <input type="hidden" name="bookId" value="<%= request.getParameter("bookId") %>">
                            <button type="submit" class="btn btn-link text-primary">Update</button>
                        </form>


                        <form method="get" action="DeleteComment">
                            <input type="hidden" name="commentId" value="<%= comment.getCommentId() %>">
                            <input type="hidden" name="bookId" value="<%= request.getParameter("bookId") %>">
                            <button type="submit" class="btn btn-link text-danger">Delete</button>
                        </form>

                    </div>

                      -->
                </div>
                <% } %>
                <% } else { %>
                <p>No comments available for this book.</p>
                <% } %>
            </div>
        </div>

        <div class="col-lg-4">
            <% user = (User) session.getAttribute("user");
                if (user != null) { %>
            <div class="comment-section mt-4">
                <h3 class="mb-3">Add a Comment</h3>
                <form method="post" action="AddComment">
                    <input type="hidden" name="bookId" value="<%= request.getParameter("bookId") %>">
                    <input type="hidden" name="userId" value="<%= user.getId() %>">
                    <div class="form-group">
                        <label for="commentText">Your Comment:</label>
                        <textarea name="commentText" id="commentText" rows="5" class="form-control"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="rating">Rating:</label>
                        <select name="rating" id="rating" class="form-control">
                            <option value="1">1 Star</option>
                            <option value="2">2 Stars</option>
                            <option value="3">3 Stars</option>
                            <option value="4">4 Stars</option>
                            <option value="5">5 Stars</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit Comment</button>
                </form>
            </div>
            <% } %>

        </div>
</div>




<%--<section>--%>
<%--  <div class="container my-5 py-5 text-dark">--%>
<%--    <div class="row d-flex justify-content-center">--%>
<%--      <div class="col-md-12 col-lg-10 col-xl-8">--%>
<%--        <div class="d-flex justify-content-between align-items-center mb-4">--%>
<%--          <h4 class="text-dark mb-0">Unread comments (4)</h4>--%>
<%--&lt;%&ndash;          <div class="card">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <div class="card-body p-2 d-flex align-items-center">&ndash;%&gt;--%>
<%--&lt;%&ndash;              <h6 class="text-primary fw-bold small mb-0 me-1">Comments "ON"</h6>&ndash;%&gt;--%>
<%--&lt;%&ndash;              <div class="form-check form-switch">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked />&ndash;%&gt;--%>
<%--&lt;%&ndash;                <label class="form-check-label" for="flexSwitchCheckChecked"></label>&ndash;%&gt;--%>
<%--&lt;%&ndash;              </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;          </div>&ndash;%&gt;--%>
<%--        </div>--%>

<%--          <%--%>
<%--              List<Comment> comments = (List<Comment>) request.getAttribute("comments");--%>

<%--              if (comments != null) {--%>
<%--                  for (Comment comment : comments) {--%>
<%--          %>--%>

<%--        <div class="card mb-3">--%>
<%--          <div class="card-body">--%>
<%--            <div class="d-flex flex-start">--%>
<%--              <img class="rounded-circle shadow-1-strong me-3"--%>
<%--                src="#" alt="avatar" width="40"--%>
<%--                height="40" style="background-color: #4ade80;">--%>
<%--              <div class="w-100">--%>
<%--                <div class="d-flex justify-content-between align-items-center mb-3">--%>
<%--                  <h6 class="text-warning fw-bold mb-0">--%>
<%--                      <%= comment.getUser().getFirstname() %>--%>
<%--                    <span class="text-dark ms-2"><%= comment.getCommentText() %></span>--%>
<%--                  </h6>--%>
<%--                  <p class="mb-0"><%= comment.getTimestamp() %></p>--%>
<%--                </div>--%>
<%--                <div class="d-flex justify-content-between align-items-center">--%>
<%--                  <p class="small mb-0" style="color: #aaa;">--%>
<%--                    <a href="DeleteComment" class="link-grey text-info">Remove</a> •--%>
<%--                    <a href="UpdateComment" class="link-grey text-danger">Update</a>--%>
<%--                  </p>--%>
<%--                  <div class="d-flex flex-row">--%>
<%--                    <i class="fas fa-star text-warning me-2"></i>--%>
<%--                    <i class="far fa-check-circle" style="color: #aaa;"></i>--%>
<%--                      <%= comment.getRating() %> Stars--%>
<%--                  </div>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>

<%--          <% } %>--%>
<%--          <% } else { %>--%>
<%--          <p>No comments available for this book.</p>--%>
<%--          <% } %>--%>

<%--      </div>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</section>--%>

<%--<section>--%>

<%--    <% User user = (User) session.getAttribute("user");--%>
<%--        if (user != null) { %>--%>



<%--    <div class="container my-5 py-5 text-dark">--%>
<%--        <div class="row d-flex justify-content-center">--%>
<%--            <div class="col-md-12 col-lg-10 col-xl-8">--%>
<%--                <div class="d-flex justify-content-between align-items-center mb-4">--%>
<%--                    <h4 class="text-dark mb-0">Add a Comment</h4>--%>
<%--                </div>--%>
<%--            </div>--%>


<%--                <% } %>--%>
<%--</section>--%>






</body>
</html>