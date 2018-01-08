<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lwdky
  Date: 2018/1/8
  Time: 5:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>搜索SChicker</title>
</head>
<body>
    <div class="menu">
        <ul>
            <li><a href="/ssm/mainpage.do">主页</a></li>
            <li><a href="/ssm/message.do">私信</a></li>
        </ul>
        <img src="${pageContext.servletContext.contextPath}/resources/img/dog.png">
        <form method="get" action="/ssm/search.do">
            <input type="text" name="what2search" class="a">
            <input type="submit" value="搜索" class="b">
        </form>
    </div>
    <!--搜索结果区-->
    <c:forEach var="user2" items="${userList}">
        <img src="${pageContext.request.contextPath}/${user2.userinfo.userinfoPicurl}">
        <p>${user2.userRealname}</p>
        <p>@${user2.userName}</p>
        <a href="/ssm/addrelation.do?userId=${user.userId}&searchUserId=${user2.userId}">关注</a>
    </c:forEach>
</body>
</html>
