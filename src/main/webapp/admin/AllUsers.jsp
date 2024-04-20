<%--
  Created by IntelliJ IDEA.
  User: kirte
  Date: 04-01-2024
  Time: 06:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Users</title>
<%@ include file="navbar.jsp"%>

</head>
<body>
<div class="container-md-3">
    <div class="row gap-5 ">
        <div class="col-lg-2">

            <%@ include file="sidebar.jsp"%>
        </div>
        <div class="col-lg-9 border-gray-100">
            <%@ include file="userManagement.jsp"%>
        </div>
    </div>
</div>
</body>
</html>
