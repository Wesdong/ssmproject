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
<body style="background-color:#f2f2f2">
    <!--顶部条-->

    <div class="menu">
        <ul>
            <li><a href="/ssm/mainpage.do" >主页</a></li>
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
            <div class="right1">
                <input type="text" id="toggle" placeholder="有什么SChicken?"><img src="">

            </div>
            <div id="content" style="display: none;">
                <div class="rightwhite">撰写新SChicken <button onclick="displaysendsc()"></button></div>
                <div class="rightinput">
                    <form method="post" action="/ssm/sendsc.do" enctype="multipart/form-data">
                    <input type="text" name="scinfo" class="sc" placeholder="有什么SChicken?"/>
                    <c:if test="${user.userinfo.userinfoVip == 1}">
                        <input type="file" name="scimg" class="file" />
                    </c:if>
                    <input type="submit" class="button3" value="发送">
                </form>
                </div>
            </div>
            <!--微博体-->
            <div>
                <c:if test="${followsSC != null}">
                    <c:forEach var="sc" items="${followsSC}">
                        <div class="detail1" data-toggle="modal" data-target="#myModal1">
                            <div class="img1"><img src="<c:out value="${pageContext.request.contextPath}/${sc.userinfo.userinfoPicurl}"/>"></div>
                            <div class="text1"><p><font class="name1"><c:out value="${sc.user.userRealname}"/></font></p>
                        <c:if test="${user.userinfo.userinfoVip == 1}">
                            V
                        </c:if>
                                <font class="name2">@<c:out value="${sc.user.userName}"/></font></div>
                            <p class="p1"><c:out value="${sc.scInfo}"/></p>
                            <div class="img"><c:if test="${sc.scPictureId != null}"><img src="<c:out value="${pageContext.request.contextPath}/${sc.picture.pictureUrl}"/>"></c:if></div>
                        <a name href="">likes<font name="likescount"><c:out value="${sc.scLike}"/></font></a>
                        comments<c:out value="${sc.scComments}"/>
                        message
                        <br>
                        </div>
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
        <p><div class="test1">你是否想发图文微博</div></p>
        <a href="" class="button1" data-toggle="modal" data-target="#myModal">立刻成为VIP SChicken</a>
    </div>

    </div>


    </div>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">立刻成为vip Schicken</h4>
                </div>
                <div class="modal-body">
                    <div class="payword"><p>vip价格:5$/月</p></div>
                    <div class="pay"><img src="${pageContext.servletContext.contextPath}/resources/img/pay.png"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">考虑一下</button>
                    <button type="button" class="btn btn-primary">我已付款</button>
                </div>
            </div>
        </div>
    </div>



    <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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

</body>
</html>
