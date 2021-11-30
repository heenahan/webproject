<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-11-17
  Time: 오후 10:18
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
    <title>menu</title>
</head>
<body>
    <jsp:include page="navbar.jsp"/>
    <%
        String category = request.getParameter("category");
    %>
    <div class="container" style="margin-top: 120px">
        <p style="font-family: 'Arvo', serif;"><%=category%>
            <%
                if (category.equals("Bread")) {
                    out.print("&#129360;");
                } else if (category.equals("Cake")) {
                    out.print("&#127856;");
                } else {
                    out.print("&#127850;");
                }

            %>
        </p>
        <hr>
        <!--
            카테고리 별 상품 리스트
            -body
            -script
        -->
        <!--DB에서 상품을 ArrayList로 받음-->
        <div class="grid">
            <div class="grid-sizer"></div>
            <%
                String user_id = (String) session.getAttribute("userID");
                ItemDao itemDao = new ItemDao();
                ArrayList<Item> list;
                list = itemDao.getCategoryItem(category.toLowerCase());
                for (Item itemList : list) {
            %>
            <div class="grid-item">
                <p><%=itemList.getName()%></p>
                <img src="<%=itemList.getImage()%>">
                <% if (!itemList.getEventPrice().equals(0)) { %>
                    <p><span style="text-decoration:line-through; color: Gray;"><%=itemList.getOriginalPrice()%>원</span> → <b><%=itemList.getEventPrice()%>원</b></p>
                <% } else {%>
                    <p><%=itemList.getOriginalPrice()%>원</p>
                <% } %>
                <p><%=itemList.getDescription()%></p>
                <p align="right">
                    <a href="#" onclick="checkLogin('<%=user_id%>', '<%=itemList.getName()%>' ,<%=itemList.getOid()%>, '<%=category.toLowerCase()%>')">
                        <i class="bi bi-cart3" style="color: gray"></i>
                    </a>
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
            percentPosition: true,
            gutter : 20,
        });
        imagesLoaded( '.grid' ).on( 'progress', function() {
            msnry.layout();
        });

        function checkLogin(user, name, oid, page) {
            if (user == 'null') {
                alert("로그인 후 이용해주세요.");
            } else {
                var check = confirm("["+ name +"]을(를) 장바구니에 넣겠습니까?");
                if (check) {
                    location.href = "cartAction.jsp?oid=" + oid + "&page=" + page;
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
