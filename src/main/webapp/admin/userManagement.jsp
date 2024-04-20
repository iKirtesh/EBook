<%@ page import="entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.UserDao" %>
<%@ page import="com.db.DBConnect" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management</title>
    <%@ include file="bootstrap.jsp"%>



</head>
<body>
<table class="table mt-5">
    <thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Full Name</th>
        <th scope="col">Email</th>
        <th scope="col">Status</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        try {
            UserDao userDao = new UserDao(DBConnect.getConnection());
            List<User> userList = userDao.getAllUsers();
            request.setAttribute("userList", userList);

            for (User user : userList) {
    %>
    <tr>
        <td scope="row"><%= user.getId() %></td>
        <td><%= user.getFirstname() %> <%= user.getLastname() %></td>
        <td><%= user.getEmail() %></td>
        <td>
            <% if (user.isDisabled()) { %>
            <span class="badge bg-warning text-dark">Disabled</span>
            <% } else { %>
            <span class="badge bg-success">Active</span>
            <% } %>
        </td>

        <td>

<%--            <a href="${pageContext.request.contextPath}/adminActivate?id=<%= user.getId() %>"--%>
<%--               class="link-success"--%>
<%--               onclick="return confirm('Are you sure you want to disable this user?');">Activate</a>--%>

<%--            <a href="${pageContext.request.contextPath}/adminDisable?id=<%= user.getId() %>"--%>
<%--                class="link-warning"--%>
<%--               onclick="return confirm('Are you sure you want to disable this user?');">Disable</a>--%>

<%--            modal in jsp file where id is passed to the modal and the modal is shown  to update the user information, use modal to update the user information by a anchor tag--%>
<%--            but i cannot use adminUpdate bcz its already used in form how i can achieve it button tag and get infomation updated --%>


            <a href="${pageContext.request.contextPath}/admin/userUpdate.jsp?id=<%= user.getId() %>"
               class="link-primary">Update</a>


            <a href="${pageContext.request.contextPath}/adminDelete?id=<%= user.getId() %>" class="link-danger">Delete</a>
        </td>
    </tr>
    <%
            }
        } catch (Exception e) {
            response.sendRedirect("error.jsp");
        }
    %>
    </tbody>
</table>

</body>
</html>






