<%@ page isELIgnored="false" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

                <nav class="navbar navbar-expand-sm navbar-dark bg-dark sticky-top">
                    <a class="navbar-brand" href="javascript:void(0)">Logo</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="mynavbar">
                        <ul class="navbar-nav me-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/home">Trang chủ</a>
                            </li>
                            
                        </ul>
                        <c:choose>
                            <c:when test="${empty(sessionScope.user)}">
                                <a href="/shopping/login" class="btn btn-outline-light login-button" role="button">
                                    Đăng nhập
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a class="username text-decoration-none"
                                    href="/shopping/logout">${sessionScope.user.username}</a>

                                <c:if test="${sessionScope.user.admin == true}">
                                    <a href="/shopping/admin"><i
                                        class="material-symbols-outlined">
                                        admin_panel_settings
                                    </i></a>
                                </c:if>
                            </c:otherwise>
                        </c:choose>

                        <div class="cart-btn d-flex">
                            <a onclick="Nav()" style="cursor: pointer;">
                                <i class="material-symbols-outlined cart-icon">
                                    shopping_cart
                                </i>
                                <p class="total-qty">
                                    <c:choose>
                                        <c:when test="${empty(sessionScope.order)}">
                                            0
                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="total" value="0" />
                                            <c:forEach var="cartItem" items="${sessionScope.order.products}">
                                                <c:set var="total" value="${total + 1}" />
                                            </c:forEach>
                                            <c:choose>
                                                <c:when test="${total > 99}">
                                                    99+
                                                </c:when>
                                                <c:otherwise>
                                                    ${total}
                                                </c:otherwise>
                                            </c:choose>
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                            </a>
                        </div>
                </nav>