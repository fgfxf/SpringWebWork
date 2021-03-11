<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台 -- 范哥范小飞</title>
    <meta name="keywords" content="范哥范小飞">
    <meta name="description" content="小小布吉岛">
    <jsp:include page="layuihtmlHead.jsp" flush="true" ></jsp:include>
    <script>
        //JavaScript代码区域
        layui.use('element', function(){
            var element = layui.element;

        });
        layui.use('layjquery', function(){
            var layjquery = layui.element;

        });
    </script>
    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "/js/hm.js";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>

</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="layuiHeader.jsp" flush="true" ></jsp:include>
    <jsp:include page="layuiSide.jsp" flush="true" ></jsp:include>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            内容主体区域

            <br><br>

            <blockquote class="layui-elem-quote">
                注意：该页面只是简单的后台布局示例，并不是一整套后台系统方案，您可以关注 layui 官方提供后台模板解决方案：
                <a href="https://www.layui.com/admin/" target="_blank" class="layui-btn layui-btn-danger">layuiAdmin</a>
            </blockquote>

            <blockquote class="layui-elem-quote">
                layui 之所以赢得如此多人的青睐，更多是在于它“前后台系统通吃”的能力。既可编织出绚丽的前台页面，又可满足繁杂的后台功能需求。
                <br>layui 后台布局， 致力于让每一位开发者都能轻松搭建自己的后台模板。
            </blockquote>

            <a href="/doc/element/layout.html#admin" target="_blank" class="layui-btn layui-btn-lg">获取该布局代码</a>

            <br><br><br><br>




            下面是充数内容，为的是出现滚动条<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>
        </div>
    </div>

        <!-- 底部固定区域 -->
    <jsp:include page="layuiFooter.jsp" flush="true" ></jsp:include>

</div>

</body>
</html>

