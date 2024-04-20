<%@ page import="entity.User" %>
<%@ page import="DAO.UserDao" %>
<%@ page import="com.db.DBConnect" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management</title>
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
    // Retrieve the user ID from the request parameter
    int userId = Integer.parseInt(request.getParameter("id"));

    // Retrieve user information from the database using UserDao
    UserDao userDao = new UserDao(DBConnect.getConnection());
    User user = userDao.getUserById(userId);
%>

<div class="center-form">
    <div class="form-container">
        <h2 class="text-center mb-4">Update User Information</h2>

        <form method="post" action="${pageContext.request.contextPath}/admin/userUpdate" class="needs-validation" novalidate>
            <input type="hidden" name="id" value="<%= user.getId() %>">

            <div class="form-floating mb-3">
                <input type="text" class="form-control rounded-3" id="floatingFirstName" placeholder="First Name" name="firstname" value="<%= user.getFirstname()%>" required>
                <label for="floatingFirstName">First Name</label>
            </div>

            <div class="form-floating mb-3">
                <input type="text" class="form-control rounded-3" id="floatingLastName" placeholder="Last Name" name="lastname" value="<%= user.getLastname()%>" required>
                <label for="floatingLastName">Last Name</label>
            </div>

            <div class="form-floating mb-3">
                <input type="text" class="form-control rounded-3" id="floatingEmail" placeholder="Email" name="email" value="<%= user.getEmail()%>" required>
                <label for="floatingEmail">Email</label>
            </div>

            <div class="form-floating mb-3">
                 <select class="form-select rounded-3" id="floatingStatus" name="status" required>
                    <option value="active" <%= "active".equals(user.getStatus()) ? "selected" : "" %>>Active</option>
                    <option value="disabled" <%= "disabled".equals(user.getStatus()) ? "selected" : "" %>>Disabled</option>
                </select>

                <label for="floatingStatus">Status</label>
            </div>

            <div class="form-floating mb-3">
                <input type="text" class="form-control rounded-3" id="floatingPassword" placeholder="Password" name="password" value="<%= user.getPassword()%>" required>
                <label for="floatingPassword">Password</label>
            </div>

            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-primary btn-lg">Update</button>
            </div>


             </form>
    </div>
</div>

</body>
</html>
