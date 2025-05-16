<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!doctype html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">

                <meta name="description" content="">
                <meta name="author" content="Tooplate">

                <title>Order show</title>

                <!-- CSS FILES -->
                <link rel="preconnect" href="https://fonts.googleapis.com">

                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

                <link href="https://fonts.googleapis.com/css2?family=Unbounded:wght@300;400;700&display=swap"
                    rel="stylesheet">

                <link href="/css/bootstrap.min.css" rel="stylesheet">

                <link href="/css/bootstrap-icons.css" rel="stylesheet">

                <link href="/css/apexcharts.css" rel="stylesheet">

                <link href="/css/tooplate-mini-finance.css" rel="stylesheet">
                <link rel="stylesheet" href="/fonts/bootstrap-icons.woff">
                <link rel="stylesheet" href="/fonts/bootstrap-icons.woff2">
                <link rel="stylesheet" href="/css/mystyle.css">

                <!--

Tooplate 2135 Mini Finance

https://www.tooplate.com/view/2135-mini-finance

Bootstrap 5 Dashboard Admin Template

-->

            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />
                <jsp:include page="../layout/sidebar.jsp" />

                <main class="main-wrapper col-md-9 ms-sm-auto py-4 col-lg-9 px-md-4 border-start">
                    <!--  flex-column justify-content-between"> -->
                    <div class="title-group mb-2">
                        <h1 class="h1 mb-1">Order</h1>
                        <ol class="breadcrumb mb-0" style="font-size: 0.85rem;">
                            <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Orders</li>
                        </ol>
                    </div>
                    <div class=" mt-5">
                        <div class="row">
                            <div class=" col-12 mx-auto">
                                <div class="d-flex justify-content-between">
                                    <h3>Table Order</h3>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <hr />
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>totalPrice</th>
                                    <th>status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="order" items="${orders}">
                                    <tr>
                                        <td>${order.id}</td>
                                        <td>${order.totalPrice}</td>
                                        <td>${order.status}</td>
                                        <td>
                                            <a href="/admin/order/${order.id}">
                                                <button class="btn btn-success">View</button> </a>
                                            <a href="/admin/order/update/${order.id}">
                                                <button class="btn btn-warning">Update</button></a>
                                            <a href="/admin/order/delete/${order.id}">
                                                <button class="btn btn-danger">Delete</button></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="dashboard-footer">
                        <jsp:include page="../layout/footer.jsp" />
                    </div>



                </main>

            </body>

            </html>