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
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
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
                        <h1 class="h1 mb-1">Product</h1>
                        <ol class="breadcrumb mb-0" style="font-size: 0.85rem;">
                            <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                            <li class="breadcrumb-item" aria-current="page"><a href="/admin/product">Product</a></li>
                        </ol>
                    </div>
                    <div class=" mt-5">
                        <div class="row">
                            <div class="col-md-6 col-12 mx-auto">
                                <form:form method="POST" action="/admin/product/create" modelAttribute="newProduct"
                                    enctype="multipart/form-data">
                                    <c:set var="nameError">
                                        <form:errors path="name" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="priceError">
                                        <form:errors path="price" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="detailDescError">
                                        <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="shortDescError">
                                        <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                    </c:set>
                                    <c:set var="quantityError">
                                        <form:errors path="quantity" cssClass="invalid-feedback" />
                                    </c:set>
                                    <h2>Create a product</h2>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Name</label>
                                            <form:input type="text"
                                                class="form-control ${not empty nameError? 'is-invalid':''}"
                                                path="name" />
                                            ${nameError}
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Price</label>
                                            <form:input type="number"
                                                class="form-control ${not empty priceError? 'is-invalid':''}"
                                                path="price" />
                                            ${priceError}
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">DetailDesc:</label>
                                        <form:input type="text"
                                            class="form-control ${not empty detailDescError? 'is-invalid':''}"
                                            path="detailDesc" />
                                        ${detailDescError}
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">ShortDesc</label>
                                            <form:input type="text"
                                                class="form-control ${not empty shortDescError? 'is-invalid':''}"
                                                path="shortDesc" />
                                            ${shortDescError}
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Quantity:</label>
                                            <form:input type="number"
                                                class="form-control ${not empty quantityError? 'is-invalid':''}"
                                                path="quantity" />
                                            ${quantityError}
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Factory:</label>
                                            <form:select class=" form-select" path="factory"> >
                                                <form:option value="Apple">Apple</form:option>
                                                <form:option value="Asus">Asus</form:option>
                                                <form:option value="Lenovo">Lenovo</form:option>
                                                <form:option value="Dell">Dell</form:option>
                                                <form:option value="LG">LG</form:option>
                                                <form:option value="Acer">Acer</form:option>
                                            </form:select>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Target:</label>
                                            <form:select class=" form-select" path="target"> >
                                                <form:option value="Gaming">Gaming</form:option>
                                                <form:option value="Sinh viên văn phòng">Sinh viên văn phòng
                                                </form:option>
                                                <form:option value="Thiết kế đồ họa">Thiết kế đồ họa </form:option>
                                                <form:option value="Mỏng nhẹ ">Mỏng nhẹ </form:option>
                                                <form:option value="Doanh nhân">Doanh nhân </form:option>
                                            </form:select>
                                        </div>
                                    </div>


                                    <div class="col-md-6 mb-3">
                                        <label for="image" class="form-label">Image</label>
                                        <input class="form-control" type="file" id="avatarFile" PATH="image"
                                            accept=".png, .jdg, .jpeg, .webp" name="annguyenFile" />
                                    </div>
                                    <div class="col-12 mb-3">
                                        <img style="max-height: 250px; display: none;" alt="avatar preview"
                                            id="avatarPreview" />
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