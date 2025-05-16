<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <header class="navbar sticky-top flex-md-nowrap">
                <div class="col-md-3 col-lg-3 me-0 px-3 fs-6">
                    <a class="navbar-brand" href="/admin">
                        <i class="bi-box"></i>
                        Home
                    </a>
                </div>

                <button class="navbar-toggler position-absolute d-md-none collapsed" type="button"
                    data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <form
                    class="custom-form header-form ms-lg-3 ms-md-3 me-lg-auto me-md-auto order-2 order-lg-0 order-md-0"
                    action="#" method="get" role="form">
                    <input class="form-control" name="search" type="text" placeholder="Search" aria-label="Search">
                </form>

                <div class="navbar-nav me-lg-2">
                    <div class="nav-item text-nowrap d-flex align-items-center">
                        <!-- thông báo  -->
                        <!-- <div class="dropdown ps-3"> -->
                        <!-- <a class="nav-link dropdown-toggle text-center" href="#" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false" id="navbarLightDropdownMenuLink">
                    <i class="bi-bell"></i>
                    <span
                        class="position-absolute start-100 translate-middle p-1 bg-danger border border-light rounded-circle">
                        <span class="visually-hidden">New alerts</span>
                    </span>
                </a> -->

                        <!-- <ul class="dropdown-menu dropdown-menu-lg-end notifications-block-wrap bg-white shadow"
                    aria-labelledby="navbarLightDropdownMenuLink">
                    <small>Notifications</small>

                    <li class="notifications-block border-bottom pb-2 mb-2">
                        <a class="dropdown-item d-flex  align-items-center" href="#">
                            <div class="notifications-icon-wrap bg-success">
                                <i class="notifications-icon bi-check-circle-fill"></i>
                            </div>

                            <div>
                                <span>Your account has been created successfuly.</span>

                                <p>12 days ago</p>
                            </div>
                        </a>
                    </li>
                </ul> -->
                        <!-- </div> -->
                        <!-- các trang liên kết -->
                        <!-- <div class="dropdown ps-1">
                <a class="nav-link dropdown-toggle text-center" href="#" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    <i class="bi-three-dots-vertical"></i>
                </a>

                <div class="dropdown-menu dropdown-menu-social bg-white shadow">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-4">
                                <a class="dropdown-item text-center" href="#">
                                    <img src="images/social/search.png" class="profile-image img-fluid" alt="">
                                    <span class="d-block">Google</span>
                                </a>
                            </div>

                            <div class="col-lg-4 col-md-4 col-4">
                                <a class="dropdown-item text-center" href="#">
                                    <img src="images/social/spotify.png" class="profile-image img-fluid" alt="">
                                    <span class="d-block">Spotify</span>
                                </a>
                            </div>

                            <div class="col-lg-4 col-md-4 col-4">
                                <a class="dropdown-item text-center" href="#">
                                    <img src="images/social/telegram.png" class="profile-image img-fluid" alt="">
                                    <span class="d-block">Telegram</span>
                                </a>
                            </div>

                            <div class="col-lg-4 col-md-4 col-4">
                                <a class="dropdown-item text-center" href="#">
                                    <img src="images/social/snapchat.png" class="profile-image img-fluid" alt="">
                                    <span class="d-block">Snapchat</span>
                                </a>
                            </div>

                            <div class="col-lg-4 col-md-4 col-4">
                                <a class="dropdown-item text-center" href="#">
                                    <img src="images/social/tiktok.png" class="profile-image img-fluid" alt="">
                                    <span class="d-block">Tiktok</span>
                                </a>
                            </div>

                            <div class="col-lg-4 col-md-4 col-4">
                                <a class="dropdown-item text-center" href="#">
                                    <img src="images/social/youtube.png" class="profile-image img-fluid" alt="">
                                    <span class="d-block">Youtube</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div> -->

                        <div class="dropdown px-3">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                aria-expanded="false">
                                <img src="/images/avatar/${sessionScope.avatar}" class="profile-image img-fluid" alt="">
                            </a>
                            <ul class="dropdown-menu bg-white shadow">
                                <li>
                                    <div class="dropdown-menu-profile-thumb d-flex">
                                        <img src="/images/avatar/${sessionScope.avatar}"
                                            class="profile-image img-fluid me-3" alt="">

                                        <div class="d-flex flex-column">
                                            <small>${sessionScope.fullName}</small>
                                            <a href="#">${sessionScope.email}</a>
                                        </div>
                                    </div>
                                </li>

                                <li>
                                    <a class="dropdown-item" href="profile.html">
                                        <i class="bi-person me-2"></i>
                                        Profile
                                    </a>
                                </li>

                                <li>
                                    <a class="dropdown-item" href="setting.html">
                                        <i class="bi-gear me-2"></i>
                                        Settings
                                    </a>
                                </li>

                                <!-- <li>
                        <a class="dropdown-item" href="help-center.html">
                            <i class="bi-question-circle me-2"></i>
                            Help
                        </a>
                    </li> -->

                                <li class="border-top mt-3 pt-2 mx-4">
                                    <form method="post" action="/logout">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <button class="dropdown-item" href="#">Đăng xuất</button>
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </header>