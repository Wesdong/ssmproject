<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lwdky
  Date: 2017/12/12
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SChicken个人主页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mainpage.css">
</head>
<body>
    <!--顶部条-->
    <a href="/ssm/mainpage.do">主页</a>
    <a href="/ssm/visit.do">游客</a>
    <a href="/ssm/message.do">私信</a>
    <img src="${pageContext.servletContext.contextPath}/resources/img/dog.png">
    <!--头像-->
    <img src="${user.userinfo.userinfoPicurl}"/>
    <!--头像右边栏-->
    <a href="/ssm/follow.do">正在关注</a>${follows}
    <a href="/ssm/fans.do">关注者</a>${fans}
    <button>编辑个人信息</button>
    <!--头像下栏-->
    <p>${user.userRealname}</p>
    <p>@${user.userName}</p>
    <!--微博体-->
    <div>
        <c:forEach var="sc" items="${user.scList}">
            <img src="<c:out value="${pageContext.request.contextPath}/${sc.userinfo.userinfoPicurl}"/>">
            <c:out value="${sc.user.userRealname}"/>
            @<c:out value="${sc.user.userAccount}"/>
            <c:out value="${sc.scInfo}"/>
            <img src="<c:out value="${pageContext.request.contextPath}/${sc.picture.pictureUrl}"/>">
            likes<c:out value="${sc.scLike}"/>
            comments<c:out value="${sc.scComments}"/>
            message
        </c:forEach>
    </div>

</body>
</html>
