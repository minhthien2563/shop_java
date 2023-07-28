<%@ page isELIgnored="false" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta http-equiv="X-UA-Compatible" content="IE=edge">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Document</title>
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
                        rel="stylesheet"
                        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
                        crossorigin="anonymous">
                    <link rel="stylesheet"
                        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
                </head>

                <body>

                    <!-- Navbar -->
                    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
                        <div class="container-fluid">
                            <a class="navbar-brand" href="javascript:void(0)">Logo</a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                data-bs-target="#mynavbar">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                        </div>
                    </nav>
                    <!-- Navbar -->

                    <!-- payment main -->
                    <div class="container" style="margin-top: 5vh;">
                        <div class="row">
                            <div class="col-md-8 pay-cart">
                                <h3>Giỏ hàng</h3>

                                <div class="row">
                                    <div class="col font-weight-bold"><strong>Hình ảnh</strong></div>
                                    <div class="col font-weight-bold"><strong>Tên sản phẩm</strong></div>
                                    <div class="col font-weight-bold"><strong>Giá</strong></div>
                                    <div class="col font-weight-bold"><strong>Số lượng</strong></div>

                                </div>


                                <c:forEach var="cartItem" items="${sessionScope.order.products}">
                                    <div class="row">
                                        <div class="col"><img src="${cartItem.product.image}" alt="Los Angeles"
                                                class="admin-img" height="64" width="64"></div>
                                        <div class="col">${cartItem.product.name}</div>
                                        <div class="col">đ${cartItem.product.price}</div>
                                        <div class="col">${cartItem.quantity}</div>
                                    </div>
                                </c:forEach>
                            </div>

                            <form class="col-md-4 pay" style="background-color: whitesmoke;" method="GET"
                                action="/shopping/paymentHandle">
                                <h2>Thanh toán</h2>
                                <br>
                                <div class="line" style="height: 0.5px; background-color: gray; opacity: 0.4;"></div>
                                <br>
                                <label class="form-label" for="name">Tên khách hàng</label>
                                <input id="name" name="name" type="text" class="form-control">
                                <label class="form-label" for="number">Số điện thoại</label>
                                <input id="number" name="number" type="number" class="form-control">
                                <label class="form-label" for="address">Địa chỉ</label>
                                <input id="address" name="address" type="text" class="form-control">
                                <br>
                                <div class="line" style="height: 0.5px; background-color: gray; opacity: 0.4;"></div>
                                <br>
                                <div class="ship-fee">
                                    <div class="row">
                                        <div class="col">
                                            <h6>Phí vận chuyển:</h6>
                                        </div>
                                        <div class="col">
                                            <c:set var="ship" value="${sessionScope.total * 0.2/100}" />
                                            <p style="float: right;">
                                                đ${ship} (0,2% tổng giá trị đơn hàng)
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <h4>Tổng tiền:</h4>
                                    </div>
                                    <div class="col">
                                        <p style="float: right;">
                                            đ<fmt:formatNumber type="number" groupingUsed="false" value="${sessionScope.total + ship}"/>
                                                </p>
                                    </div>
                                </div>

                                <button class="btn-pay" type="submit" onclick="return validateForm()">
                                    Thanh Toán
                                </button>

                            </form>
                        </div>
                    </div>

                    <!-- payment main -->

                    <script>
                        function validateForm() {
                            var name = document.getElementById("name").value;
                            var number = document.getElementById("number").value;
                            var address = document.getElementById("address").value;

                            if (name == null || name == "" || number == null || number == "" || address == null || address == "") {
                                alert("Vui lòng điền đầy đủ các thông tin!");
                                return false;
                            }
                        }
                    </script>

                    <script src="https://kit.fontawesome.com/92ef16d217.js" crossorigin="anonymous"></script>

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                        crossorigin="anonymous"></script>
                </body>

                </html>