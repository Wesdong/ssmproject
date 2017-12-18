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
</head>
<body>
    <div>
        <a href="/ssm/mainpage.do">主页</a>
        <a href="/ssm/visit.do">游客</a>
        <a href="/ssm/message.do">私信</a>
        <img src="${pageContext.servletContext.contextPath}/resources/img/dog.png">
        <form method="get" action="/ssm/search.do">
            <input type="text" name="what2search">
            <input type="submit" value="搜索">
        </form>
    </div>
    <div>
        <c:forEach var="sc" items="${sclist.list}">
            <img src="<c:out value="${pageContext.request.contextPath}/${piclist.get(sc.scPictureId-1).pictureUrl}"/>" >
            <p><c:out value="${sc.scInfo}"/></p>
        </c:forEach>
    </div>
</body>
</html>
