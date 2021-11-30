<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-11-19
  Time: 오전 12:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="dao.CartDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>delete</title>
</head>
<body>
  <%
      CartDao cartDao = new CartDao();
      cartDao.deleteCart((String)session.getAttribute("userID"), Integer.parseInt(request.getParameter("oid")));
      response.sendRedirect("cartList.jsp");
  %>
</body>
</html>
