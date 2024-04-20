<%@ page import="entity.User" %>
<%@ page import="DAO.CartDao" %>
<%@ page import="com.db.DBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="entity.Cart" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Book Store</title>
</head>

<body>

<header class="p-2 text-bg-dark">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <%--            <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">--%>
            <%--                <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>--%>
            <%--            </a>--%>

            <img src="${pageContext.request.contextPath}/images/Logo.png" alt="" width="50" height="50" class="d-inline-block align-text-top link-opacity-50-hover">

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-3 justify-content-center mb-md-0">
                <li><a href="#" class="nav-link active px-2 text-secondary link-opacity-50-hover"><i class="ri-home-6-line px-2"></i>Home</a></li>
                <li><a href="RecentBooks.jsp" class="nav-link active px-2 text-white"><i class="ri-book-line px-2"></i>Recent Books</a></li>
                <li><a href="#" class="nav-link active px-2 text-white"><i class="ri-booklet-line px-2"></i>New Books</a></li>

                <li><a href="book/OldBooks.jsp" class="nav-link px-2 text-white"><i class="ri-book-open-line px-2"></i>Old Books</a></li>
            </ul>

            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-4" role="search">
                <input name="search" type="search" class="form-control form-control-dark text-bg-dark" placeholder="Search..." aria-label="Search">
            </form>

                <%
                    User user = (User) session.getAttribute("user");

                    if (user != null) {
                        try {
                            Connection connection = DBConnect.getConnection();
                            CartDao cartDao = new CartDao(connection);
                            int cartItemCount = cartDao.countCart(user.getId());
                %>

                <div class="text-end">
                    <!-- Shopping Cart Button -->
                    <div class="d-inline-block">
                        <button class="btn btn-warning me-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#myOffcanvas">
                            <i class="ri-shopping-cart-line px-1"></i>Cart <%= cartItemCount %>
                        </button>
                    </div>

                <!-- User Dropdown -->
                    <div class="d-inline-block">
                        <div class="text-end">

                            <a href="#" class="d-block link-body-emphasis text-decoration-none btn btn-primary" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="ri-admin-line px-1"></i><%= user.getFirstname() %>
                            </a>

                            <ul class="dropdown-menu text-small" data-popper-placement="bottom-start" style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate3d(0px, 34.4px, 0px);">
                                <li><a class="dropdown-item" href="#">Orders...</a></li>
                                <li><a class="dropdown-item" href="#">Settings</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/profile.jsp">Profile</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Sign out</a></li>
                            </ul>
                        </div>
                    </div>
                <%
                } catch (Exception e) {
                    e.printStackTrace();
                }
                } else {
                %>
                    <div class="text-end">
                        <!-- Sign In Button -->
                        <button type="button" class="btn btn-outline-light me-2" data-bs-toggle="modal" data-bs-target="#modalLogin">
                            <i class="ri-login-box-line px-1"></i>Sign in
                        </button>

                        <!-- Sign Up Button -->
                        <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#modalSignUp">
                            <i class="ri-user-add-line px-1"></i>Sign up
                        </button>
                    </div>

                <% } %>
            </div>
        </div>
    </div>
</header>

<!-- Offcanvas Content -->
<div class="offcanvas offcanvas-start" tabindex="-1" id="myOffcanvas">
    <div class="offcanvas-header">
        <%--                            <h5 class="offcanvas-title">Offcanvas Title</h5>--%>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <div class="cart-md-last">
            <% user = (User) session.getAttribute("user");

                if (user != null) {
                    int userId = user.getId();
                    CartDao cartDao = new CartDao(DBConnect.getConnection());
                    List<Cart> cartItems = cartDao.getAllCart(userId);
                    List<Cart> buyNowItems = cartDao.getBuyNowItems(userId);
            %>
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-primary">Your cart</span>
                <span class="badge bg-primary rounded-pill" id="totalCartBadge"><%= cartDao.totalCart(userId) %></span>
            </h4>

            <div class="d-flex justify-content-between align-items-center mb-3">
                <button type="button" class="btn btn-primary btn-sm" onclick="showCartSection()">Show In Cart</button>
                <button type="button" class="btn btn-warning btn-sm text-white" onclick="showBuyNowSection()">Show Buy Now</button>
            </div>

            <div id="cartSection" style="display:block;"> <!-- Set display:block -->
                <ul class="list-group mb-3">
                    <% for (Cart cartItem : cartItems) { %>
                    <!-- Render "In Cart" items -->
                    <li class="list-group-item d-flex justify-content-between lh-sm position-relative">
                        <!-- Product details -->
                        <img src="https://m.media-amazon.com/images/I/819DmGB3vhL._AC_UF1000,1000_QL80_.jpg" alt="product image" class="img-fluid" style="width: 60px; height: 77px; object-position: center"/>
                        <div>
                            <h6 class="my-0"><%= cartItem.getBookName() %></h6>
                            <small class="text-body-secondary"><%= cartItem.getStatus() %></small>
                        </div>
                        <span class="text-body-secondary productPrice">$<%= cartItem.getTotalAmount() %></span>

                        <!-- Remove button -->
                        <div class="position-absolute bottom-0 end-0 me-2 mb-2">
                            <a href="${pageContext.request.contextPath}/removeCart?remove=<%= cartItem.getCartId() %>"
                               class="badge bg-danger rounded-pill">Remove</a>
                        </div>
                    </li>
                    <% } %>

                    <li class="list-group-item d-flex justify-content-between">
                        <span>Total (USD)</span>
                        <strong>$<%= cartDao.cartTotalPrice(userId) %></strong>
                    </li>
                </ul>
            </div>

            <div id="buyNowSection" style="display:none;">
                <ul class="list-group mb-3">
                    <% for (Cart buyNowItem : buyNowItems) { %>
                    <!-- Render "Buy Now" items -->
                    <li class="list-group-item d-flex justify-content-between lh-sm position-relative">
                        <!-- Product details -->
                        <img src="https://m.media-amazon.com/images/I/819DmGB3vhL._AC_UF1000,1000_QL80_.jpg" alt="product image" class="img-fluid" style="width: 60px; height: 77px; object-position: center"/>
                        <div>
                            <h6 class="my-0"><%= buyNowItem.getBookName() %></h6>
                            <small class="text-body-secondary"><%= buyNowItem.getStatus() %></small>
                        </div>
                        <span class="text-body-secondary productPrice">$<%= buyNowItem.getTotalAmount() %></span>

                        <!-- Remove button -->
                        <div class="position-absolute bottom-0 end-0 me-2 mb-2">
                            <a href="${pageContext.request.contextPath}/removeCart?remove=<%= buyNowItem.getCartId() %>"
                               class="badge bg-danger rounded-pill">Remove</a>
                        </div>
                    </li>
                    <% } %>
                    <li class="list-group-item d-flex justify-content-between">
                        <span>Total (USD)</span>
                        <strong>$<%= cartDao.buyNowTotalPrice(userId) %></strong>
                    </li>
                </ul>
            </div>

            <script>
                function showBuyNowSection() {
                    document.getElementById('cartSection').style.display = 'none';
                    document.getElementById('buyNowSection').style.display = 'block';
                    updateTotalBadge('totalCartBadge', '<%= cartDao.totalBuy(userId) %>');
                }

                function showCartSection() {
                    document.getElementById('cartSection').style.display = 'block';
                    document.getElementById('buyNowSection').style.display = 'none';
                    updateTotalBadge('totalCartBadge', '<%= cartDao.totalCart(userId) %>');
                }

                function updateTotalBadge(badgeId, totalItems) {
                    document.getElementById(badgeId).innerText = totalItems;
                }
            </script>

            <% } else { %>
            <li class="list-group-item d-flex justify-content-between lh-sm position-relative">
                <div>
                    <h6 class="my-0">No items in cart</h6>
                </div>
            </li>
            <% } %>
        </div>
    </div>
</div>




<div class="modal p-4 py-md-5" id="modalSignUp" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <h1 class="fw-bold mb-0 fs-2">Sign up for free</h1>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>

                <%--                    <span aria-hidden="true">&times;</span>--%>
                <%--                </button>--%>
            </div>

            <div class="modal-body p-5 pt-0">
                <form method="post" action="${pageContext.request.contextPath}/register" class="needs-validation" novalidate>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <div class="form-floating">
                                <input type="text" class="form-control rounded-3" id="floatingFirstName" placeholder="firstname" name="firstname" required>
                                <label for="floatingFirstName">First Name</label>
                            </div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <div class="form-floating">
                                <input type="text" class="form-control rounded-3" id="floatingLastName" placeholder="lastname" name="lastname" required>
                                <label for="floatingLastName">Last Name</label>
                            </div>
                        </div>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="email" class="form-control rounded-3" id="floatingEmail" placeholder="name@example.com" name="email">
                        <label for="floatingEmail">Email address</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="password" class="form-control rounded-3" id="floatingPassword" placeholder="password" name="password" required>
                        <label for="floatingPassword">Password</label>
                    </div>
                    <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit">Sign up</button>
                    <small class="text-body-secondary">By clicking Sign up, you agree to the terms of use.</small>
                </form>
            </div>
        </div>
    </div>
</div>



<!-- Modal Login -->

<div class="modal p-4 py-md-5" id="modalLogin" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <h1 class="fw-bold mb-0 fs-2">Log in to your account</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body p-5 pt-0">
                <form method="post" action="${pageContext.request.contextPath}/login" class="needs-validation" novalidate>
                    <div class="form-floating mb-3">
                        <input name="email" type="email" class="form-control rounded-3" id="floatingInput" placeholder="email@email.com" required>
                        <label for="floatingInput">Email address</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input name="password" type="password" class="form-control rounded-3" id="floatingPasswords" placeholder="Password" required>
                        <label for="floatingPasswords">Password</label>
                    </div>
                    <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit"><i class="ri-login-circle-line px-2"></i>Log in</button>
                    <small class="text-body-secondary">By clicking Log in, you agree to our <a href="#">terms of service</a> and <a href="#">privacy statement</a>.</small>
                </form>
            </div>
        </div>
    </div>
</div>






<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>

</body>
</html>

