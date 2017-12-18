<%--
  Created by IntelliJ IDEA.
  User: lwdky
  Date: 2017/12/12
  Time: 19:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SChiken</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/SChicken.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
</head>
<body>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">


    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="${pageContext.servletContext.contextPath}/resources/img/univers1.jpg" alt="...">
            <div class="carousel-caption">

            </div>
        </div>
        <div class="item">
            <img src="${pageContext.servletContext.contextPath}/resources/img/univers1.jpg" alt="...">
            <div class="carousel-caption">

            </div>
        </div>

    </div>


</div>
<div class="menu">
    <ul>
        <li><img src="${pageContext.servletContext.contextPath}/resources/img/dog.png" class="img"> <a href="/ssm/mainpage.do">主页</a></li>
        <li><a href="/ssm/visit.do">游客</a></li>
    </ul>
</div>
<div id="wrap">
    <div id="main">
        <div id="huanying">欢迎来到SChicken：）</div>
        <div id="right1">
            <form method="post" action="/ssm/login.do" >
                <p><input type="text" name="username" placeholder="手机、邮箱或用户名" class="a"></p>
                <p><input type="password" name="password" placeholder="密码" class="b"></p>
                <input type="checkbox" class="c"><font style="font-family: 微软雅黑">记住我</font>
                <input type="submit" value="登录" class="button1">
            </form>
        </div>
        <div id="right2">
            <form method="get" action="/ssm/register.do" >
                <div id="shang">
                    <font id="leftfont">新来的SChicken用户？</font>
                    <font id="rightfont">注册</font>
                </div>
                <input type="text" name="rusername" class="e" placeholder="手机、邮箱或用户名" >
                <input type="submit" value="注册" class="button2">
            </form>
        </div>
    </div>
</div>

</body>
</html>

