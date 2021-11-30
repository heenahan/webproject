<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-11-18
  Time: 오후 5:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="dto.User" %>
<%@ page import="dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:include page="login.jsp"/>
    <%
        UserDao userDao = new UserDao();
        String user_id = request.getParameter("id");
        String user_pw = request.getParameter("password");

        if (user_pw.equals(userDao.getPassword(user_id))) {
            session.setAttribute("userID", user_id);
            session.setAttribute("userPW", user_pw);
            out.print("<script> alert('로그인에 성공했습니다.'); location.href='main.jsp'; </script>");
        } else {
            out.print("<script> alert('아이디 또는 비밀번호를 잘못 입력하셨습니다.'); history.back; </script>");
        }
    %>
</body>
</html>
