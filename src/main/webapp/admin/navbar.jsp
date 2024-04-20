<%@ page import="entity.User" %>
<%@ include file="bootstrap.jsp" %>





<header class="p-1 text-bg-dark">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-end justify-content-lg-end">
            <img src="images/bookLogo.png" alt="" width="40" height="32" class="d-inline-block align-text-top link-opacity-50-hover">
            <h4 class="text-light ms-2 my-0">Admin Dashboard</h4>
            <div class="text-end ms-auto ">
                <div class="dropdown text-end">

                    <!-- Show admin-related content -->
                    <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle btn btn-primary" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="ri-admin-line px-2"></i> Admin

                    <ul class="dropdown-menu text-small" data-popper-placement="bottom-start" style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate3d(0px, 34.4px, 0px);">
                        <li><a class="dropdown-item" href="#">New project...</a></li>
                        <li><a class="dropdown-item" href="#">Settings</a></li>
                        <li><a class="dropdown-item" href="#">Profile</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="logout">Sign out</a></li>
                    </ul>

                </div>
            </div>
        </div>
    </div>
</header>
