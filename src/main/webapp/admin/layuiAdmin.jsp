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
        <div style="padding: 40px;">


<%--            <br><br>--%>

<%--            <blockquote class="layui-elem-quote">--%>
<%--                注意：该页面只是简单的后台布局示例，并不是一整套后台系统方案，您可以关注 layui 官方提供后台模板解决方案：--%>
<%--                <a href="https://www.layui.com/admin/" target="_blank" class="layui-btn layui-btn-danger">layuiAdmin</a>--%>
<%--            </blockquote>--%>

<%--            <blockquote class="layui-elem-quote">--%>
<%--                layui 之所以赢得如此多人的青睐，更多是在于它“前后台系统通吃”的能力。既可编织出绚丽的前台页面，又可满足繁杂的后台功能需求。--%>
<%--                <br>layui 后台布局， 致力于让每一位开发者都能轻松搭建自己的后台模板。--%>
<%--            </blockquote>--%>

<%--            <a href="/doc/element/layout.html#admin" target="_blank" class="layui-btn layui-btn-lg">获取该布局代码</a>--%>

<%--            <br><br><br><br>--%>




<%--            下面是充数内容，为的是出现滚动条<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>--%>
            <div class="layui-carousel" id="test10">
                <div carousel-item="">
                    <div><img src="http://img.iknow.bdimg.com/zhidaoribao2014/2015year/0120/jctj.jpg?t=1561651669"></div>
                    <div><img src="http://img.iknow.bdimg.com/zhidaoribao2014/2015year/0120/jctj.jpg?t=1561651669"></div>
                    <div><img src="https://dfzximg01.dftoutiao.com/news/20210324/20210324093854_c3a647db089eb73b25fce5d56718bab3_2.jpeg"></div>
                    <div><img src="http://img.iknow.bdimg.com/zhidaoribao2014/2015year/0120/jctj.jpg?t=1561651669"></div>
                    <div><img src="http://img.iknow.bdimg.com/zhidaoribao2014/2015year/0120/jctj.jpg?t=1561651669"></div>
                    <div><img src="http://img.iknow.bdimg.com/zhidaoribao2014/2015year/0120/jctj.jpg?t=1561651669"></div>
                    <div><img src="http://img.iknow.bdimg.com/zhidaoribao2014/2015year/0120/jctj.jpg?t=1561651669"></div>
                </div>
            </div>

        </div>
    </div>

        <!-- 底部固定区域 -->
    <jsp:include page="layuiFooter.jsp" flush="true" ></jsp:include>

</div>

</body>
<script>
    layui.use(['carousel', 'form'], function(){
        var carousel = layui.carousel
            ,form = layui.form;

        //图片轮播
        carousel.render({
            elem: '#test10'
            ,width: '778px'
            ,height: '440px'
            ,interval: 1800
        });

        var $ = layui.$, active = {
            set: function(othis){
                var THIS = 'layui-bg-normal'
                    ,key = othis.data('key')
                    ,options = {};

                othis.css('background-color', '#5FB878').siblings().removeAttr('style');
                options[key] = othis.data('value');
                ins3.reload(options);
            }
        };

        //监听开关
        form.on('switch(autoplay)', function(){
            ins3.reload({
                autoplay: this.checked
            });
        });

        $('.demoSet').on('keyup', function(){
            var value = this.value
                ,options = {};
            if(!/^\d+$/.test(value)) return;

            options[this.name] = value;
            ins3.reload(options);
        });
        //其它示例
        $('.demoTest .layui-btn').on('click', function(){
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });
    });
</script>
</html>

