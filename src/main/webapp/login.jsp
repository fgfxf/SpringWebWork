<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="<%=request.getContextPath() %>/ico/favicon.ico">
    <link rel="bookmark" href="<%=request.getContextPath() %>/ico/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>上岸布吉岛</title>
    <meta name="description" content="登陆布吉岛">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.style.css">
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.1"></script>
    <script src="<%=request.getContextPath()%>/js/register.base.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/register.project.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/register.base.min.css">
    <link href="<%=request.getContextPath()%>/css/project.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/auth.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/css" rel="stylesheet">
    <style>
        *{padding:0;margin:0;}
    </style>
</head>
<body>
<jsp:include page="footer.jsp" flush="true" ></jsp:include>

<div class="overlay" style="display: none;"></div>

<!-- Scripts -->

<div class="container">
    <div class="loginBox">
        <div class="userImage">
            <img src="<%= request.getContextPath() %>/img/8.png">
        </div>
        <form id="loginForm">
            <div class="input-wrapper">
                <label>邮箱:</label>
                <input type="email" name="email" id="email" placeholder="请输入邮箱">
                <div class="error-email" style="display: none;"><div class="email-msg"></div><div class="triangle"></div></div>
            </div>
            <div class="input-wrapper">
                <label>密码:</label>
                <input type="password" name="password" id="password" placeholder="密码">
                <div class="error-pass" style="display: none;"><div class="pass-msg"></div><div class="triangle"></div></div>
            </div>
            <input type="button" name="" id="login" value="登录">
        </form>
        <a href="<%=request.getContextPath()%>/auth/reset">忘记密码？</a>
        <div class="from-line"></div>
        <div class="tiphidden"></div>

        <div aria-hidden="true" class="modal modal-va-middle fade" id="result" role="dialog" tabindex="-1">
            <div class="modal-dialog modal-xs">
                <div class="modal-content">
                    <div class="modal-inner">
                        <p class="h5 margin-top-sm text-black-hint" id="msg"></p>
                    </div>
                    <div class="modal-footer">
                        <p class="text-right">
                            <button class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal" type="button"
                                    id="result_ok">知道了
                            </button>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <a href="<%=request.getContextPath()%>/auth/register" class="move-signup a-tag tran blue-border">还没有帐号？免费注册<i class="iconfont tran"></i></a>
    </div>
</div>
<div class="confirmation showOk" style="display: none;">
    <img src="<%=request.getContextPath()%>/img/gato.jpg">
</div>
<%--<script src="./jquery.min.js"></script>--%>
<div id="bg"></div>

<script>
    // 错误展示
    $(".error-pass, .error-email").hide();
    $(".overlay").hide();
    $(".confirmation").hide();
    var $$getValue = (elementId) => document.getElementById(elementId).value;
    // 检查邮件
    function checkEmail(email) {
        var emailReg = /^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
        return emailReg.test(email);
    }
    // 登录按钮相应
    $(document).ready(function () {
        function login() {
            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/auth/login",
                dataType: "json",
                data: {
                    email: $$getValue('email'),
                    password: $$getValue('password')
                },
                success: (data) => {
                    if (data.ret == 1) {
                        window.setTimeout("location.href='<%=request.getContextPath()%>/admin/layuiAdmin'", 1200);
                    } else {
                        $("#result").modal();
                        document.getElementById('msg').innerHTML = data.msg; //报错
                        $(".confirmation").hide();
                        $(".overlay").hide();
                    }
                }
            });
        }

        $("#login").click(function () {
            //登录按钮入口
            var countErrors = 0;
            var emailInput = $("input[type=email]");
            var passInput = $("input[type=password]");

            if(!checkEmail($(emailInput).val())) {
                $(".error-email").fadeIn();
                $(".email-msg").html("请输入正确的邮箱");
                $(emailInput).addClass("warning");
                countErrors++;
            } else {
                $(emailInput).removeClass("warning");
            }

            if(passInput.val().length < 6) {
                $(".error-pass").fadeIn();
                $(".pass-msg").html("密码必须至少有6个字符");
                $(passInput).addClass("warning");
                countErrors++;
            } else {
                $(passInput).removeClass("warning");
            }

            setTimeout(function showErrorMsg() {
                $(".error-email, .error-pass").fadeOut();
            }, 2000)

            if(countErrors === 0) {
                $(".overlay").show();
                $(".confirmation").show();
                login();
            }
        });

    })
</script>
</body>  <!-- 版权底部 -->
<!-- BG -->

<!-- 版权结束 --></html>