<%@ page isELIgnored="false" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
                <link rel="stylesheet" href="resources/css/style.css">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
                    crossorigin="anonymous">
                <link rel="stylesheet"
                    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
            </head>

            <body>

                <jsp:include page="/WEB-INF/views/nav.jsp" />

                <div class="containter">
                    <div class="card border-0">
                        <div class="row">
                            <div class="col">
                                <img src="${product.image}" class="card-img-top"
                                    alt="Hollywood Sign on The Hill" />
                            </div>
                            <div class="col">
                                <div class="card-body">
                                    <h2 class="card-title">
                                        ${product.name}
                                    </h2>
                                    <p class="text-muted">
                                        <c:choose>
                                            <c:when test="${product.sold_count > 99}">
                                                99+
                                            </c:when>
                                            <c:when test="${product.sold_count < 99}">
                                                ${product.sold_count}
                                            </c:when>
                                        </c:choose>
                                        Đã bán
                                    </p>

                                    <p class="price"><sup style="text-decoration: underline;">đ</sup>${product.price}
                                    </p>


                                    <div class="input-qty">
                                        <span>Số lượng</span>
                                        <button onclick="reduce()">-</button>
                                        <input id="quantity" type="text" value="1">
                                        <button onclick="increase()">+</button>
                                    </div>

                                    <a id="addToCart" class="btn-icon-text" href="#">
                                        <i class="material-symbols-outlined">
                                            shopping_cart
                                        </i>
                                        Thêm vào giỏ hàng
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <c:import url="/WEB-INF/views/cart.jsp" />

                <script>

                    var link = document.getElementById("addToCart");
                    link.addEventListener("click", function (event) {
                        event.preventDefault();

                        var input = document.getElementById("quantity");
                        console.log(input.value);
                        link.href = "/shopping/cart?id=${product.id}&quantity=" + encodeURIComponent(input.value);

                        window.location.href = link.href;
                    });

                   

                    function reduce() {
                        var inputElement = document.getElementById("quantity");
                        var currentValue = parseInt(inputElement.value);
                        if (currentValue <= 1)
                            inputElement.value = 1;
                        else
                            inputElement.value = currentValue - 1;
                    }

                    function increase() {
                        var inputElement = document.getElementById("quantity");
                        var currentValue = parseInt(inputElement.value);
                        inputElement.value = currentValue + 1;
                    }
                </script>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                    crossorigin="anonymous"></script>
            </body>

            </html>