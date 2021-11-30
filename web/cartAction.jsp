<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-11-18
  Time: 오후 7:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.CartDao" %>
<html>
<head>
    <title>cart</title>
</head>
<body>
    <%
        CartDao cartDao = new CartDao();
        cartDao.insertCart((String)session.getAttribute("userID"),
                Integer.parseInt(request.getParameter("oid")));
        String pages = request.getParameter("page");
        if (pages.equals("main")) {
            response.sendRedirect("main.jsp");
        } else if (pages.equals("bread")) {
            response.sendRedirect("menu.jsp?category=Bread");
        } else if (pages.equals("cake")) {
            response.sendRedirect("menu.jsp?category=Cake");
        } else {
            response.sendRedirect("menu.jsp?category=Cookie");
        }
    %>
</body>
</html>
