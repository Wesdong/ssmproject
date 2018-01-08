<%--
  Created by IntelliJ IDEA.
  User: lwdky
  Date: 2017/12/19
  Time: 1:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>SChicken搜索</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/search.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript" src="jquery-1.9.1.min.js"></script>
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
    $(function() {
        $("#toggle").click(function() {
            $(this).text($("#content").is(":hidden") ? "收起" : "展开");
            $("#content").slideToggle();
        });
    });
    function displaysendsc() {
        var sendsc = document.getElementById("content");
        sendsc.style.display = "none";
    }

</script>
<body>
<div class="menu">
    <ul>
        <li><a href="/ssm/mainpage.do">主页</a></li>
        <li><a href="/ssm/message.do">私信</a></li>
    </ul>
    <img src="${pageContext.servletContext.contextPath}/resources/img/dog.png">
    <form method="get" action="/ssm/search.do">
        <input type="text" name="what2search" class="a">
        <input type="submit" value="搜索" class="b">
    </form>
</div>
<div class="wrap">
    <div class="main">
        <form action="/ssm/searchUser.do" method="get">
            <p>想要搜索的是用户?</p>
            <input type="text" name="what2search">
            <input type="submit" value="搜索">
        </form>
        <c:forEach var="sc" items="${sclist.list}">

            <div class="detail1">
                <div  data-toggle="modal" data-target="#myModal">
                <div class="img1"><img src="<c:out value="${pageContext.request.contextPath}/${sc.userinfo.userinfoPicurl}"/>"></div>
                <div class="text1"><p><font class="name1"><c:out value="${sc.user.userRealname}"/></font></p>
                    <c:if test="${user.userinfo.userinfoVip == 1}">
                        V
                    </c:if>
                    <font class="name2">@<c:out value="${sc.user.userAccount}"/></font></div>
                <p class="p1"><c:out value="${sc.scInfo}"/></p>
                <div class="img"><c:if test="${sc.scPictureId != null}"><img src="<c:out value="${pageContext.request.contextPath}/${sc.picture.pictureUrl}"/>"></c:if></div></div>
                <div class="line">
                    <ul>
                        <li><a href="/ssm/likes.do?scId=${sc.scId}">likes<font><c:out value="${sc.scLike}"/></font></a></li>
                        <li data-toggle="modal" data-target="#myModal1" id="toggle" >comments<c:out value="${sc.scComments}"/></li>
                        <li >message</li>
                    </ul>
                </div>

                <br>
            </div>
        </c:forEach>
    </div>
    <!--评论区-->
    <div id="content" style="display: none;">
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
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-body">

                <c:forEach var="sc" items="${sclist.list}">

                    <div class="detail2" >
                       <div data-toggle="modal" data-target="#myModal">
                        <div class="img2"><img src="<c:out value="${pageContext.request.contextPath}/${sc.userinfo.userinfoPicurl}"/>"></div>
                        <div class="text2"><p><font class="name3"><c:out value="${sc.user.userRealname}"/></font></p>
                            <font class="name4">@<c:out value="${sc.user.userAccount}"/></font></div>
                        <p class="p2"><c:out value="${sc.scInfo}"/></p>
                        <div class="img"><img src="<c:out value="${pageContext.request.contextPath}/${sc.picture.pictureUrl}"/>"></div></div>
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



</body>
</html>
