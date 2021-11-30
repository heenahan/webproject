<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-11-29
  Time: 오후 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!--bootstrap 4.1.3-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!--fontawesome-->
    <script src="https://kit.fontawesome.com/c2dad3efdc.js" crossorigin="anonymous"></script>
    <title>join</title>
</head>
<script type="text/javascript">
    function checkJoin() {
        var form = document.joinForm;
        var pw = form.password.value;
        var num = pw.search(/[0-9]/g);
        var eng = pw.search(/[a-z|A-Z]/g);
        if (form.id.value.length < 4) {
            alert("아이디는 4자 이상이어야 합니다.");
            form.id.select();
            return false;
        } else if (pw.length < 6 || num < 0 || eng < 0) {
            alert("비밀번호는 영문 + 숫자 조합으로 6자 이상이어야 합니다.");
            form.password.select();
            return false;
        }
        form.submit();
    }
</script>
<body>
    <jsp:include page="navbar.jsp"/>
    <div class="container" style="margin-top: 150px">
        <form action="joinAction.jsp" method="post" name="joinForm">
            <div class="form-group">
                <label for="inputID">ID</label>
                <input type="text" class="form-control" id="inputID" placeholder="Enter ID" name="id">
                <small id="idHelp" class="form-text text-muted">아이디는 4자 이상이어야 합니다.</small>
            </div>
            <div class="form-group">
                <label for="inputPW">Password</label>
                <input type="password" class="form-control" id="inputPW" placeholder="Enter Password" name="password">
                <small id="passwordHelp" class="form-text text-muted">비밀번호는 영문자 + 숫자 조합으로 6자 이상이어야 합니다.</small>
            </div>
            <button type="submit" class="btn btn-primary" onclick="checkJoin()">submit</button>
        </form>
    </div>
    <jsp:include page="footer.jsp"/>
</body>
</html>
