<%@ page import="zust.model.SChicken" %>
<%@ page import="zust.service.SchickenService" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="zust.service.Impl.SchickenServiceImpl" %>
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
    <script src="http://cdn.static.runoob.com/libs/jquery/1.10.2/jquery.min.js"></script>
</head>
<script>
    function likesup(scId) {
        var likescount = document.getElementById("likescount");
        likescount.innerText = (likescount.innerText*1.0 + 1)+"";
        $.ajax({
            type:"GET",
            url:"/ssm/likes.do",
            data:{"scId":$("font[name='likescount']")},
            success: function (data) {      //成功，回调函数
                alert(data.result);
            },
            error: function (er) {          //失败，回调函数
                alert(er);
            }
        });
    }
</script>
<body>
    <!--顶部条-->
    <a href="/ssm/mainpage.do">主页</a>
    <a href="/ssm/visit.do">游客</a>
    <a href="/ssm/message.do">私信</a>
    <img src="${pageContext.servletContext.contextPath}/resources/img/dog.png">
    <form method="get" action="/ssm/search.do">
        <input type="text" name="what2search" >
        <input type="submit" value="搜索" >
    </form>
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
                <c:if test="${user.userinfo.userinfoVip == 1}">
                    <input type="file" name="scimg" />
                </c:if>
                <input type="submit" value="发送">
            </form>
        </div>
    </div>
    <!--微博体-->
    <div>
        <c:if test="${followsSC != null}">
            <c:forEach var="sc" items="${followsSC}">
                <img src="<c:out value="${pageContext.request.contextPath}/${sc.userinfo.userinfoPicurl}"/>">
                <c:out value="${sc.user.userRealname}"/>
                <c:if test="${user.userinfo.userinfoVip == 1}">
                    V
                </c:if>
                @<c:out value="${sc.user.userName}"/>
                <c:out value="${sc.scInfo}"/>
                <c:if test="${sc.scPictureId != null}"><img src="<c:out value="${pageContext.request.contextPath}/${sc.picture.pictureUrl}"/>"></c:if>
                <a name href="">likes<font name="likescount"><c:out value="${sc.scLike}"/></font></a>
                comments<c:out value="${sc.scComments}"/>
                message
                <br>
            </c:forEach>
        </c:if>
    </div>
</body>
</html>
