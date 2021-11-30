<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-11-18
  Time: 오후 7:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>logout</title>
</head>
<body>
  <%
    session.invalidate();
    response.sendRedirect("main.jsp");
  %>
</body>
</html>
