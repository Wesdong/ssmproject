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
    <script>
        $(function(){

            $('.detail').on('click', function(event) {
                clear();
                $('.content').css('background', '#B6A2DE');
                var lable = $('#title01').text();
                var content = $('.text02').text();
                $('#myModalLabel').html(lable);
                $('#line01').html(lable);
                $('#line02').html(content);

            });})
        function clear(){
            $('#line01').html('');
            $('#line02').html('');
        }
    </script>
</head>
<body>
<div class="menu">
    <ul>
        <li><a href="/ssm/mainpage.do">主页</a></li>
        <li><a href="/ssm/visit.do">游客</a></li>
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
        <c:forEach var="sc" items="${sclist.list}">
            <div class="detail" data-toggle="modal" data-target="#myModal">
                <div class="img1"><img src="<c:out value="${pageContext.request.contextPath}/${sc.userinfo.userinfoPicurl}"/>"></div>
                <div class="text"><p><font class="name1"><c:out value="${sc.user.userRealname}"/></font></p>
                    <font class="name2">@<c:out value="${sc.user.userAccount}"/></font></div>
                <p class="p"><c:out value="${sc.scInfo}"/></p>
                <div class="img"><img src="<c:out value="${pageContext.request.contextPath}/${sc.picture.pictureUrl}"/>"></div>
                likes<c:out value="${sc.scLike}"/>
                comments<c:out value="${sc.scComments}"/>
                message
                <br>
            </div>
        </c:forEach>
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">

                </h4>
            </div>
            <div class="modal-body">
                <div class="content" >
                    <div id="line01" class="text01"></div>
                    <div id="line02" class="text02"></div>

                </div>
            </div>
</body>
</html>
