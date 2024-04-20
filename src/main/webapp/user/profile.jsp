<%@ page import="entity.User" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <%@  include file="../components/bootstrap.jsp" %>
  <style>

    .card {
      border: none;
    }

    .card-header {
      border: 0; /* Removes all borders */
      background-color: #f4f4f4;
    }
  </style>
  <title>User Profile</title>
</head>

<body style="background-color: #f4f4f4;">
<%@  include file="../navbar.jsp" %>

<%
  try {
    user = (User) request.getSession().getAttribute("user");
    if (user != null) {
%>

<div class="container mt-5">
  <!-- Personal Information Section -->
  <div class="card-header">
    <h5>Personal Information</h5>
  </div>
  <div class="card">
    <div class="card-body" style="border-radius: 0.5rem;     border: none;">
      <div class="row">
        <div class="col-md-4">
          <!-- Circular avatar with initials -->
          <div class="rounded-circle bg-primary text-white d-flex align-items-center justify-content-center" style="width: 100px; height: 100px; font-size: 24px;">
            <%= user.getFirstname().charAt(0) %><%= user.getLastname().charAt(0) %>
          </div>
        </div>
        <div class="col-md-8">
          <table class="table table-borderless">
            <tbody>
            <tr>
              <td><strong>Name:</strong></td>
              <td><%= user.getFirstname() %></td>
            </tr>
            <tr>
              <td><strong>Last Name:</strong></td>
              <td><%= user.getLastname() %></td>
            </tr>
            <tr>
              <td><strong>Email:</strong></td>
              <td><%= user.getEmail() %></td>
            </tr>
            <tr>
              <td><strong>Other Personal Info:</strong></td>
              <td>Hi, I am <%= user.getFirstname() %> <%= user.getLastname() %> and I am a student of
            </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="text-end mt-3">
        <button class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>

  <!-- Address Information Section -->
  <div class="card-header mt-4">
    <h5>Address Information</h5>
  </div>
  <div class="card">
    <div class="card-body">
      <table class="table table-borderless">
        <tbody>
        <tr>
          <td><strong>Street:</strong></td>
          <td>123 Main St</td>
        </tr>
        <tr>
          <td><strong>City:</strong></td>
          <td>Anytown</td>
        </tr>
        <tr>
          <td><strong>State:</strong></td>
          <td>CA</td>
        </tr>
        <tr>
          <td><strong>Zip Code:</strong></td>
          <td>12345</td>
        </tr>
        </tbody>
      </table>
    </div>
  </div>

  <!-- Delete Button Section -->
  <div class="text-end mt-4">
    <button class="btn btn-danger">Delete Account</button>
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

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
</body>

</html>