<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!doctype html>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Update Product</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        const orgImage = "${newUser.avatar}";
                        // nếu có ảnh thì hiện ảnh cũ lên
                        if (orgImage && orgImage.trim() !== "") {
                            const urlImage = "/images/avatar/" + orgImage;
                            $("#avatarPreview").attr("src", urlImage);
                            $("#avatarPreview").css({ "display": "block" });
                        }
                        // khi update ảnh thì mới hiện
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
                <!-- <link href="/css/demo.css" rel="stylesheet"> -->
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


            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />
                <jsp:include page="../layout/sidebar.jsp" />

                <main class="main-wrapper col-md-9 ms-sm-auto py-4 col-lg-9 px-md-4 border-start">
                    <div class="title-group mb-2">
                        <h1 class="h1 mb-1">Manage Users</h1>
                        <ol class="breadcrumb mb-0" style="font-size: 0.85rem;">
                            <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                            <li class="breadcrumb-item" aria-current="page"><a href="/admin/user">Users</a></li>
                        </ol>
                    </div>
                    <div class=" mt-5">
                        <div class="row">
                            <div class="col-md-6 col-12 mx-auto">
                                <form:form method="POST" action="/admin/user/update" modelAttribute="newUser"
                                    enctype="multipart/form-data">
                                    <h2>Update a user</h2>

                                    <!-- phải tạo id nm ko hiện lên màn hình để khi về controller id ko = 00 -->
                                    <c:set var="fullNameError">
                                        <form:errors path="fullName" cssClass="invalid-feedback" />
                                    </c:set>

                                    <div class="col-md-6 mb-3" style="display: none;">
                                        <label class="form-label">Id</label>
                                        <form:input type="text" class="form-control" path="id" />
                                    </div>
                                    <div class="row">
                                        <div class="mb-3 col-md-6">
                                            <label class="form-label">Email</label>
                                            <form:input type="email" class="form-control" path="email"
                                                disabled="true" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Phone number</label>
                                            <form:input type="text" class="form-control" path="phone" />
                                        </div>
                                        <div class="col-md-6 mb-3">

                                            <label class="form-label">Full Name:</label>
                                            <form:input type="text"
                                                class="form-control ${not empty fullNameError? 'is-invalid':''}"
                                                path="fullName" />
                                            ${fullNameError}
                                        </div>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Address:</label>
                                        <form:input type="text" class="form-control" path="address" />
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Role:</label>
                                            <form:select class=" form-select" path="role.name"> >
                                                <form:option selected="${user.role.name eq 'Admin'}" value="Admin">Admin
                                                </form:option>
                                                <form:option selected="${user.role.name eq 'User'}" value="User">User
                                                </form:option>
                                            </form:select>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label for="avatarFile" class="form-label">Avatar</label>
                                            <input class="form-control" type="file" id="avatarFile" PATH="avatar"
                                                accept=".png, .jdg, .jpeg" name="annguyenFile" />
                                            <input type="hidden" name="currentAvatar" value="${user.avatar}" />

                                        </div>
                                        <div class="col-12 mb-3">
                                            <img style="max-height: 250px; display: none;" alt="avatar preview"
                                                id="avatarPreview" />
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-warning">Submit</button>
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