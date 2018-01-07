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
<body style="background-color:#f2f2f2">
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
    <div class="wrap">
        <div class="right">
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

        </div>
    <div class="left">
        <div class="left1">
       <div class="blueline"></div>
            <div class="whiteline">
                <p><font class="name1">${user.userRealname}</font></p>
                <p><font class="name2">@${user.userName}</font></p>
            </div>
            <div class="whiteline1">
                <ul>
                    <li><a href="">推文</a><font class="number1" >${SCs}</font></li>
                    <li><a href="/ssm/follow.do">正在关注</a><font class="number2">${follows}</font></li>
                    <li><a href="/ssm/fans.do">关注者</a><font class="number3">${fans}</font></li>
                </ul>
            </div>


            <div class="circle"><img src="${user.userinfo.userinfoPicurl}"/></div>
        </div>
    <!--注销-->
    <div class="left2">
        <p><a href="/ssm/logout.do" class="button">注销</a></p>
        <p><font class="text1">你是否想发图文微博</font></p>
        <a href="" class="button1" data-toggle="modal" data-target="#myModal">立刻成为VIP SChicken</a>
    </div>
        <div>
            <p>立刻成为vip Schicken</p>
            <p>vip价格:5$/月</p>
            <img src="${pageContext.servletContext.contextPath}/resources/img/pay.png">
            <button>我已付款</button>
        </div>

    </div>


    </div>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
