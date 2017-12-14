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
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/register.css">
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
   <div class="menu">
        <img src="${pageContext.servletContext.contextPath}/resources/img/dog.png">
   </div>
        <div id="wrap">
            <div id="join">
            现在加入SChicken
            </div>
        <div id="register>
">
            <p><f:form action="/ssm/register.do" method="post"></p>
                <p><f:input path="userRealname" type="text" placeholder="请输入名字"/></p>
                <p><f:input path="userAccount" type="text" placeholder="请输入昵称"/></p>
                <p><f:input path="userName" type="text" value="${username}" placeholder="请输入用户名"/></p>
                <p><f:input path="userPassword" type="password" placeholder="请输入密码"/></p>
                <p><input type="radio" value="男" name="gender" >男
                <input type="radio" value="女" name="gender" >女</p>
                <input type="submit" value="注册">
            </f:form>
        </div>
   </div>
</body>
</html>
