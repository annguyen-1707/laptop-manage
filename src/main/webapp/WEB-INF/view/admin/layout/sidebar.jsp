<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <div class="container-fluid">
                <div class="row">
                    <nav id="sidebarMenu" class="col-md-3 col-lg-3 d-md-block sidebar collapse">
                        <div class="position-sticky py-4 px-3 sidebar-sticky">
                            <ul class="nav flex-column h-100">
                                <li class="nav-item">
                                    <a class="nav-link" aria-current="page" href="/admin">
                                        <i class="bi-house-fill me-2"></i>
                                        Dashboard
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="/admin/user">
                                        <i class="bi-wallet me-2"></i>
                                        User
                                    </a>
                                </li>

                                <!-- <li class="nav-item">
                                    <a class="nav-link" href="/#">
                                        <i class="bi-person me-2"></i>
                                        Profile
                                    </a>
                                </li> -->

                                <li class="nav-item">
                                    <a class="nav-link" href="/admin/product">
                                        <i class="bi-question-circle me-2"></i>
                                        Product
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="/admin/order">
                                        <i class="bi-question-circle me-2"></i>
                                        Order
                                    </a>
                                </li>

                                <!-- <li class="nav-item">
                                    <a class="nav-link" href="setting.html">
                                        <i class="bi-gear me-2"></i>
                                        Settings
                                    </a>
                                </li> -->




                                <li class="nav-item border-top mt-auto pt-2">
                                    <a class="nav-link" href="#">
                                        <i class="bi-box-arrow-left me-2"></i>
                                        Logout
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>