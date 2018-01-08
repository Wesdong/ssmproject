<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lwdky
  Date: 2018/1/8
  Time: 3:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的关注</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/fanandfollows.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript" src="jquery-1.9.1.min.js"></script>
</head>
<script>
    $(function() {
        $("#toggle").click(function() {
            $(this).text($("#button9").is(":hidden") ? "编辑个人资料" : "编辑个人资料");
            $("#button9").slideToggle();
            $(this).text($("#content").is(":hidden") ? "编辑个人资料" : "编辑个人资料");
            $("#content").slideToggle();
        });
        $("#button9").click(function() {
            $(this).text($("#button8").is(":hidden") ?"取消" : "取消");
            $("#button8").slideToggle();
            $(this).text($("#content").is(":hidden") ? "取消" : "取消");
            $("#content").slideToggle();
        });
        $("#button10").click(function() {
            $(this).text($("#button9").is(":hidden") ?"保存个人资料" : "保存个人资料");
            $("#button9").slideToggle();
            $(this).text($("#content").is(":hidden") ? "保存个人资料" : "保存个人资料");
            $("#content").slideToggle();
        });
    });
    function displaysendsc() {
        var sendsc = document.getElementById("content");
        sendsc.style.display = "none";
    }
    function displaysendsc1() {
        var sendsc = document.getElementById("button9");
        sendsc.style.display = "none";
    }
    function displaysendsc2() {
        var sendsc = document.getElementById("button10");
        sendsc.style.display = "none";
    }
</script>
<body style="background-color:#f2f2f2">
    <!--顶部条-->

    <div class="menu">
        <ul>
            <li><a href="/ssm/mainpage.do" >主页</a></li>
        </ul>
        <img src="${pageContext.servletContext.contextPath}/resources/img/dog.png" >
        <form method="get" action="/ssm/search.do">
            <input type="text" name="what2search" class="a">
            <input type="submit" value="搜索" class="b">
        </form>

    </div>

    <!--头像-->
    <div class="blueline"></div>
    <div class="whiteline">
        <ul>
            <li><a href="/ssm/fansfollow.do">正在关注</a><font class="number1">${follows}</font></li>
            <li><a href="/ssm/fansfollow.do">关注者</a><font class="number2">${fans}</font></li>

        </ul>
        <button class="button8" id="toggle">编辑个人资料</button>
        <button class="button9" id="button9" style="display: none;" onclick="displaysendsc1()">取消</button>
    </div>
    <div class="circle"><img src="${user.userinfo.userinfoPicurl}"/></div>


    <div class="whole">
    <div class="left">
        <font class="realname">${user.userRealname}</font>
        <font class="username">@${user.userName}</font>
        <!--修改个人资料区-->
        <div id="content" style="display: none;" >
            <form method="post" action="/ssm/updateuser.do" enctype="multipart/form-data">
                <p class="pp">修改头像</p>
                <input type="file" name="headshot" class="button7">
                <input type="text" name="realname" value="${user.userRealname}" class="c">
                <p class="ppp">@${user.userName}</p>
                <input type="text" name="introduce"  class="c" placeholder="简介">
                <input type="date" name="birthday"   class="c"  placeholder="生日">
                <input type="submit" class="button10" onclick="displaysendsc2()" value="保存个人资料">
            </form>
        </div>
    </div>
        <div class="right">
    <!--关注区-->
    <div class="right11">
        <div class="">关注区</div>
        <c:forEach var="follow" items="${fansList}">
            <img src="${pageContext.request.contextPath}/${follow.userinfo.userinfoPicurl}">
            <p>${follow.userRealname}</p>
            <p>@${follow.userName}</p>
            <a href="/ssm/notfollow.do?userId=${user.userId}&followerId=${follow.userId}">正在关注</a><!--这里注意要在鼠标移上去之后变成取消关注-->
        </c:forEach>
    </div>
    <!--粉丝区-->
     <div div="right22">
        <div class="">粉丝区</div>
        <c:forEach var="fans" items="${followsList}">
            <img src="${pageContext.request.contextPath}/${fans.userinfo.userinfoPicurl}">
            <p>${fans.userRealname}</p>
            <p>@${fans.userName}</p>
        </c:forEach>
     </div>
        </div>
    </div>
</body>
</html>
