<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="layui-header">
    <div class="logo"><a href="/admin/layuiAdmin">
        <img src="<%=request.getContextPath()%>/img/Layui.png" alt="layui">
    </a></div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
        <li class="layui-nav-item"><a href="/admin/layuiAdmin">控制台</a></li>
<%--        <li class="layui-nav-item"><a href="">商品管理</a></li>--%>
<%--        <li class="layui-nav-item"><a href="">用户</a></li>--%>
<%--        <li class="layui-nav-item">--%>
<%--            <a href="javascript:;">其它系统</a>--%>
<%--            <dl class="layui-nav-child">--%>
<%--                <dd><a href="">邮件管理</a></dd>--%>
<%--                <dd><a href="">消息管理</a></dd>--%>
<%--                <dd><a href="">授权管理</a></dd>--%>
<%--            </dl>--%>
<%--        </li>--%>
    </ul>
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" class="layui-nav-img">
                <%=request.getSession().getAttribute("username") %>
            </a>
            <dl class="layui-nav-child">
                <dd><a href="">基本资料</a></dd>
                <dd><a href="">安全设置</a></dd>
                <dd><a href="<%=request.getContextPath()%>/auth/logout" >退出</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a><%=request.getSession().getAttribute("introduce")%></a></li>
    </ul>
</div>