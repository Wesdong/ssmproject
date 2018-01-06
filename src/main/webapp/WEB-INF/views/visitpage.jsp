<%--
  Created by IntelliJ IDEA.
  User: lwdky
  Date: 2017/12/12
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>SChicken游园会</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/visitpage.css">
</head>
<body>
    <div class="menu">
        <ul>
            <li><a href="/ssm/index.do">主页</a></li>
            <li><a href="/ssm/visit.do">游客</a></li>
            <li><a href="/ssm/message.do">私信</a></li>
        </ul>
            <img src="${pageContext.servletContext.contextPath}/resources/img/dog.png" >
            <form method="get" action="/ssm/search.do">
                <input type="text" name="what2search" class="a">
                <input type="submit" value="搜索" class="b">
            </form>

    </div>
    <div class="wrap">
        <div class="main">
               <c:forEach var="sc" items="${sclist.list}">
                <div class="detail">
                    <div class="img"><img src="<c:out value="${pageContext.request.contextPath}/${sc.picture.pictureUrl}"/>" ></div>
                    <p><c:out value="${sc.scInfo}"/></p>
                </div>
               </c:forEach>
        </div>
    </div>
</body>
</html>
