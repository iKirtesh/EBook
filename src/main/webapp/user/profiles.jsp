<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Profile</title>
    <%@ include file="../navbar.jsp"%>
    <%@ include file="../components/bootstrap.jsp"%>
    <style>
        body { background-color: #f8f9fa; }
        .profile-circle {
            width: 200px; height: 200px; border-radius: 50%; background-color: #007bff; color: #fff;
            text-align: center; line-height: 150px; font-size: 60px; margin: 0 auto;
        }
        .details-section {
            margin-top: 2rem;
        }
    </style>
</head>
<body>

<%
    try {
        user = (User) request.getSession().getAttribute("user");
        if (user != null) {
%>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-body">
                    <div class="profile-circle mx-auto mb-3">
                        <p style="margin: 0; vertical-align: middle; ">
                            <%= user.getFirstname().charAt(0) %><%= user.getLastname().charAt(0) %>
                        </p>
                    </div>

                    <div class="row">
                        <div class="col-6">
                            <h5 class="card-title"><%= user.getFirstname() %> <%= user.getLastname() %></h5>
                        </div>
                        <div class="col-6 text-right">
                            <p class="card-text"><small class="text-muted">Email: <%= user.getEmail() %></small></p>
                        </div>
                    </div>

                    <div class="details-section mt-3">
                        <dl class="row">
                            <dt class="col-sm-3">First Name:</dt>
                            <dd class="col-sm-9"><%= user.getFirstname() %></dd>

                            <dt class="col-sm-3">Last Name:</dt>
                            <dd class="col-sm-9"><%= user.getLastname() %></dd>

                            <dt class="col-sm-3">Email:</dt>
                            <dd class="col-sm-9"><%= user.getEmail() %></dd>
                        </dl>
                    </div>

                    <div class="text-center mt-4">
                        <button class="btn btn-primary" onclick="changePassword()">Change Password</button>
                        <button class="btn btn-success" onclick="updateProfile()">Update Profile</button>
                        <button class="btn btn-danger" onclick="deleteProfile()">Delete Profile</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%
} else {
%>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6 text-center">
            <div class="alert alert-warning" role="alert">
                <strong>User not logged in!</strong> Please log in to view your profile.
            </div>
        </div>
    </div>
</div>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
