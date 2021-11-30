<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-11-23
  Time: 오전 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <!--bootstrap 4.1.3-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!--fontawesome-->
    <script src="https://kit.fontawesome.com/c2dad3efdc.js" crossorigin="anonymous"></script>
    <title>register</title>
</head>
<body>
    <jsp:include page="navbar.jsp"/>
    <fmt:setLocale value='<%=request.getParameter("language")%>'/>
    <fmt:bundle basename="bundle.message">
    <div class="container" style="margin-top: 150px">
        <div class="row">
            <div class="col-md-6">
                <fmt:message key="title"/>
            </div>
            <div class="col-md-6" style="text-align: right">
                <a href="?language=ko">Korean</a>|<a href="?language=en">English</a>
            </div>
        </div>
        <hr>
        <form action="registerAction.jsp" enctype="multipart/form-data" method="post">
            <div class="form-group row">
                <label for="name" class="col-sm-2"><fmt:message key="name"/></label>
                <div class="col-sm-3">
                    <input type="text" id="name" name="name" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label for="image" class="col-sm-2"><fmt:message key="image"/></label>
                <div class="col-sm-3">
                    <input type="file" id="image" name="image" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label for="originalPrice" class="col-sm-2"><fmt:message key="originalPrice"/></label>
                <div class="col-sm-3">
                    <input type="text" id="originalPrice" name="originalPrice" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label for="eventPrice" class="col-sm-2"><fmt:message key="eventPrice"/></label>
                <div class="col-sm-3">
                    <input type="text" id="eventPrice" name="eventPrice" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label for="description" class="col-sm-2"><fmt:message key="description"/></label>
                <div class="col-sm-5">
                    <textarea name="description" id="description" cols="50" rows="3"></textarea>
                </div>
            </div>
            <div class="form-group row">
                <label for="category" class="col-sm-2"><fmt:message key="category"/></label>
                <div class="col-sm-5">
                    <input type="radio" id="category" name="category" value="bread"><fmt:message key="bread"/>
                    <input type="radio" id="category" name="category" value="cake"><fmt:message key="cake"/>
                    <input type="radio" id="category" name="category" value="cookie"><fmt:message key="cookie"/>
                </div>
            </div>
            <div class="form-group row">
                <label for="eventTag" class="col-sm-2"><fmt:message key="eventTag"/></label>
                <div class="col-sm-3">
                    <input type="text" id="eventTag" name="eventTag" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" class="btn btn-primary" value="<fmt:message key="submit"/>">
                </div>
            </div>
        </form>
    </div>
    </fmt:bundle>
    <jsp:include page="footer.jsp"/>
    <!--bootstrap jquery-->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
