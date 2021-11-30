<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-11-22
  Time: 오후 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="dao.CartDao" %>
<%@ page import="dao.OrderDao" %>
<%@ page import="dto.Item" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Order" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <!--bootstrap 4.1.3-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!--fontawesome-->
    <script src="https://kit.fontawesome.com/c2dad3efdc.js" crossorigin="anonymous"></script>
    <title>purchase</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>
    <%
        CartDao cartDao = new CartDao();
        OrderDao orderDao = new OrderDao();

        ArrayList<Order> orders = orderDao.getAllorder();
    %>
    <div class="container" style="margin-top: 150px">
        <p>Purchase&#129534;</p>
        <table class="table">
            <thead>
            <th scope="col">주문자 아이디</th>
            <th scope="col">구매 목록</th>
            <th scope="col">총 구매 가격</th>
            <th scope="col">픽업 시간</th>
            </thead>
            <tbody>
            <%
                for (Order order : orders) {
            %>
            <tr>
                <td><%=order.getId()%></td>
                <td>
                    <%
                        ArrayList<Item> item = cartDao.getCartAllList(order.getId(), order.getOrder_date(), order.getOrder_time());
                        int total = 0, discount = 0;
                        for (Item items : item) {
                            total += items.getOriginalPrice();
                            if (items.getEventPrice().equals(0)) {
                                discount += items.getOriginalPrice();
                            } else {
                                discount += items.getEventPrice();
                            }
                    %>
                    <p>- <%=items.getName()%></p>
                    <%
                        }
                    %>
                </td>
                <td>
                    <%
                        if (total == discount) {
                            out.print(total);
                        } else {
                            out.print("<span style='text-decoration:line-through; color: Gray;'>" + total + "</span> → " + discount);
                        }
                    %>
                </td>
                <td>
                    <%=order.getPickup_date()%> <%=order.getPickup_time()%>
                </td>
                <%
                    }
                %>
            </tr>
            </tbody>
        </table>
    </div>
    <jsp:include page="footer.jsp"/>
    <!--bootstrap jquery-->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
