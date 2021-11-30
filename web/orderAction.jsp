<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-11-19
  Time: 오전 1:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="dao.CartDao" %>
<%@ page import="dao.OrderDao" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.Time" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        CartDao cartDao = new CartDao();
        OrderDao orderDao = new OrderDao();
        String user_id = (String) session.getAttribute("userID");

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String[] split = format.format(System.currentTimeMillis()).split(" ");
        Date order_date = Date.valueOf(split[0]);
        Time order_time = Time.valueOf(split[1]);

        Date pickup_date = Date.valueOf(request.getParameter("date"));
        Time pickup_time = Time.valueOf(request.getParameter("time"));

        cartDao.updateCart(user_id, order_date, order_time);
        orderDao.insertOrder(user_id, order_date, order_time, pickup_date, pickup_time);
    %>
    <form action="orderComplete.jsp" method="post" name="hiddenForm">
        <input type="hidden" value="<%=order_date%>" name="date">
        <input type="hidden" value="<%=order_time%>" name="time">
    </form>
    <script type="text/javascript">
        var form = document.hiddenForm;
        form.submit();
    </script>
</body>
</html>
