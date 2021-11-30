<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-11-18
  Time: 오후 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="date.DateTimeUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!--bootstrap 4.1.3-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!--fontawesome-->
    <script src="https://kit.fontawesome.com/c2dad3efdc.js" crossorigin="anonymous"></script>
    <title>order</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<%
    DateTimeUtil date = new DateTimeUtil();
%>
<div class="container" style="margin-top: 150px">
    <form action="orderAction.jsp" method="post">
        <div class="form-group">
            <label for="selectDate">Date</label>
            <select class="form-control" name="date" id="selectDate">
                <%
                    for (int i = 1; i < 8; i++) {
                %>
                <option value="<%=date.getLaterDate(i)%>"><%=date.getLaterDate(i)%></option>
                <%
                    }
                %>
            </select>
            <small id="dateHelp" class="form-text text-muted">오늘 날짜로부터 일주일 이내 픽업하셔야 합니다.</small>
        </div>
        <div class="form-group">
            <label for="selectTime">Time</label>
            <select class="form-control" name="time" id="selectTime">
                <%
                    for (int i = 10; i < 21; i++) {
                %>
                <option value="<%=i%>:00:00"><%=i%>:00</option>
                <%
                    }
                %>
            </select>
            <small id="timeHelp" class="form-text text-muted">픽업 가능 시간은 오전 10시부터 오후 8시까지 입니다.</small>
        </div>
        <button type="submit" class="btn btn-primary">submit</button>
    </form>
</div>
</body>
</html>
