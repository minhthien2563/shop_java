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

                <!-- Login main -->
                <div class="container-fluid" , style="margin-top: 5vh;">
                    <div class="row">
                        <div class="col">
                            <img src="https://mdbcdn.b-cdn.net/img/new/standard/city/041.webp" class="card-img-top"
                                alt="Hollywood Sign on The Hill" />
                        </div>
                        <div class="col">
                            <form class="card-body" action="/shopping/toLogin" method="POST">
                                <h2 class="card-title">
                                    Đăng nhập
                                </h2>
                                <br>
                                <label class="form-label" for="email">Email</label>
                                <input id="email" name="email" type="email" class="form-control">

                                <label class="form-label" for="password">Password</label>
                                <input id="password" name="password" type="password" class="form-control">

                                <button class="btn-icon-text" type="submit">
                                    Đăng nhập
                                </button>

                                <c:if test="${not empty errorMessage}">
                                    <p style="color: red;">
                                        ${errorMessage}
                                    </p>
                                </c:if>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- Login main -->


                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                    crossorigin="anonymous"></script>
            </body>

            </html>