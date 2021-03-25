<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="javascript:;">所有功能</a>
                <dl class="layui-nav-child">
                    <dd <%=(request.getRequestURI().contains("layuiImgUpload"))?"class=\"layui-this\"":""%> ><a href="<%=request.getContextPath()%>/admin/layuiImgUpload">文件上传</a></dd>
                    <dd <%=(request.getRequestURI().contains("layuiUploadList"))?"class=\"layui-this\"":""%> ><a href="<%=request.getContextPath()%>/admin/layuiUploadList">文件列表</a></dd>
                    <dd <%=(request.getRequestURI().contains("layuiUser"))?"class=\"layui-this\"":""%> ><a href="<%=request.getContextPath()%>/admin/User">用户资料</a></dd>
<%--                    <dd><a href="">超链接</a></dd>--%>
                </dl>
            </li>
<%--            <li class="layui-nav-item">--%>
<%--                <a href="javascript:;">解决方案</a>--%>
<%--                <dl class="layui-nav-child">--%>
<%--                    <dd><a href="javascript:;">列表一</a></dd>--%>
<%--                    <dd><a href="javascript:;">列表二</a></dd>--%>
<%--                    <dd><a href="">超链接</a></dd>--%>
<%--                </dl>--%>
<%--            </li>--%>
<%--            <li class="layui-nav-item"><a href="">云市场</a></li>--%>
<%--            <li class="layui-nav-item"><a href="">发布商品</a></li>--%>
        </ul>
    </div>
</div>
