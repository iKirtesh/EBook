<%--
  Created by IntelliJ IDEA.
  User: kirte
  Date: 03-01-2024
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <title>Bootstrap Sidebar</title>
    <%@ include file="../components/bootstrap.jsp" %>

    <style>
        .sidebar li .submenu{
            list-style: none;
            margin: 0;
            padding: 0;
            padding-left: 1rem;
            padding-right: 1rem;
        }
    </style>

</head>
<body>



<div class="d-flex flex-column flex-shrink-0 p-1 text-bg-dark sidebar card py-2" style="height: 100vh;">
<%--    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">--%>
<%--        <svg class="bi pe-none me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>--%>
<%--        <span class="fs-4">Sidebar</span>--%>
<%--    </a>--%>
    <ul class="nav nav-pills flex-column mb-auto text-white nav flex-column" id="nav_accordion">
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/adminHome.jsp" class="nav-link active" aria-current="page">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
                    <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5z"></path>
                </svg> Home
            </a>
        </li>
<%--        <li>--%>

<%--            <a href="#" class="nav-link text-white">--%>
<%--                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"></use></svg>--%>
<%--                Dashboard--%>
<%--            </a>--%>
<%--        </li>--%>

        <li class="nav-item has-submenu text-white link-light">
            <a class="nav-link link-light" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
                <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5m.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1z"/>
            </svg> User Management</a>
            <ul class="submenu collapse">
                <li><a class="nav-link link-light" href="${pageContext.request.contextPath}/admin/AllUsers.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
                    <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5.784 6A2.24 2.24 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.3 6.3 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5"/>
                </svg> All Users</a></li>
                <li><a class="nav-link link-light" href="${pageContext.request.contextPath}/admin/ActiveUsers.jsp">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M8 8a4 4 0 1 0 0-8 4 4 0 0 0 0 8Zm4 0a4 4 0 1 0 0-8 4 4 0 0 0 0 8Zm-2 4a2 2 0 1 1 0-4 2 2 0 0 1 0 4Zm-4-2a4 4 0 1 0 0-8 4 4 0 0 0 0 8Zm-2 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4Z"/>
                    </svg>
                    Active Users</a></li>
                <li><a class="nav-link link-light" href="${pageContext.request.contextPath}/admin/DisabledUsers.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-slash" viewBox="0 0 16 16">
                    <path d="M13.879 10.414a2.501 2.501 0 0 0-3.465 3.465zm.707.707-3.465 3.465a2.501 2.501 0 0 0 3.465-3.465m-4.56-1.096a3.5 3.5 0 1 1 4.949 4.95 3.5 3.5 0 0 1-4.95-4.95ZM11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4m.256 7a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1z"/>
                </svg> Disables Users</a></li>
                <li><a class="nav-link link-light" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-vcard" viewBox="0 0 16 16">
                    <path d="M5 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4m4-2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5M9 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4A.5.5 0 0 1 9 8m1 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5"/>
                    <path d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2zM1 4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H8.96q.04-.245.04-.5C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 1 1 12z"/>
                </svg> User Address</a> </li>
            </ul>
        </li>

        <li class="nav-item has-submenu text-white">
            <a class="nav-link link-light" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-journal-bookmark-fill" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M6 1h6v7a.5.5 0 0 1-.757.429L9 7.083 6.757 8.43A.5.5 0 0 1 6 8z"/>
                <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2"/>
                <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1z"/>
            </svg> Book Management</a>
            <ul class="submenu collapse">
                <li><a class="nav-link link-light" href="${pageContext.request.contextPath}/book/addBook.jsp">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-journals" viewBox="0 0 16 16">
                        <path d="M5 0h8a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2 2 2 0 0 1-2 2H3a2 2 0 0 1-2-2h1a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1H1a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v9a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H5a1 1 0 0 0-1 1H3a2 2 0 0 1 2-2"/>
                        <path d="M1 6v-.5a.5.5 0 0 1 1 0V6h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0V9h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 2.5v.5H.5a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1H2v-.5a.5.5 0 0 0-1 0"/>
                    </svg> All Books</a></li>
                <li><a class="nav-link link-light" href="#">Google Books</a></li>
                <li><a class="nav-link link-light" href="#">New Books</a> </li>
                <li><a class="nav-link link-light" href="#">Old Books</a></li>
            </ul>
        </li>
        <li class="nav-item has-submenu text-white">
            <a class="nav-link link-light" href="#">Order Management</a>
            <ul class="submenu collapse">
                <li><a class="nav-link link-light" href="#">All Orders</a></li>
                <li><a class="nav-link link-light" href="#">Pending Orders</a></li>
                <li><a class="nav-link link-light" href="#">Confirmed</a> </li>
            </ul>
        </li>
        <li>
            <a href="#" class="nav-link text-white">
                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#people-circle"></use></svg>
                Customers
            </a>
        </li>
    </ul>
</div>


<script>
    document.addEventListener("DOMContentLoaded", function(){
        document.querySelectorAll('.sidebar .nav-link').forEach(function(element){

            element.addEventListener('click', function (e) {

                let nextEl = element.nextElementSibling;
                let parentEl  = element.parentElement;

                if(nextEl) {
                    e.preventDefault();
                    let mycollapse = new bootstrap.Collapse(nextEl);

                    if(nextEl.classList.contains('show')){
                        mycollapse.hide();
                    } else {
                        mycollapse.show();
                        // find other submenus with class=show
                        var opened_submenu = parentEl.parentElement.querySelector('.submenu.show');
                        // if it exists, then close all of them
                        if(opened_submenu){
                            new bootstrap.Collapse(opened_submenu);
                        }
                    }
                }
            }); // addEventListener
        }) // forEach
    });
    // DOMContentLoaded  end
</script>

</body>
</html>
