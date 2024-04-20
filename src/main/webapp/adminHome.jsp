
<%@ page import="entity.User" %>
<%@ page import="DAO.UserDao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.lang.Boolean" %>
<%@ page import="DAO.BookDao" %>


<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<html>
<head>
    <title>Admin Dashboard</title>
    <%@ include file="admin/navbar.jsp"%>
    <%@ include file="components/bootstrap.jsp"%>

<%--    <%@ include file="userManagement.jsp"%>--%>
</head>
<body>



<%
    Connection dbConnection = (Connection) request.getAttribute("dbConnection");
    UserDao userDao = new UserDao(dbConnection);
    BookDao BookDao = new BookDao(dbConnection);

  %>



<%--make two containers with one is 250px and rest another one in bootstrap --%>

<div class="container-md-3">
    <div class="row gap-5 ">
        <div class="col-lg-2">

            <%@ include file="admin/sidebar.jsp"%>
        </div>
        <div class="col-lg-9 border-gray-100">
            <div class="row mt-5">
                <div class="col-12 col-lg-6 col-xl">

                    <!-- Value  -->
                    <div class="card" style="box-shadow: 0 0.75rem 1.5rem rgba( 0, 0, 0,0.03); margin-bottom: 1.5rem;">
                        <div class="card-body" style="border-color: #e9ecef">
                            <div class="row align-items-center gx-0">
                                <div class="col">
                                    <!-- Title -->
                                    <h6 class="text-uppercase text-body-secondary mb-2" style="color: #95aac9; letter-spacing: .08em  ">
                                        Total Users
                                    </h6>
                                    <!-- Heading -->
                                    <span class="h2 mb-0">
<%--                                      print userListCount in jsp  --%>
                                        <%=userDao.countUsers()%>
                                    </span>


                                    <!-- Badge -->
                                    <span class="badge text-bg-success-subtle mt-n1"  style="background-color: #dcfce7; color: #4ade80">
                      +3.5%
                    </span>
                                </div>
                                <div class="col-auto">
                                    <!-- Icon -->
                                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="h2 text-primary bi bi-people-fill" viewBox="0 0 16 16">
                                        <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5.784 6A2.24 2.24 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.3 6.3 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5"/>
                                    </svg>
                                </div>
                            </div> <!-- / .row -->
                        </div>
                    </div>

                </div>
                <div class="col-12 col-lg-6 col-xl">

                    <!-- Hours -->
                    <div class="card">
                        <div class="card-body">
                            <div class="row align-items-center gx-0">
                                <div class="col">

                                    <!-- Title -->
                                    <h6 class="text-uppercase text-body-secondary mb-2" >
                                       Total Books
                                    </h6>

                                    <!-- Heading -->
                                    <span class="h2 mb-0">
                      <%=BookDao.countBooks()%>
                    </span>
                                    <!-- Badge -->
                                    <span class="badge text-bg-success-subtle mt-n1" style="background-color: #fce7f3; color: #be185d">
                        New
                        </span>

                                </div>
                                <div class="col-auto">

                                    <!-- Icon -->
                                    <span class="h2 fe fe-briefcase text-body-secondary mb-0">

                                    </span>



                                </div>


                            </div> <!-- / .row -->
                        </div>
                    </div>

                </div>
                <div class="col-12 col-lg-6 col-xl">

                    <!-- Exit -->
                    <div class="card">
                        <div class="card-body">
                            <div class="row align-items-center gx-0">
                                <div class="col">

                                    <!-- Title -->
                                    <h6 class="text-uppercase text-body-secondary mb-2">
                                        Pending Orders
                                    </h6>

                                    <!-- Heading -->
                                    <span class="h2 mb-0">
                      35.5%
                    </span>

                                </div>
                                <div class="col-auto">

                                    <!-- Chart -->
                                    <div class="chart chart-sparkline">
                                        <canvas class="chart-canvas" id="sparklineCharts" width="93" height="43" style="display: block; box-sizing: border-box; height: 35px; width: 75px;"></canvas>
                                    </div>

                                </div>
                            </div> <!-- / .row -->
                        </div>
                    </div>

                </div>
                <div class="col-12 col-lg-6 col-xl">

                    <!-- Time -->
                    <div class="card">
                        <div class="card-body">
                            <div class="row align-items-center gx-0">
                                <div class="col">

                                    <!-- Title -->
                                    <h6 class="text-uppercase text-body-secondary mb-2">
                                        Complete Orders
                                    </h6>

                                    <!-- Heading -->
                                    <span class="h2 mb-0">
                      2:37
                    </span>

                                </div>
                                <div class="col-auto">

                                    <!-- Icon -->
                                    <span class="h2 fe fe-clock text-body-secondary mb-0"></span>

                                </div>
                            </div> <!-- / .row -->
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>


<script>
    var sparklineChart = function() {

        var params = {
            type: 'line',
            data: {
                labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                datasets: [{
                    label: 'Total Orders',
                    data: [12, 19, 3, 5, 2, 3, 10],
                    backgroundColor: 'rgba(0,123,255,0.1)',
                    borderColor: '#4c84ff',
                    borderWidth: 2,
                    pointBackgroundColor: '#4c84ff',
                    pointBorderColor: '#fff',
                    pointHoverBackgroundColor: '#4c84ff',
                    pointHoverBorderColor: '#fff',
                    pointRadius: 4,
                    pointHoverRadius: 4,
                    fill: true
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                legend: {
                    display: false
                },
                scales: {
                    xAxes: [{
                        gridLines: {
                            display: false,
                            drawBorder: false,
                            color: 'transparent',
                            zeroLineColor: '#eeeeee'
                        },
                        ticks: {
                            display: false
                        }
                    }],
                    yAxes: [{
                        gridLines: {
                            drawBorder: false,
                            color: '#eeeeee',
                            zeroLineColor: '#eeeeee'
                        },
                        ticks: {
                            display: false,
                            min: 0,
                            max: 30,
                            stepSize: 10
                        }
                    }]
                }
            }
        };

        var ctx = document.getElementById('sparklineChart').getContext('2d');
        new Chart(ctx, params);
    }

    document.addEventListener('DOMContentLoaded', function() {
        sparklineChart();
    });
</script>
</body>
</html>