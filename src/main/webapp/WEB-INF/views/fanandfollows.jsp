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
</head>
<body>
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
    </div>
    <div class="circle"><img src="${user.userinfo.userinfoPicurl}"/></div>

    <!--修改个人资料区-->
    <div>
        <button>编辑个人资料</button>
        <button>取消</button>
        <form method="post" action="/ssm/updateuser.do" enctype="multipart/form-data">
            <p>修改头像</p>
            <input type="file" name="headshot">
            <input type="text" name="realname" value="${user.userRealname}">
            <p>@${user.userName}</p>
            <input type="text" name="introduce" placeholder="简介">
            <input type="date" name="birthday" placeholder="生日">
            <input type="submit" value="保存">
        </form>
    </div>

    <div class="left">
        <font class="realname">${user.userRealname}</font>
        <font class="username">@${user.userName}</font>
    </div>

    <!--关注区-->
    <div>
        <c:forEach var="follow" items="${fansList}">
            <img src="${pageContext.request.contextPath}/${follow.userinfo.userinfoPicurl}">
            <p>${follow.userRealname}</p>
            <p>@${follow.userName}</p>
            <a href="/ssm/notfollow.do?userId=${user.userId}&followerId=${follow.userId}">正在关注</a><!--这里注意要在鼠标移上去之后变成取消关注-->
        </c:forEach>
    </div>
    <!--粉丝区-->
    <div>
        <c:forEach var="fans" items="${followsList}">
            <img src="${pageContext.request.contextPath}/${fans.userinfo.userinfoPicurl}">
            <p>${fans.userRealname}</p>
            <p>@${fans.userName}</p>
        </c:forEach>
    </div>
</body>
</html>
