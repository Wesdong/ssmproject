<%--
  Created by IntelliJ IDEA.
  User: lwdky
  Date: 2017/12/19
  Time: 1:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>SChicken搜索</title>
</head>
<body>
<a href="/ssm/mainpage.do">主页</a>
<a href="/ssm/visit.do">游客</a>
<a href="/ssm/message.do">私信</a>
<img src="${pageContext.servletContext.contextPath}/resources/img/dog.png">
<form method="get" action="/ssm/search.do">
    <input type="text" name="what2search">
    <input type="submit" value="搜索">
</form>
<c:forEach var="sc" items="${sclist.list}">
    <img src="<c:out value="${pageContext.request.contextPath}/${sc.userinfo.userinfoPicurl}"/>">
    <p><c:out value="${sc.user.userRealname}"/></p>
    <p>@<c:out value="${sc.user.userAccount}"/></p>
    <p><c:out value="${sc.scInfo}"/></p>
    <img src="<c:out value="${pageContext.request.contextPath}/${sc.picture.pictureUrl}"/>">
    likes<c:out value="${sc.scLike}"/>
    comments<c:out value="${sc.scComments}"/>
    <br>
</c:forEach>
</body>
</html>
