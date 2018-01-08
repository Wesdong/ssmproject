<%--
  Created by IntelliJ IDEA.
  User: lwdky
  Date: 2017/12/12
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>马上开始SChicken吧！</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/startplay.css">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="menu">
    <img src="${pageContext.servletContext.contextPath}/resources/img/dog.png">
</div>
<div id="wrap">
    <div id="left">
        <div id="left1">
            <p1>很高兴你来到这儿，${user.userRealname}</p1>
        </div>
        <div id="left2">
            <p>现在你可以去你的主页里分享你今天的心情。</p>
            <p>可以和感兴趣的博主一起聊天。</p>
            <p>可以对有趣的文章进行点赞、评论。</p>
            <p></p>&nbsp;&nbsp;
            <p>祝愿你使用愉快！</p>
        </div>
        <a href="/ssm/mainpage.do" class="button">我们开始吧</a>
    </div>
    <div id="right">
        <ul>
            <li><img src="${pageContext.servletContext.contextPath}/resources/img/drive.jpg" alt="" class="image1"></li>
            <li><img src="${pageContext.servletContext.contextPath}/resources/img/football.jpg" alt="" class="image2"></li>
            <li><img src="${pageContext.servletContext.contextPath}/resources/img/dj.jpg" alt="" class="image3"></li>
            <li><img src="${pageContext.servletContext.contextPath}/resources/img/movie.jpg" alt="" class="image4"></li>
        </ul>
    </div>
</div>

</body>
</html>

