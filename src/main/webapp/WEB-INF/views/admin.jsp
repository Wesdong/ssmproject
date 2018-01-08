<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lwdky
  Date: 2018/1/8
  Time: 5:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SChickenMother</title>
</head>
<body>
    <p>您好，尊敬的${admin.adminName}管理员，祝您今天愉快</p>
    <a href="/ssm/adminlogout.do">注销</a>
    <c:forEach var="user" items="${alluser}">
        <p>username:${user.userName}</p>
        <p>userRealname:${user.userRealname}</p>
        <p>usergender:${user.userGender}</p>
        <p>userinfo:${user.userinfo.userinfoStatement}</p>
        <p>是否vip:<c:if test="${user.userinfo.userinfoVip == 0}">否</c:if>
            <c:if test="${user.userinfo.userinfoVip == 1}">是</c:if> </p>
        <a href="/ssm/deleteUser.do?userId=${user.userId}">删除</a>
    </c:forEach>
</body>
</html>
