<%--
  Created by IntelliJ IDEA.
  User: kirte
  Date: 04-01-2024
  Time: 02:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>



<div class="modal p-4 py-md-5" id="modalUpdate" tabindex="-1" role="dialog" aaria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <h1 class="fw-bold mb-0 fs-2">Update User Information</h1>
            </div>

            <div class="modal-body p-5 pt-0">
                <form method="post" action="adminUpdate" class="needs-validation" novalidate>


                    <div class="row">

                        <div class="col-md-6 mb-3">
                            <div class="form-floating">
                                <input type="text" class="form-control rounded-3" id="updateFirstName" placeholder="firstname" name="firstname" required>
                                <label for="updateFirstName">First Name</label>
                            </div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <div class="form-floating">
                                <input type="text" class="form-control rounded-3" id="updateLastName" placeholder="lastname" name="lastname" required>
                                <label for="updateLastName">Last Name</label>
                            </div>
                        </div>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="email" class="form-control rounded-3" id="updateEmail" placeholder="name@example.com" name="email">
                        <label for="updateEmail">Email address</label>
                    </div>

                    <div class="form-floating mb-3">
                        <select class="form-select rounded-3" id="updateStatus" name="status">
                            <option value="active">Active</option>
                            <option value="disabled">Disabled</option>
                        </select>
                        <label for="updateStatus">Status</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="password" class="form-control rounded-3" id="updatePassword" placeholder="password" name="password" required>
                        <label for="updatePassword">Password</label>
                    </div>

                    <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit">Update User</button>
                    <small class="text-body-secondary">By clicking Update User, you agree to the terms of use.</small>
                </form>
            </div>
        </div>
    </div>
</div>


<script>

    function updateUser(firstName, lastName, email, status, password) {
        document.getElementById('updateFirstName').value = firstName;
        document.getElementById('updateLastName').value = lastName;
        document.getElementById('updateEmail').value = email;
        document.getElementById('updateStatus').value = status;
        document.getElementById('updatePassword').value = password;

        // modal show
        var myModal = new bootstrap.Modal(document.getElementById('modalUpdate'), {
            keyboard: false
        });

        document.addEventListener('DOMContentLoaded', function () {
            myModal.show();
        });
    }
</script>


</body>
</html>
