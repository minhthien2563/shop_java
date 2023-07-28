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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
      </head>

      <body>
        <jsp:include page="/WEB-INF/views/nav.jsp" />



        <div class="container-fluid">
          <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5 gy-4">
              <c:forEach var="product" items="${products}">

                <div class="col">
                  <a class="card text-decoration-none card-item" href="/shopping/product?id=${product.id}">
                    <img src="${product.image}" class="card-img-top"
                      alt="Hollywood Sign on The Hill" />
                    <div class="card-body">
                      <h6 class="card-title text-black">${product.name}</h6>
                      <div class="additional">
                        <div class="row">
                          <div class="col-6">
                            <p class="text-black">đ${product.price}</p>
                          </div>
                          <div class="col">
                            <small class="text-muted">
                              <c:choose>
                                <c:when test="${product.sold_count > 99}">
                                  99+
                                </c:when>
                                <c:when test="${product.sold_count < 99}">
                                  ${product.sold_count}
                                </c:when>
                              </c:choose>
                              Đã bán
                            </small>
                          </div>
                        </div>
                      </div>
                    </div>
                  </a>
                </div>

              </c:forEach>
            </div>
          </div>
        </div>


        <c:import url="/WEB-INF/views/cart.jsp" />

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
          crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      </body>

      </html>