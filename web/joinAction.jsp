<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-11-29
  Time: 오후 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>join</title>
</head>
<body>
    <jsp:include page="join.jsp"/>
    <%
        UserDao userDao = new UserDao();
        String id = request.getParameter("id");
        String pw = request.getParameter("password");
        if (userDao.isExisted(id) == 1) {
            out.print("<script> alert('아이디가 존재합니다. 다른 아이디를 입력해주세요'); history.back; </script>");
        } else {
            userDao.insertUser(id, pw);
            out.print("<script> alert('회원가입이 완료되었습니다! 로그인 후 이용해주세요.'); location.href='main.jsp'; </script>");
        }
    %>
</body>
</html>
