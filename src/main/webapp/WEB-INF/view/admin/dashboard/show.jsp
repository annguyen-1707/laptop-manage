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

                <title>Mini Finance Dashboard Template</title>

                <!-- CSS FILES -->
                <link rel="preconnect" href="https://fonts.googleapis.com">

                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

                <link href="https://fonts.googleapis.com/css2?family=Unbounded:wght@300;400;700&display=swap"
                    rel="stylesheet">

                <link href="css/bootstrap.min.css" rel="stylesheet">

                <link href="css/bootstrap-icons.css" rel="stylesheet">

                <link href="css/apexcharts.css" rel="stylesheet">

                <link href="css/tooplate-mini-finance.css" rel="stylesheet">
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
                    <div class="title-group mb-3">
                        <h1 class="h1 mb-1">Dashboard</h1>
                        <!-- <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                             <li class="breadcrumb-item active" aria-current="page">Orders</li>
                        </ol>  -->
                        <small class="text-muted">Hello Thomas, welcome back!</small>
                    </div>

                    <div class="row my-4">
                        <div class="col-lg-7 col-12">
                            <div class="custom-block custom-block-balance">
                                <small>Your Balance</small>

                                <h2 class="mt-2 mb-3">$254,800</h2>

                                <div class="custom-block-numbers d-flex align-items-center">
                                    <span>****</span>
                                    <span>****</span>
                                    <span>****</span>
                                    <p>2560</p>
                                </div>

                                <div class="d-flex">
                                    <div>
                                        <small>Valid Date</small>
                                        <p>12/2028</p>
                                    </div>

                                    <div class="ms-auto">
                                        <small>Card Holder</small>
                                        <p>Thomas</p>
                                    </div>
                                </div>
                            </div>

                            <div class="custom-block bg-white">
                                <h5 class="mb-4">History</h5>

                                <div id="pie-chart"></div>
                            </div>

                            <div class="custom-block bg-white">
                                <div id="chart"></div>
                            </div>

                            <div class="custom-block custom-block-exchange">
                                <h5 class="mb-4">Exchange Rate</h5>

                                <div class="d-flex align-items-center border-bottom pb-3 mb-3">
                                    <div class="d-flex align-items-center">
                                        <img src="images/flag/united-states.png" class="exchange-image img-fluid"
                                            alt="">

                                        <div>
                                            <p>USD</p>
                                            <h6>1 US Dollar</h6>
                                        </div>
                                    </div>

                                    <div class="ms-auto me-4">
                                        <small>Sell</small>
                                        <h6>1.0931</h6>
                                    </div>

                                    <div>
                                        <small>Buy</small>
                                        <h6>1.0821</h6>
                                    </div>
                                </div>

                                <div class="d-flex align-items-center border-bottom pb-3 mb-3">
                                    <div class="d-flex align-items-center">
                                        <img src="images/flag/singapore.png" class="exchange-image img-fluid" alt="">

                                        <div>
                                            <p>SGD</p>
                                            <h6>1 Singapore Dollar</h6>
                                        </div>
                                    </div>

                                    <div class="ms-auto me-4">
                                        <small>Sell</small>
                                        <h6>0.6901</h6>
                                    </div>

                                    <div>
                                        <small>Buy</small>
                                        <h6>0.6201</h6>
                                    </div>
                                </div>

                                <div class="d-flex align-items-center border-bottom pb-3 mb-3">
                                    <div class="d-flex align-items-center">
                                        <img src="images/flag/united-kingdom.png" class="exchange-image img-fluid"
                                            alt="">

                                        <div>
                                            <p>GPD</p>
                                            <h6>1 British Pound</h6>
                                        </div>
                                    </div>

                                    <div class="ms-auto me-4">
                                        <small>Sell</small>
                                        <h6>1.1520</h6>
                                    </div>

                                    <div>
                                        <small>Buy</small>
                                        <h6>1.1412</h6>
                                    </div>
                                </div>

                                <div class="d-flex align-items-center border-bottom pb-3 mb-3">
                                    <div class="d-flex align-items-center">
                                        <img src="images/flag/australia.png" class="exchange-image img-fluid" alt="">

                                        <div>
                                            <p>AUD</p>
                                            <h6>1 Australian Dollar</h6>
                                        </div>
                                    </div>

                                    <div class="ms-auto me-4">
                                        <small>Sell</small>
                                        <h6>0.6110</h6>
                                    </div>

                                    <div>
                                        <small>Buy</small>
                                        <h6>0.5110</h6>
                                    </div>
                                </div>

                                <div class="d-flex align-items-center">
                                    <div class="d-flex align-items-center">
                                        <img src="images/flag/european-union.png" class="exchange-image img-fluid"
                                            alt="">

                                        <div>
                                            <p>EUR</p>
                                            <h6>1 Euro</h6>
                                        </div>
                                    </div>

                                    <div class="ms-auto me-4">
                                        <small>Sell</small>
                                        <h6>1.1020</h6>
                                    </div>

                                    <div>
                                        <small>Buy</small>
                                        <h6>1.1010</h6>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-5 col-12">
                            <div
                                class="custom-block custom-block-profile-front custom-block-profile text-center bg-white">
                                <div class="custom-block-profile-image-wrap mb-4">
                                    <img src="images/medium-shot-happy-man-smiling.jpg"
                                        class="custom-block-profile-image img-fluid" alt="">

                                    <a href="setting.html" class="bi-pencil-square custom-block-edit-icon"></a>
                                </div>

                                <p class="d-flex flex-wrap mb-2">
                                    <strong>Name:</strong>

                                    <span>Thomas Edison</span>
                                </p>

                                <p class="d-flex flex-wrap mb-2">
                                    <strong>Email:</strong>

                                    <a href="#">
                                        thomas@site.com
                                    </a>
                                </p>

                                <p class="d-flex flex-wrap mb-0">
                                    <strong>Phone:</strong>

                                    <a href="#">
                                        (60) 12 345 6789
                                    </a>
                                </p>
                            </div>

                            <div class="custom-block custom-block-bottom d-flex flex-wrap">
                                <div class="custom-block-bottom-item">
                                    <a href="#" class="d-flex flex-column">
                                        <i class="custom-block-icon bi-wallet"></i>

                                        <small>Top up</small>
                                    </a>
                                </div>

                                <div class="custom-block-bottom-item">
                                    <a href="#" class="d-flex flex-column">
                                        <i class="custom-block-icon bi-upc-scan"></i>

                                        <small>Scan & Pay</small>
                                    </a>
                                </div>

                                <div class="custom-block-bottom-item">
                                    <a href="#" class="d-flex flex-column">
                                        <i class="custom-block-icon bi-send"></i>

                                        <small>Send</small>
                                    </a>
                                </div>

                                <div class="custom-block-bottom-item">
                                    <a href="#" class="d-flex flex-column">
                                        <i class="custom-block-icon bi-arrow-down"></i>

                                        <small>Request</small>
                                    </a>
                                </div>
                            </div>

                            <div class="custom-block custom-block-transations">
                                <h5 class="mb-4">Recent Transations</h5>

                                <div class="d-flex flex-wrap align-items-center mb-4">
                                    <div class="d-flex align-items-center">
                                        <img src="images/profile/senior-man-white-sweater-eyeglasses.jpg"
                                            class="profile-image img-fluid" alt="">

                                        <div>
                                            <p>
                                                <a href="transation-detail.html">Daniel Jones</a>
                                            </p>

                                            <small class="text-muted">C2C Transfer</small>
                                        </div>
                                    </div>

                                    <div class="ms-auto">
                                        <small>05/12/2023</small>
                                        <strong class="d-block text-danger"><span class="me-1">-</span> $250</strong>
                                    </div>
                                </div>

                                <div class="d-flex flex-wrap align-items-center mb-4">
                                    <div class="d-flex align-items-center">
                                        <img src="images/profile/young-beautiful-woman-pink-warm-sweater.jpg"
                                            class="profile-image img-fluid" alt="">

                                        <div>
                                            <p>
                                                <a href="transation-detail.html">Public Bank</a>
                                            </p>

                                            <small class="text-muted">Mobile Reload</small>
                                        </div>
                                    </div>

                                    <div class="ms-auto">
                                        <small>22/8/2023</small>
                                        <strong class="d-block text-success"><span class="me-1">+</span> $280</strong>
                                    </div>
                                </div>

                                <div class="d-flex flex-wrap align-items-center">
                                    <div class="d-flex align-items-center">
                                        <img src="images/profile/young-woman-with-round-glasses-yellow-sweater.jpg"
                                            class="profile-image img-fluid" alt="">

                                        <div>
                                            <p><a href="transation-detail.html">Store</a></p>

                                            <small class="text-muted">Payment Received</small>
                                        </div>
                                    </div>

                                    <div class="ms-auto">
                                        <small>22/8/2023</small>
                                        <strong class="d-block text-success"><span class="me-1">+</span> $280</strong>
                                    </div>
                                </div>

                                <div class="border-top pt-4 mt-4 text-center">
                                    <a class="btn custom-btn" href="wallet.html">
                                        View all transations
                                        <i class="bi-arrow-up-right-circle-fill ms-2"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="custom-block primary-bg">
                                <h5 class="text-white mb-4">Send Money</h5>

                                <a href="#">
                                    <img src="images/profile/young-woman-with-round-glasses-yellow-sweater.jpg"
                                        class="profile-image img-fluid" alt="">
                                </a>

                                <a href="#">
                                    <img src="images/profile/young-beautiful-woman-pink-warm-sweater.jpg"
                                        class="profile-image img-fluid" alt="">
                                </a>

                                <a href="#">
                                    <img src="images/profile/senior-man-white-sweater-eyeglasses.jpg"
                                        class="profile-image img-fluid" alt="">
                                </a>

                                <div class="profile-rounded">
                                    <a href="#">
                                        <i class="profile-rounded-icon bi-plus"></i>
                                    </a>
                                </div>
                            </div>

                        </div>
                    </div>
                    <jsp:include page="../layout/footer.jsp" />
                </main>
                </div>
                </div>


                <!-- JAVASCRIPT FILES -->
                <script src="js/jquery.min.js"></script>
                <script src="js/bootstrap.bundle.min.js"></script>
                <script src="js/apexcharts.min.js"></script>
                <script src="js/custom.js"></script>

                <script type="text/javascript">
                    var options = {
                        series: [13, 43, 22],
                        chart: {
                            width: 380,
                            type: 'pie',
                        },
                        labels: ['Balance', 'Expense', 'Credit Loan',],
                        responsive: [{
                            breakpoint: 480,
                            options: {
                                chart: {
                                    width: 200
                                },
                                legend: {
                                    position: 'bottom'
                                }
                            }
                        }]
                    };

                    var chart = new ApexCharts(document.querySelector("#pie-chart"), options);
                    chart.render();
                </script>

                <script type="text/javascript">
                    var options = {
                        series: [{
                            name: 'Income',
                            data: [44, 55, 57, 56, 61, 58, 63, 60, 66]
                        }, {
                            name: 'Expense',
                            data: [76, 85, 101, 98, 87, 105, 91, 114, 94]
                        }, {
                            name: 'Transfer',
                            data: [35, 41, 36, 26, 45, 48, 52, 53, 41]
                        }],
                        chart: {
                            type: 'bar',
                            height: 350
                        },
                        plotOptions: {
                            bar: {
                                horizontal: false,
                                columnWidth: '55%',
                                endingShape: 'rounded'
                            },
                        },
                        dataLabels: {
                            enabled: false
                        },
                        stroke: {
                            show: true,
                            width: 2,
                            colors: ['transparent']
                        },
                        xaxis: {
                            categories: ['Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'],
                        },
                        yaxis: {
                            title: {
                                text: '$ (thousands)'
                            }
                        },
                        fill: {
                            opacity: 1
                        },
                        tooltip: {
                            y: {
                                formatter: function (val) {
                                    return "$ " + val + " thousands"
                                }
                            }
                        }
                    };

                    var chart = new ApexCharts(document.querySelector("#chart"), options);
                    chart.render();
                </script>

            </body>

            </html>