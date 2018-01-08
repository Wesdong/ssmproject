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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/personpage.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="background-color:#f2f2f2">
    <!--顶部条-->
    <div class="menu">
        <ul>
            <li><a href="/ssm/mainpage.do" >主页</a></li>
        </ul>
        <img src="${pageContext.servletContext.contextPath}/resources/img/dog.png" >
        <form method="get" action="/ssm/search.do">
            <input type="text" name="what2search" class="a">
            <input type="submit" value="搜索" class="b">
        </form>

    </div>
    <!--头像-->
    <div class="blueline"></div>
    <div class="whiteline">
       <ul>
           <li><a href="/ssm/fansfollow.do">正在关注</a><font class="number1">${follows}</font></li>
           <li><a href="/ssm/fansfollow.do">关注者</a><font class="number2">${fans}</font></li>
        </ul>
    </div>
    <div class="circle"><img src="${user.userinfo.userinfoPicurl}"/></div>

    <!--修改个人资料区-->
    <div>
        <button>编辑个人资料</button>
        <button>取消</button>
        <form method="post" action="/ssm/updateuser.do" enctype="multipart/form-data">
            <p>修改头像</p>
            <input type="file" name="headshot">
            <input type="text" name="realname" value="${user.userRealname}">
            <p>@${user.userName}</p>
            <input type="text" name="introduce" placeholder="简介">
            <input type="date" name="birthday" placeholder="生日">
            <input type="submit" value="保存">
        </form>
    </div>

    <div class="whole">
        <div class="left">
            <font class="realname">${user.userRealname}</font>
            <font class="username">@${user.userName}</font>
        </div>
        <div class="right">
            <c:if test="${user.scList != null}">
                <c:forEach var="sc" items="${user.scList}">
                    <div class="detail1" data-toggle="modal" data-target="#myModal">
                        <div class="img1"><img src="<c:out value="${pageContext.request.contextPath}/${sc.userinfo.userinfoPicurl}"/>"></div>
                        <div class="text1"><p><font class="name1"><c:out value="${sc.user.userRealname}"/></font></p>
                            <c:if test="${user.userinfo.userinfoVip == 1}">
                                V
                            </c:if>
                            <font class="name2">@<c:out value="${sc.user.userName}"/></font></div>
                        <p class="p1"><c:out value="${sc.scInfo}"/></p>
                        <div class="img"><c:if test="${sc.scPictureId != null}"><img src="<c:out value="${pageContext.request.contextPath}/${sc.picture.pictureUrl}"/>"></c:if></div>
                        likes<font><c:out value="${sc.scLike}"/></font>
                        comments<c:out value="${sc.scComments}"/>
                        <!--评论区-->
                        <div>
                            <p>回复${sc.user.userRealname}</p>
                            <div>
                                <c:forEach var="comment" items="${sc.commentsList}">
                                    <p>Schicken${comment.commentsUserId}:${comment.commentsInfo}</p>
                                </c:forEach>
                                <p>回复@${sc.user.userName}</p>
                                <form action="/ssm/sendcomment.do" method="get">
                                    <input type="text" value="${sc.scId}" name="scid" hidden="hidden">
                                    <input type="text" value="${user.userId}" name="commentuserid" hidden="hidden">
                                    <input type="text" name="commentinfo">
                                    <input type="submit" value="回复">
                                </form>
                            </div>
                        </div>
                        <a href="/ssm/deletesc.do?scId=${sc.scId}">删除微博</a>
                        <br>
                    </div>
                </c:forEach>
            </c:if>
        </div>

    </div>
<!--
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-body">
                    <c:forEach var="sc" items="${user.scList}">
                        <div class="detail2" data-toggle="modal" data-target="#myModal">
                            <div class="img2"><img src="<c:out value="${pageContext.request.contextPath}/${sc.userinfo.userinfoPicurl}"/>"></div>
                            <div class="text2"><p><font class="name3"><c:out value="${sc.user.userRealname}"/></font></p>
                                <font class="name4">@<c:out value="${sc.user.userAccount}"/></font></div>
                            <p class="p2"><c:out value="${sc.scInfo}"/></p>
                            <div class="img"><c:if test="${sc.scPictureId != null}"><img src="<c:out value="${pageContext.request.contextPath}/${sc.picture.pictureUrl}"/>"></c:if></div>
                            likes<c:out value="${sc.scLike}"/>
                            comments<c:out value="${sc.scComments}"/>
                            message
                            <br>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>
    </div>
-->
</body>
</html>
