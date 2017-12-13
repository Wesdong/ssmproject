<%--
  Created by IntelliJ IDEA.
  User: lwdky
  Date: 2017/12/12
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册SChicken</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <img src="${pageContext.servletContext.contextPath}/resources/img/dog.png">
    <div>
        现在加入SChicken
    </div>
    <div>
        <f:form action="/ssm/register.do" method="post">
            <f:input path="userRealname" type="text"/>
            <f:input path="userAccount" type="text"/>
            <f:input path="userName" type="text" value="${username}"/>
            <f:input path="userPassword" type="password"/>
            <input type="radio" value="男" name="gender" >男
            <input type="radio" value="女" name="gender" >女
            <input type="submit" value="注册">
        </f:form>
    </div>
</body>
</html>
