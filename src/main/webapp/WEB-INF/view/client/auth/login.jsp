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
                                    <h3 class="text-center mb-4">Login</h3>
                                    <form:form method="post" action="/login" modelAttribute="loginUser">
                                        <c:set var="emailError">
                                            <form:errors path="email" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="passError">
                                            <form:errors path="password" cssClass="invalid-feedback" />
                                        </c:set>
                                        <div class="row mb-3">
                                            <div class="mb-3">
                                                <form:input type="email"
                                                    class="form-control ${not empty emailError? 'is-invalid':''}"
                                                    placeholder="Email address" path="email" required="required" />
                                                ${emailError}
                                            </div>
                                            <div class="row mb-3">
                                                <form:input type="password"
                                                    class="form-control ${not empty passError? 'is-invalid':''}"
                                                    placeholder="Password" path="password" required="required" />
                                                ${passError}
                                            </div>
                                            <div class="d-grid mb-3">
                                                <button type="submit" class="btn btn-primary">Login</button>
                                            </div>
                                            <div class="text-center text-muted">
                                                <a href="client/auth/register">Need an account? Sign up</a>
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