<%--
  Created by IntelliJ IDEA.
  User: lwdky
  Date: 2018/1/5
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!--头像下栏-->
    <p>${user.userRealname}</p>
    <p>@${user.userName}</p>
    <!--微博体-->
    <div>
        <c:if test="${user.scList != null}">
            <c:forEach var="sc" items="${user.scList}">
                <img src="<c:out value="${pageContext.request.contextPath}/${sc.userinfo.userinfoPicurl}"/>">
                <c:out value="${sc.user.userRealname}"/>
                @<c:out value="${sc.user.userAccount}"/>
                <c:out value="${sc.scInfo}"/>
                <c:if test="${sc.scPictureId != null}"><img src="<c:out value="${pageContext.request.contextPath}/${sc.picture.pictureUrl}"/>"></c:if>
                likes<c:out value="${sc.scLike}"/>
                comments<c:out value="${sc.scComments}"/>
                message
            </c:forEach>
        </c:if>
    </div>
</body>
</html>
