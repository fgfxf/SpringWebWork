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

            <div class="layui-upload">
                <button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button>
                <div class="layui-upload-list">
                    <table class="layui-table">
                        <thead>
                        <tr><th>文件名</th>
                            <th>大小</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr></thead>
                        <tbody id="demoList"></tbody>
                    </table>
                </div>
                <button type="button" class="layui-btn" id="testListAction">开始上传</button>
<%--                进度条--%>
                <div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="processBar">
                    <div class="layui-progress-bar layui-bg-red" lay-percent="0%" style="width: 100%;"><span class="layui-progress-text">100%</span></div>
                </div>
            </div>
        </div>
    </div>

        <!-- 底部固定区域 -->
    <jsp:include page="layuiFooter.jsp" flush="true" ></jsp:include>

</div>

</body>
<script>
    layui.use('upload', function(){
        var $ = layui.jquery
            ,upload = layui.upload;
        var layjquery = layui.element;
        var element = layui.element;
        //多图片上传
        upload.render({
            elem: '#Imgs'
            ,url: '/admin/upload' //改成您自己的上传接口
            ,multiple: true
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#previewImgs').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
                });
            }
            ,done: function(res){
                //上传完毕
            }
        });
        //多文件列表示例
        var demoListView = $('#demoList')
            ,uploadListIns = upload.render({
            elem: '#testList'
            ,url: '/admin/upload' //改成您自己的上传接口  layupdate.js也要改
            ,accept: '#Img'
            ,multiple: true
            ,auto: false
            ,bindAction: '#testListAction'
            ,before: function(){
                var percent = 0 + '%' //获取进度百分比
                element.progress("processBar", percent);
            }
            ,progress: function(n, elem){
                console.log("上传进度条");
                var percent = n + '%' //获取进度百分比
                element.progress("processBar", percent); //可配合 layui 进度条元素使用
            }
            ,choose: function(obj){
                var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                //读取本地文件
                obj.preview(function(index, file, result){
                    var tr = $(['<tr id="upload-'+ index +'">'
                        ,'<td>'+ file.name +'</td>'
                        ,'<td>'+ (file.size/1024).toFixed(1) +'kb</td>'
                        ,'<td>等待上传</td>'
                        ,'<td>'
                        ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
                        ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
                        ,'</td>'
                        ,'</tr>'].join(''));

                    //单个重传
                    tr.find('.demo-reload').on('click', function(){
                        obj.upload(index, file);
                    });

                    //删除
                    tr.find('.demo-delete').on('click', function(){
                        delete files[index]; //删除对应的文件
                        tr.remove();
                        uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                    });

                    demoListView.append(tr);
                });
            }
            ,done: function(res, index, upload){
                // console.log("上传之后");
                // console.log(res);
                if(res.files.file){ //上传成功

                    var tr = demoListView.find('tr#upload-'+ index)
                        ,tds = tr.children();
                    tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                    tds.eq(3).html(''); //清空操作
                    return delete this.files[index]; //删除文件队列已经上传成功的文件
                }
                this.error(index, upload);
            }
            ,error: function(index, upload){
                // console.log("上传失败");
                var tr = demoListView.find('tr#upload-'+ index)
                    ,tds = tr.children();
                tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
                tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
            }
        });


    });
</script>

</html>

