<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>范哥范小飞的小小布吉岛～</title>
    <meta name="keywords" content="范哥范小飞">
    <meta name="description" content="小小布吉岛">
    <link rel="shortcut icon" href="<%=request.getContextPath() %>/ico/favicon.ico">
    <link rel="bookmark" href="<%=request.getContextPath() %>/ico/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css">

    <noscript>
        <link rel="stylesheet" href="<%=request.getContextPath() %>/css/noscript.css"/>
    </noscript>
    <link href="https://cdn.jsdelivr.net/npm/nprogress@0.2.0/nprogress.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/nprogress@0.2.0/nprogress.min.js"></script>
</head>

<body class="">

<div id="wrapper">
    <!--首页开始-->
    <header id="header" style="display: flex;">
        <img src="<%=request.getContextPath() %>/img/10.png" class="logo">
<%--        <div class="logo">--%>
<%--            <span class="icon fa-rocket"></span>--%>
<%--        </div>--%>
        <div class="content">
            <div class="inner">
                <h1>百慕大里的小小布吉岛～</h1>
                <!--
                如果想自定义文本请删除下面这段script代码,格式为
                <p>自定义文本</p>
                -->
                <p>带更多的人来小小布吉岛看大大世界吧～</p>
            </div>
        </div>
        <nav>
            <ul>
                <li><a href="<%=request.getContextPath() %>/#1">简介</a></li>
                <li><a href="<%=request.getContextPath() %>/auth/login">登录</a></li>
                <li><a href="<%=request.getContextPath() %>/auth/register">注册</a></li>
                <li><a href="<%=request.getContextPath() %>/#2">服务条款</a></li>
            </ul>
        </nav>

    </header>
    <!--首页结束-->
    <div id="main" style="display: none;">
        <!--标签1开始-->
        <article id="1" class="" style="display: none;">
            <h2 class="major">简介</h2>
            <p>范哥范小飞的小小布吉岛</p>
            <div class="close">Close</div></article>
        <article id="2" class="" style="display: none;">
            <h2 class="major">服务条款</h2>
            <p>请提供真实邮箱，并自行保管。邮箱为用户的唯一凭证。<br>
                · 本站会加密存储用户密码，尽量保证数据安全，但并不保证这些信息的绝对安全。<br>
                · 禁止使用本站服务进行任何违法恶意活动。<br>
                · 使用任何节点，需遵循节点所属国家的相关法律以及中国法律。<br>
                · 禁止滥用本站提供的服务。<br>
                · 对于免费用户，我们有权在不通知的情况下删除账户。<br>
                · 任何违反使用条款的用户，我们将会删除违规账户并收回使用本站服务的权利。<br></p>
            <div class="close">Close</div></article>
        <!--
        简介修改示例:
        <p>123</p>
        一个 <p>123</p> 为一行，请不要删除 </article>
        -->
        <!--标签4开始-->
<%--        <article id="4" style="display: none;">--%>
<%--            <h2 class="major">联系我们</h2>--%>
<%--            <ul class="icons">--%>
<%--                <p>此处填写联系方式</p>--%>
<%--                <li>--%>
<%--                    <a target="_blank" href="https://v2.bujidao.org/#" class="icon fa-facebook">--%>
<%--                        <!-- 请在 fontawesome.com 寻找替换图标 href 替换链接 -->--%>
<%--                        <span class="label">Facebook</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--            <div class="close">Close</div></article>--%>
<%--      --%>
        <!--全部标签结束-->

    </div>
    <!-- 版权底部 -->
    <jsp:include page="footer.jsp" flush="true" ></jsp:include>
    <!-- 版权结束 -->
</div>
<!-- BG -->
<div id="bg"></div>
<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.11.3"></script>
<script src="https://cdn.jsdelivr.net/gh/ajlkn/skel@3.0.1/dist/skel.min.js"></script>
<script src="<%=request.getContextPath() %>/js/util.js"></script>
<script src="<%=request.getContextPath() %>/js/main.js"></script>


<!-- 進度條 -->
<script>

    $(function () {
        $(window).load(function () {
            NProgress.done();
        });
        NProgress.set(0.0);
        NProgress.configure({showSpinner: false});
        NProgress.configure({minimum: 0.4});
        NProgress.configure({easing: 'ease', speed: 1200});
        NProgress.configure({trickleSpeed: 200});
        NProgress.configure({trickleRate: 0.2, trickleSpeed: 1200});
        NProgress.inc();
        $(window).ready(function () {
            NProgress.start();
        });
    });


</script>




</body></html>