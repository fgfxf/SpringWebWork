<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台 -- 范哥范小飞</title>
    <meta name="keywords" content="范哥范小飞">
    <meta name="description" content="小小布吉岛">
    <jsp:include page="layuihtmlHead.jsp" flush="true" ></jsp:include>

</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="layuiHeader.jsp" flush="true" ></jsp:include>
    <jsp:include page="layuiSide.jsp" flush="true" ></jsp:include>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <table class="layui-hide" id="fileListTable" lay-filter="fileListTable"></table>

        </div>
    </div>

        <!-- 底部固定区域 -->
    <jsp:include page="layuiFooter.jsp" flush="true" ></jsp:include>

</div>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="download">下载</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.1"></script>
<script src="<%=request.getContextPath()%>/js/register.base.min.js"></script>
<script src="<%=request.getContextPath()%>/js/register.project.min.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        table.render({
            elem: '#fileListTable'
            ,url:'/admin/getFileList'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,title: '用户数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'id', title:'ID', width:80, fixed: 'left',width:100, sort: true}
                ,{field:'file_name', title:'文件名', width:120}
                ,{field:'file_sql_path', title:'路径', width:350}
                ,{field:'file_size', title:'大小', width:80, /*edit: 'text', */sort: true}
                ,{field:'file_ext', title:'后缀', width:80, sort: true}
                ,{field:'file_time', title:'上传时间',width:130, sort: true}
                ,{field:'file_owner', title:'上传者', width:180, sort: true}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:130}
            ]]
            ,page: true
        });

        //头工具栏事件
        table.on('toolbar(fileListTable)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选');
                    break;

                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(fileListTable)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    $(document).ready(function () {
                        $.ajax({
                            type: "POST",
                            url: "<%=request.getContextPath()%>/admin/deleteFile",
                            dataType: "json",
                            data: {
                                FileID: data["id"]
                            },
                            success: (DateRet) => {
                                if (DateRet.ret == 1) {
                                    layer.alert("已经删除"+DateRet.msg);
                                    obj.del();
                                } else {
                                    layer.alert("删除失败！"+DateRet.msg);
                                }
                            }
                        }
                        )
                    })

                    //JSON.stringify(data);
                    layer.close(index);
                });
            } else if(obj.event === 'download'){
                window.location.href="<%=request.getContextPath()%>/admin/download?FileID="+ data["id"];
            }
        });
    });
</script>

</body>

</html>

