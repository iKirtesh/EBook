<%@ page import="entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.UserDao" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Active Users</title>
    <%@ include file="bootstrap.jsp"%>
    <%@ include file="navbar.jsp"%>



</head>
<body>
<div class="container-md-3">
    <div class="row gap-5">
        <div class="col-lg-2">
            <%@ include file="sidebar.jsp"%>
        </div>
        <div class="col-lg-9 border-gray-100">
            <h2>Disabled Users</h2>
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
                        List<User> userList = UserDao.getDisableUsers();
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
                        <a href="${pageContext.request.contextPath}/adminActivate?id=<%= user.getId() %>"
                           class="link-success"
                           onclick="showToast();">Activate</a>

                        <%--            modal in jsp file where id is passed to the modal and the modal is shown  to update the user information, use modal to update the user information by a anchor tag--%>
                        <%--            but i cannot use adminUpdate bcz its already used in form how i can achieve it button tag and get infomation updated --%>
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
        </div>
    </div>
</div>


<div class="toast-container position-fixed bottom-0 end-0 p-3">
    <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header">
            <img src="https://www.colourlovers.com/img/4BB543/130/110/Success_Green.png?ic=1" width="15" height="15" class="rounded me-2" alt="...">
            <strong class="me-auto">Sucessfully Activated</strong>
            <small id="toastTime">Just now</small>
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
        <div class="toast-body">
            User has been activated.
        </div>
    </div>
</div>

<script>
    function showToast() {
        var toastLiveExample = document.getElementById('liveToast')
        var toast = new bootstrap.Toast(toastLiveExample)

        toast.show()
    }
</script>

</body>
</html>
