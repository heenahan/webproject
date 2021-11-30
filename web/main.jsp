<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-11-11
  Time: 오전 2:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.ItemDao" %>
<%@ page import="dto.Item" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <!--bootstrap 4.1.3-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!--fontawesome-->
    <script src="https://kit.fontawesome.com/c2dad3efdc.js" crossorigin="anonymous"></script>
    <!--masonry-->
    <script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
    <!--google font-->
    <link href="https://fonts.googleapis.com/css2?family=Arvo:wght@700&family=Gowun+Dodum&family=Mountains+of+Christmas:wght@700&display=swap" rel="stylesheet">
    <!--bootstrap icon-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <title>main</title>
</head>
<body>
    <jsp:include page="navbar.jsp"/>
    <!--자동 스크롤 배너-->
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="margin-top: 80px">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" height="400">
            <div class="carousel-item active">
                <img class="d-block w-100" src="img/banner/1.png" alt="First slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="img/banner/2.png" alt="Second slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="img/banner/3.png" alt="Third slide">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <!--
        이벤트 상품
        -body
        -script
    -->
    <!--DB에서 상품을 ArrayList로 받음-->
    <div class="container" style="margin-top: 40px">
        <p style="font-family: 'Mountains of Christmas', cursive; font-size: xx-large; text-align: center">Happy Merry Christmas</p>
        <div class="grid">
            <div class="grid-sizer"></div>
    <%
        String user_id = (String)session.getAttribute("userID");
        ItemDao itemDao = new ItemDao();
        ArrayList<Item> christmas = itemDao.getEventItem();
        for (Item event : christmas) {
    %>
            <div class="grid-item">
                <p><%=event.getName()%></p>
                <img src="<%=event.getImage()%>">
                <p><span style="text-decoration:line-through; color: Gray;"><%=event.getOriginalPrice()%>원</span> → <b><%=event.getEventPrice()%>원</b></p>
                <p><%=event.getDescription()%></p>
                <p align="right"><a href="#" onclick="checkLogin('<%=user_id%>', '<%=event.getName()%>' ,<%=event.getOid()%>)">
                    <i class="bi bi-cart3" style="color: gray"></i></a>
                </p>
            </div>
    <%
        }
    %>
        </div>
    </div>
    <!--masonry script-->
    <script>
        var msnry = new Masonry( '.grid', {
            itemSelector: '.grid-item',
            columnWidth: '.grid-sizer',
            horizontalOrder: true,
            gutter : 20,
        });

        imagesLoaded('.grid').on('progress', function() {
            msnry.layout();
        });

        function checkLogin(user, name, oid) {
            if (user == 'null') {
                alert("로그인 후 이용해주세요.");
            } else {
                var check = confirm("["+ name +"]을(를) 장바구니에 넣겠습니까?");
                if (check) {
                    location.href = "cartAction.jsp?oid=" + oid + "&page=main";
                } else {
                    return false;
                }
            }
        }
    </script>
    <jsp:include page="footer.jsp"/>
    <!--bootstrap jquery-->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
