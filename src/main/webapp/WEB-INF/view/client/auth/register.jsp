<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <title>Create Account</title>
                    <meta name="viewport" content="width=device-width, initial-scale=1">
                    <!-- Bootstrap 5 CDN -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet">

                    <link href="/css/bootstrap.min.css" rel="stylesheet">

                    <link href="/css/bootstrap-icons.css" rel="stylesheet">
                    <link href="/css/apexcharts.css" rel="stylesheet">

                    <style>
                        body {
                            background-color: #4c6ef5;
                            display: flex;
                            justify-content: center;
                            align-items: center;
                            height: 100vh;
                        }

                        .card {
                            border-radius: 15px;
                            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
                        }

                        .form-control {
                            border-radius: 10px;
                        }

                        .btn-primary {
                            background-color: #4c6ef5;
                            border: none;
                            border-radius: 10px;
                        }

                        .btn-primary:hover {
                            background-color: #3b5bdb;
                        }

                        .text-muted a {
                            text-decoration: none;
                        }

                        .text-muted a:hover {
                            text-decoration: underline;
                        }
                    </style>
                </head>

                <body>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-md-8 col-lg-6">
                                <div class="card p-4">
                                    <h3 class="text-center mb-4">Create Account</h3>
                                    <form:form method="post" action="/register" modelAttribute="registerUser">
                                        <c:set var="emailError">
                                            <form:errors path="email" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="passError">
                                            <form:errors path="password" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="passConfirmError">
                                            <form:errors path="confirmPassword" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="nameError">
                                            <form:errors path="firstName" cssClass="invalid-feedback" />
                                        </c:set>
                                        <div class="row mb-3">
                                            <div class="col">
                                                <form:input type="text"
                                                    class="form-control ${not empty nameError? 'is-invalid':''}"
                                                    placeholder="First name" path="firstName" required="required" />
                                                ${nameError}
                                            </div>
                                            <div class="col">
                                                <form:input type="text" class="form-control" placeholder="Last name"
                                                    path="lastName" required="required" />
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <form:input type="email"
                                                class="form-control ${not empty emailError? 'is-invalid':''}"
                                                placeholder="Email address" path="email" required="required" />
                                            ${emailError}
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col">
                                                <form:input type="password"
                                                    class="form-control ${not empty passError? 'is-invalid':''}"
                                                    placeholder="Password" path="password" required="required" />
                                                ${passError}
                                            </div>
                                            <div class="col">
                                                <form:input type="password"
                                                    class="form-control ${not empty passConfirmError? 'is-invalid':''}"
                                                    path="confirmPassword" placeholder="Confirm Password"
                                                    required="required" />
                                                ${passConfirmError}
                                            </div>
                                        </div>
                                        <div class="d-grid mb-3">
                                            <button type="submit" class="btn btn-primary">Create Account</button>
                                        </div>
                                        <div class="text-center text-muted">
                                            Have an account? <a href="#">Go to login</a>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Bootstrap JS Bundle -->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
                </body>

                </html>