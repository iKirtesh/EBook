<%@ page import="java.util.List" %>
<%@ page import="entity.Cart" %>

<%@ page import="entity.Book" %>
<%@ page import="DAO.AddressDao" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Cart</title>
    <%@ include file="../components/bootstrap.jsp"%>

    <style>
        /* Custom class for quantity control buttons */
        .quantity-control {
            display: flex;
            align-items: center;
        }

        .quantity-button {
            width: 30px; /* Set a fixed width */
            height: 30px; /* Set a fixed height */
            font-size: 20px; /* Adjust the font size if needed */
            display: flex;
            color :rgba(33, 37, 41, 0.75);
            align-items: center;
            justify-content: center;
        }
    </style>
</head>
<body>
<%@ include file="../navbar.jsp"%>

<div class="container" style="max-width: 960px">
    <main>
        <div class="py-5 text-center">
<%--            <img class="d-block mx-auto mb-4" src="https://getbootstrap.com/docs/5.0/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">--%>
            <h2>Checkout form</h2>
<%--            <p class="lead">Below is an example form built entirely with Bootstrap’s form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p>--%>
        </div>

        <div class="row g-5">
<%--            <div class="col-md-5 col-lg-4 cart-md-last">--%>

<%--                <%--%>
<%--                    user = (User) session.getAttribute("user");--%>

<%--                    if (user != null) {--%>
<%--                        int userId = user.getId();--%>
<%--                        CartDao cartDao = new CartDao(DBConnect.getConnection());--%>
<%--                        List<Cart> cartItems = cartDao.getAllCart(userId);--%>
<%--                %>--%>
<%--                <h4 class="d-flex justify-content-between align-items-center mb-3">--%>
<%--                    <span class="text-primary">Your cart</span>--%>
<%--                    <span class="badge bg-primary rounded-pill"><%= cartDao.totalCart(userId) %></span>--%>
<%--                </h4>--%>
<%--                <ul class="list-group mb-3">--%>
<%--                    <%--%>
<%--                            for (Cart cartItem : cartItems) {--%>
<%--                    %>--%>

<%--                    <li class="list-group-item d-flex justify-content-between lh-sm position-relative">--%>
<%--                        <img src="https://m.media-amazon.com/images/I/819DmGB3vhL._AC_UF1000,1000_QL80_.jpg" alt="product image" class="img-fluid" style="width: 60px; height: 77px; object-position: center"/>--%>
<%--                        <div>--%>
<%--                            <h6 class="my-0"><%= cartItem.getBookName() %></h6>--%>
<%--                            <small class="text-body-secondary"><%= cartItem.getStatus() %></small>--%>
<%--                        </div>--%>
<%--                        <span class="text-body-secondary productPrice">$<%= cartItem.getTotalAmount() %></span>--%>
<%--                        <div class="position-absolute bottom-0 end-0 me-2 mb-2">--%>
<%--                            <a href="${pageContext.request.contextPath}/removeCart?remove=<%= cartItem.getCartId() %>" class="badge bg-danger rounded-pill">Remove</a>--%>
<%--                        </div>--%>
<%--                    </li>--%>

<%--&lt;%&ndash;                    loop ends here &ndash;%&gt;--%>
<%--                    <%--%>
<%--                        }--%>
<%--                    %>--%>


<%--                    <li class="list-group-item d-flex justify-content-between">--%>
<%--                        <span>Total (USD)</span>--%>
<%--                        <strong class="totalPrice">$<%= cartDao.cartTotalPrice(userId) %></strong>--%>
<%--                    </li>--%>


<%--                    <%--%>
<%--                        } else {--%>
<%--                    %>--%>
<%--                    <li class="list-group-item d-flex justify-content-between lh-sm position-relative">--%>
<%--                        <div>--%>
<%--                            <h6 class="my-0">No items in cart</h6>--%>

<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <%--%>
<%--                        }--%>

<%--                    %>--%>



<%--                </ul>--%>
<%--            </div>--%>




    <div class="col-md-5 col-lg-4 cart-md-last">
        <% user = (User) session.getAttribute("user");

            if (user != null) {
                int userId = user.getId();
                CartDao cartDao = new CartDao(DBConnect.getConnection());
                List<Cart> cartItems = cartDao.getAllCart(userId);
                List<Cart> buyNowItems = cartDao.getBuyNowItems(userId);
        %>
        <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-primary">Your cart</span>
            <span class="badge bg-primary rounded-pill" id="totalCartBadges"><%= cartDao.totalBuy(userId) %></span>
        </h4>

        <div class="d-flex justify-content-between align-items-center mb-3">
            <button type="button" class="btn btn-warning btn-sm text-white" onclick="showBuyNowSections()">Show Buy Now</button>
            <button type="button" class="btn btn-primary btn-sm" onclick="showCartSections()">Show In Cart</button>
        </div>

        <div id="cartSections" style="display:none;">
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

        <div id="buyNowSections">
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
            function showBuyNowSections() {
                document.getElementById('cartSections').style.display = 'none';
                document.getElementById('buyNowSections').style.display = 'block';
                updateTotalBadges('totalCartBadges', '<%= cartDao.totalBuy(userId) %>');
            }

            function showCartSections() {
                document.getElementById('cartSections').style.display = 'block';
                document.getElementById('buyNowSections').style.display = 'none';
                updateTotalBadges('totalCartBadges', '<%= cartDao.totalCart(userId) %>');
            }

            function updateTotalBadges(badgeId, totalItems) {
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


    <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">Billing address</h4>

        <%
           user = (User) session.getAttribute("user");
            AddressDao addressDao = new AddressDao(DBConnect.getConnection());
        %>

        <form action="${pageContext.request.contextPath}/addAddress" method="post" class="needs-validation" novalidate>
        <div class="row g-3">
                <div class="col-sm-6">
                    <label for="firstName" class="form-label">First name</label>
                    <input type="text" class="form-control" id="firstName" placeholder="Firstname" value="<%= user.getFirstname() %>" required>
                    <div class="invalid-feedback">
                        Valid first name is required.
                    </div>
                </div>

                <div class="col-sm-6">
                    <label for="lastName" class="form-label">Last name</label>
                    <input type="text" class="form-control" id="lastName" placeholder="Lastname" value="<%= user.getLastname() %>" required>
                    <div class="invalid-feedback">
                        Valid last name is required.
                    </div>
                </div>

                <div class="col-12">
                    <label for="email" class="form-label">Email <span class="text-body-secondary"></span></label>
                    <input type="email" class="form-control" id="email" placeholder="you@example.com" value="<%= user.getEmail() %>" required>
                    <div class="invalid-feedback">
                        Please enter a valid email address for shipping updates.
                    </div>
                </div>

                <div class="col-12">
                    <label for="address" class="form-label">Address</label>
                    <input type="text" class="form-control" name="address" id="address" placeholder="1234 Main St" required>
                    <div class="invalid-feedback">
                        Please enter your shipping address.
                    </div>
                </div>

                <div class="col-md-5">
                    <label for="city" class="form-label">City</label>
                    <input type="text" class="form-control" name="city" id="city" placeholder="" required>
                    <div class="invalid-feedback">
                        Please enter your city.
                    </div>
                </div>

                <div class="col-md-5">
                    <label for="country" class="form-label">Country</label>
                    <select class="form-select" name="country" id="country" required>
                        <option value="">Choose...</option>
                        <option>India</option>
                    </select>
                    <div class="invalid-feedback">
                        Please select a valid country.
                    </div>
                </div>

                <div class="col-md-4">
                    <label for="state" class="form-label">State</label>
                    <select class="form-select" name="state" id="state" required>
                        <option value="">Choose...</option>
                        <option>Andhra Pradesh</option>
                        <option>Maharashtra</option>
                        <option>Telangana</option>
                        <option>Tamil Nadu</option>
                        <option>Kerala</option>
                        <option>Karnataka</option>
                        <option>Madhya Pradesh</option>
                        <option>Goa</option>
                        <option>Gujarat</option>
                        <option>Haryana</option>
                        <option>Himachal Pradesh</option>
                        <option>Punjab</option>
                        <option>Rajasthan</option>
                        <option>Dadra and Nagar Haveli</option>
                    </select>
                    <div class="invalid-feedback">
                        Please provide a valid state.
                    </div>
                </div>

                <div class="col-md-3">
                    <label for="zipCode" class="form-label">Zip</label>
                    <input type="text" class="form-control" name="zipCode" id="zipCode" placeholder="" required>
                    <div class="invalid-feedback">
                        Zip code required.
                    </div>
                </div>
            </div>

            <hr class="my-4">

            <div class="form-check">
                <input type="checkbox" class="form-check-input" id="saveInfo" name="saveInfo">
                <label class="form-check-label" for="saveInfo">Save this information for next time</label>
            </div>

            <hr class="my-4">

            <button class="w-100 btn btn-primary btn-lg" type="submit">Continue to checkout</button>
        </form>
    </div>



        </div>
    </main>
</div>



</body>
</html>
