<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-11-18
  Time: 오후 2:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <!--bootstrap 4.1.3-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!--fontawesome-->
    <script src="https://kit.fontawesome.com/c2dad3efdc.js" crossorigin="anonymous"></script>
    <title>login</title>
</head>
<body>
    <jsp:include page="navbar.jsp"/>
    <div class="container" style="margin-top: 150px">
        <form action="loginAction.jsp" method="post">
            <div class="form-group">
                <label for="inputID">ID</label>
                <input type="text" class="form-control" id="inputID" placeholder="Enter ID" name="id">
            </div>
            <div class="form-group">
                <label for="inputPW">Password</label>
                <input type="password" class="form-control" id="inputPW" placeholder="Enter Password" name="password">
            </div>
            <button type="submit" class="btn btn-primary">submit</button>
        </form>
    </div>
    <jsp:include page="footer.jsp"/>
</body>
</html>
