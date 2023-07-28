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
                <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
                    crossorigin="anonymous">
                <link rel="stylesheet"
                    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
                <script src="https://kit.fontawesome.com/92ef16d217.js" crossorigin="anonymous"></script>

            </head>

            <body>

                <style>
                    .cancel {
                        background-color: red;
                    }
                </style>
                <!-- Navbar -->
                <jsp:include page="/WEB-INF/views/nav.jsp" />
                <!-- Navbar -->

                <!-- admin main -->
                <div class="container admin">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Hình ảnh</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Giá bán</th>
                                <th scope="col">Đã bán</th>
                                <th scope="col">Tác vụ</th>

                            </tr>
                        </thead>
                        <tbody>

                            <c:forEach var="product" items="${products}">
                                <tr>
                                    <th scope="row">${product.id}</th>
                                    <td>
                                        <img src="${product.image}"
                                            alt="Los Angeles" class="admin-img">
                                    </td>
                                    <td>${product.name}</td>
                                    <td>${product.price}</td>
                                    <td>${product.sold_count}</td>
                                    <td class="admin-icon">
                                        <div class="row">
                                            <div class="col">
                                                <button class="open-button" onclick="openForm()">
                                                    <c:set var="Prod_id" value="${product.id}" />
                                                    <i class="fa-solid fa-pen-to-square"></i>
                                                </button>
                                            </div>

                                            <div class="col">
                                                <form method="post" action="/shopping/adminHandle">
                                                    <input type="hidden" name="action" value="delete">
                                                    <input type="hidden" name="id" value="${product.id}">
                                                    <button type="submit">x</button>
                                                </form>
                                            </div>

                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <button class="add-button" style="background-color: black;color: white;padding: 1vh 2vh; float: right;" onclick="openAddForm()">
                        <c:set var="Prod_id" value="${product.id}" />
                        Thêm hàng hóa
                    </button>

                </div>


                <form class="form-edit form-popup" id="myForm" action="/shopping/adminHandle?action=update"
                    method="POST">
                    <h1 style="text-align: center;">Chỉnh sửa</h1>
                    <label class="form-label" for="id">ID</label>
                    <input name="id" value="${Prod_id}" class="form-control" />
                    <label class="form-label" for="name">Tên sản phẩm</label>
                    <input name="name" type="text" class="form-control" />
                    <label class="form-label" for="price">Giá bán</label>
                    <input name="price" type="number" class="form-control" />

                    <button type="submit" class="btn">Xác nhận</button>
                    <button type="button" class="btn cancel" onclick="closeForm()">Đóng</button>
                </form>


                <form class="form-edit form-popup" id="addForm" action="/shopping/adminHandle?action=add" method="POST">
                    <h1 style="text-align: center;">Thêm hàng hóa</h1>
                    <label class="form-label" for="name">Tên sản phẩm</label>
                    <input name="name" type="text" class="form-control" />
                    <label class="form-label" for="price">Giá bán</label>
                    <input name="price" type="number" class="form-control" />

                    <button type="submit" class="btn">Xác nhận</button>
                    <button type="button" class="btn cancel" onclick="closeAddForm()">Đóng</button>
                </form>


                <!-- admin main -->

                <script>
                    function openForm() {
                        document.getElementById("myForm").style.display = "block";
                    }

                    function closeForm() {
                        document.getElementById("myForm").style.display = "none";
                    }

                    function openAddForm() {
                        document.getElementById("addForm").style.display = "block";
                    }

                    function closeAddForm() {
                        document.getElementById("addForm").style.display = "none";
                    }
                </script>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                    crossorigin="anonymous"></script>
            </body>

            </html>