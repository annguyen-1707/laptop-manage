<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!doctype html>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Create</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://www.geeksforgeeks.org/preview-an-image-before-uploading-using-jquery/"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
                <!-- <link rel="stylesheet" href="/css/mystyle.css"> -->


            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />
                <jsp:include page="../layout/sidebar.jsp" />

                <main class="main-wrapper col-md-9 ms-sm-auto py-4 col-lg-9 px-md-4 border-start">
                    <div class="title-group mb-2">
                        <h1 class="h1 mb-1">Order</h1>
                        <ol class="breadcrumb mb-0" style="font-size: 0.85rem;">
                            <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                            <li class="breadcrumb-item" aria-current="page"><a href="/admin/order">Order</a></li>
                        </ol>
                    </div>
                    <div class=" mt-5">
                        <div class="row">
                            <div class="col-md-6 col-12 mx-auto">
                                <form:form method="POST" action="/admin/order/update" modelAttribute="newOrder"
                                    enctype="multipart/form-data">
                                    <h2>Update a order</h2>

                                    <!-- phải tạo id nm ko hiện lên màn hình để khi về controller id ko = 0 -->
                                    <div class="col-md-6 mb-3" style="display: none;">
                                        <label class="form-label">Id</label>
                                        <form:input type="text" class="form-control" path="id" />
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">receiverName</label>
                                            <form:input type="text"
                                                class="form-control ${not empty receiverName? 'is-invalid':''}"
                                                path="receiverName" disabled="true" />
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">receiverPhone</label>
                                            <form:input type="number"
                                                class="form-control ${not empty receiverPhone? 'is-invalid':''}"
                                                path="receiverPhone" disabled="true" />
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">receiverAddress:</label>
                                        <form:input type="text"
                                            class="form-control ${not empty receiverAddress? 'is-invalid':''}"
                                            path="receiverAddress" disabled="true" />
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Account</label>
                                            <form:input type="text"
                                                class="form-control ${not empty shortDescError? 'is-invalid':''}"
                                                path="user.fullName" disabled="true" />
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Status:</label>
                                            <form:select class=" form-select" path="status"> >
                                                <form:option selected="${status eq 'Pending'}" value="Pending">
                                                    Pending</form:option>
                                                <form:option selected="${status eq 'Accept'}" value="Accept">
                                                    Accept
                                                </form:option>
                                                <form:option selected="${status eq 'Reject'}" value="Reject">
                                                    Reject</form:option>

                                            </form:select>
                                        </div>
                                    </div>
                                    <button type="Create" class="btn btn-primary">Submit</button>
                                </form:form>
                            </div>
                        </div>
                    </div>
                    <div class="dashboard-footer">
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </main>
            </body>


            </html>