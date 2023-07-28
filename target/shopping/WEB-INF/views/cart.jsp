<%@ page isELIgnored="false" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <html>
            <div id="mySidenav" class="cart">

                <c:choose>
                    <c:when test="${empty(sessionScope.order)}">
                        <p class="text-white" style="margin-left: 10%;">Giỏ hàng trống</p>
                    </c:when>
                    <c:when test="${sessionScope.order.products.size() <= 0}">
                        <p class="text-white" style="margin-left: 10%;">Giỏ hàng trống</p>
                    </c:when>

                    <c:when test="${sessionScope.order.products.size() > 0}">
                        <ul class="list-inline text-white cart-heading">
                            <li class="list-inline-item">Tên sản phẩm</li>
                            <li class="list-inline-item price-heading">Đơn giá</li>
                            <li class="list-inline-item amount-heading">Số lượng</li>
                            <li class="list-inline-item total-heading">Số tiền</li>
                            <li class="list-inline-item operation-heading">Thao tác</li>
                        </ul>

                        <div class="cart-items">

                            <c:forEach var="cartItem" items="${sessionScope.order.products}">
                                <div class="row item">
                                    <div class="col-3">
                                        <img src="${cartItem.product.image}"
                                            alt="Los Angeles" class="item-img">
                                    </div>
                                    <div class="col">
                                        <div class="row">
                                            <div class="col-4">
                                                <p>${cartItem.product.name}</p>
                                            </div>
                                            <div class="col">
                                                <p>đ${cartItem.product.price}</p>
                                            </div>
                                            <div class="col">${cartItem.quantity}</div>
                                            <div class="col">
                                                <c:set var="totalPrice"
                                                    value="${cartItem.product.price * cartItem.quantity}" />
                                                ${totalPrice}
                                            </div>
                                            <a class="col delete-icon" href="/shopping/deleteItem?id=${cartItem.product.id}">
                                                <i class="material-symbols-outlined">
                                                    delete
                                                </i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>

                        <c:if test="${sessionScope.total > 0}">
                            <p class="price-cart">Tổng tiền: đ${sessionScope.total}</p>
                        </c:if>

                        <a id="toPayment" class="cartbtn" style="margin-left: 70%;" href="/shopping/payment"
                            onclick="payment()">Thanh toán</a>
                        <a class="cartbtn" href="/shopping/cartClear">Xóa giỏ hàng</a>
                    </c:when>
                </c:choose>
            </div>

            <script>
                function Nav() {
                    if (document.getElementById("mySidenav").offsetWidth > 0) {
                        document.getElementById("mySidenav").style.width = "0";
                    } else {
                        document.getElementById("mySidenav").style.width = "70%";
                    }
                }
            </script>

            </html>