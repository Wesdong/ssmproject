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
    <title>SChicken主页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mainpage.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <!--顶部条-->

    <div class="menu">
        <ul>
            <li><a href="/ssm/index.do" >主页</a></li>
            <li><a href="/ssm/visit.do">游客</a></li>
            <li><a href="/ssm/message.do">私信</a></li>
        </ul>
        <img src="${pageContext.servletContext.contextPath}/resources/img/dog.png" >
        <form method="get" action="/ssm/search.do">
            <input type="text" name="what2search" class="a">
            <input type="submit" value="搜索" class="b">
        </form>

    </div>
    <!--头像-->
    <img src="${user.userinfo.userinfoPicurl}"/>
    <!--头像右边栏-->
    <a href="">推文</a>${SCs}
    <a href="/ssm/follow.do">正在关注</a>${follows}
    <a href="/ssm/fans.do">关注者</a>${fans}
    <!--头像下栏-->
    <p>${user.userRealname}</p>
    <p>@${user.userName}</p>
    <!--注销-->
    <div>
        <a href="/ssm/logout.do">注销</a>
        <p>你是否想发图文微博</p>
        <a href="">立刻成为VIP SChicken</a>
        <div>
            <p>立刻成为vip Schicken</p>
            <p>vip价格:5$/月</p>
            <img src="${pageContext.servletContext.contextPath}/resources/img/pay.png">
            <button>我已付款</button>
        </div>
    </div>
    <!--发微博-->
    <div>
        <input type="text"><img src="">
        <div>
            <p>撰写新SChicken</p>
            <form method="post" action="/ssm/sendsc.do" enctype="multipart/form-data">
                <input type="text" name="scinfo" />
                <input type="file" name="scimg" />
                <input type="submit" value="发送">
            </form>
        </div>
    </div>
    <!--微博体-->
    <div>
        <c:forEach var="sc" items="${followsSC}">
            <img src="<c:out value="${pageContext.request.contextPath}/${sc.userinfo.userinfoPicurl}"/>">
            <c:out value="${sc.user.userRealname}"/>
            @<c:out value="${sc.user.userName}"/>
            <c:out value="${sc.scInfo}"/>
            <c:if test="${sc.scPictureId != null}"><img src="<c:out value="${pageContext.request.contextPath}/${sc.picture.pictureUrl}"/>"></c:if>
            likes<c:out value="${sc.scLike}"/>
            comments<c:out value="${sc.scComments}"/>
            message
            <br>
        </c:forEach>
    </div>

</body>
</html>
