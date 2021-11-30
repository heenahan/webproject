<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2021-11-10
  Time: 오후 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="dao.CartDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script>
  function checkLogout() {
    var check = confirm("로그아웃 하시겠습니까?");
    if (check) {
      location.href = 'logout.jsp';
    }
  }
</script>
<body>
    <style>
      /*navbar style*/
      .navbar-icon-top .navbar-nav .nav-link > .fa {
        position: relative;
        width: 36px;
        font-size: 24px;
      }

      .navbar-icon-top .navbar-nav .nav-link > .fa > .badge{
        top: 3px;
        line-height: 12px;
      }

      .navbar-icon-top .navbar-nav .nav-link > .fa .badge {
        top: -10px;
      }

      @media (min-width: 576px) {
        .navbar-icon-top.navbar-expand-sm .navbar-nav .nav-link {
          text-align: center;
          display: table-cell;
          height: 70px;
          vertical-align: middle;
          padding-top: 0;
          padding-bottom: 0;
        }

        .navbar-icon-top.navbar-expand-sm .navbar-nav .nav-link > .fa {
          display: block;
          width: 48px;
          margin: 2px auto 4px auto;
          top: 0;
          line-height: 24px;
        }

        .navbar-icon-top.navbar-expand-sm .navbar-nav .nav-link > .fa > .badge {
          top: -7px;
        }
      }

      @media (min-width: 768px) {
        .navbar-icon-top.navbar-expand-md .navbar-nav .nav-link {
          text-align: center;
          display: table-cell;
          height: 70px;
          vertical-align: middle;
          padding-top: 0;
          padding-bottom: 0;
        }

        .navbar-icon-top.navbar-expand-md .navbar-nav .nav-link > .fa {
          display: block;
          width: 48px;
          margin: 2px auto 4px auto;
          top: 0;
          line-height: 24px;
        }

        .navbar-icon-top.navbar-expand-md .navbar-nav .nav-link > .fa > .badge {
          top: -7px;
        }
      }

      @media (min-width: 992px) {
        .navbar-icon-top.navbar-expand-lg .navbar-nav .nav-link {
          text-align: center;
          display: table-cell;
          height: 70px;
          vertical-align: middle;
          padding-top: 0;
          padding-bottom: 0;
        }

        .navbar-icon-top.navbar-expand-lg .navbar-nav .nav-link > .fa {
          display: block;
          width: 48px;
          margin: 2px auto 4px auto;
          top: 0;
          line-height: 24px;
        }

        .navbar-icon-top.navbar-expand-lg .navbar-nav .nav-link > .fa > .badge {
          top: -7px;
        }
      }

      @media (min-width: 1200px) {
        .navbar-icon-top.navbar-expand-xl .navbar-nav .nav-link {
          text-align: center;
          display: table-cell;
          height: 70px;
          vertical-align: middle;
          padding-top: 0;
          padding-bottom: 0;
        }

        .navbar-icon-top.navbar-expand-xl .navbar-nav .nav-link > .fa {
          display: block;
          width: 48px;
          margin: 2px auto 4px auto;
          top: 0;
          line-height: 24px;
        }

        .navbar-icon-top.navbar-expand-xl .navbar-nav .nav-link > .fa > .badge {
          top: -7px;
        }
      }
      /*masonry style*/
      .grid { width: 100%; margin-top: 20px}
      .grid-sizer, .grid-item { width: 23%;}
      /* .grid-sizer, .grid-item { width: 200px; } */
      .grid-item {margin-bottom:15px; overflow:hidden; font-family: 'Gowun Dodum', sans-serif;}
      .grid-item img {display: block; min-width:100%; max-width: 100%; }
      #footer {clear: both}
      /* 모바일 CSS */
      @media screen and (max-width:640px) {
        .grid-item {
          width: 50% !important;
          float: left !important;
          transform: unset !important;
          position: initial !important;
          display: block !important;
          padding: 5px !important;
          box-sizing: border-box;
        }
        .grid-item img {
          width: 100% !important;
        }
        .grid {
          height: auto !important;
        }
      }
    </style>
    <%
      CartDao cartDao = new CartDao();
      String user_id = (String) session.getAttribute("userID");
      String user_pw = (String) session.getAttribute("userPW");
    %>
    <!--고정 navbar-->
    <nav class="navbar fixed-top navbar-icon-top navbar-expand-lg navbar-light" style="background-color: #FDF7F2;">
      <a class="navbar-brand" href="#">
        <img src="img/logo/Bakery_logo_image.png" width="40">
        <img src="img/logo/Bakery_logo_font.png" height="40">
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="main.jsp">
              <i class="fa fa-home"></i>
              Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <i class="fa fa-cookie-bite"></i>
              Menu
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="menu.jsp?category=Bread">Bread</a>
              <a class="dropdown-item" href="menu.jsp?category=Cake">Cake</a>
              <a class="dropdown-item" href="menu.jsp?category=Cookie">Cookie</a>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="cartList.jsp">
              <i class="fa fa-shopping-cart"></i>
                <span class="badge badge-danger"><%=cartDao.numberOfcart(user_id)%></span>
              </i>
              Cart
            </a>
          </li>
          <%
            if (user_id != null && user_id.equals("admin")) {
          %>
          <li class="nav-item">
            <a class="nav-link" href="purchase.jsp">
              <i class="fa fa-cash-register"></i>
              Purchase
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="register.jsp">
              <i class="fa fa-edit"></i>
              Register
            </a>
          </li>
          <%
            }
          %>
        </ul>
        <ul class="navbar-nav ">
          <%
            if (user_id == null) {
          %>
          <li class="nav-item">
            <a class="nav-link" href="join.jsp">
              <i class="fa fa-user-plus"></i>
              Join
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="login.jsp">
              <i class="fa fa-sign-in-alt"></i>
              Login
            </a>
          </li>
          <%
            } else {
          %>
          <li class="nav-item">
            <a class="nav-link" href="#" onclick="checkLogout()">
              <i class="fa fa-sign-out-alt"></i>
              Logout
            </a>
          </li>
          <%
            }
          %>
        </ul>
      </div>
    </nav>
  </body>
</html>
