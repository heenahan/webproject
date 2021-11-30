<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-11-18
  Time: 오후 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="dao.CartDao" %>
<%@ page import="dto.Item" %>
<%@ page import="java.util.ArrayList" %><
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <!--bootstrap 4.1.3-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!--bootstrap icon-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <!--fontawesome-->
    <script src="https://kit.fontawesome.com/c2dad3efdc.js" crossorigin="anonymous"></script>
    <!--google font-->
    <link href="https://fonts.googleapis.com/css2?family=Arvo:wght@700&family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <title>cart</title>
</head>
<body>
    <jsp:include page="navbar.jsp"/>
    <div class="container" style="margin-top: 150px">
        <p style="font-family: 'Arvo', serif">Shopping Cart&#128722;</p>
        <table class="table">
            <thead>
                <th scope="col">상품 이미지</th>
                <th scope="col">상품 이름</th>
                <th scope="col">판매 금액</th>
                <th scop="col">삭제</th>
            </thead>
            <tbody>
        <%
      CartDao cartDao = new CartDao();
      int total = 0, discount = 0;
      String user_id = (String)session.getAttribute("userID");
      ArrayList<Item> cartItem = cartDao.getCartList(user_id);
      for (Item cartItems : cartItem) {
          total += cartItems.getOriginalPrice();
          if (cartItems.getEventPrice().equals(0)) {
              discount += cartItems.getOriginalPrice();
          } else {
              discount += cartItems.getEventPrice();
          }
  %>
                <tr style="font-family: 'Noto Sans KR', sans-serif">
                    <td><img src="<%=cartItems.getImage()%>" width="100px"></td>
                    <td><div style="display: inline-block; text-align: center"><%=cartItems.getName()%></div></td>
                    <td>
                        <div style="display: inline-block; text-align: center">
                            <%
                                if (cartItems.getEventPrice().equals(0)) {
                                    out.print(cartItems.getOriginalPrice());
                                } else {
                                    out.print("<span style='text-decoration:line-through; color: Gray;'>" + cartItems.getOriginalPrice() + "</span> → "
                                            + cartItems.getEventPrice());
                                }
                            %>
                        </div>
                    </td>
                    <td>
                        <div style="display: inline-block; text-align: center">
                            <button type="button" class="btn btn-danger" onclick="location.href='deleteCart.jsp?oid='+<%=cartItems.getOid()%>">
                                <i class="bi bi-bag-x"></i>
                            </button>
                        </div>
                    </td>
                </tr>
  <%
      }
  %>
            </tbody>
        </table>
        <hr>
        <p style="text-align: right; font-family: 'Noto Sans KR', sans-serif; font-size: large">총 금액 :
        <%
            if (total == discount) {
                out.print(total);
            } else {
                out.print("<span style='text-decoration:line-through; color: Gray;'>" + total + "</span> → <b>" + discount + "</b>");
            }
        %>
            <button type="button" class="btn btn-dark" style="margin-left: 15px" onclick="checkItem(<%=total%>)">주문하기</button>
        </p>
    </div>
    <script>
        function checkItem(price, id) {
            if (price == 0) {
                alert("장바구니가 비었습니다.");
            } else {
                if (confirm("위 내역을 주문하시겠습니까?")) {
                    location.href = 'orderForm.jsp';
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
