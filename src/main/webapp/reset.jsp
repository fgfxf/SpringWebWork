<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="<%=request.getContextPath() %>/ico/favicon.ico">
    <link rel="bookmark" href="<%=request.getContextPath() %>/ico/favicon.ico">

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>补办房产证</title>
    <meta name="description" content="布吉岛房产登记处">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/register.base.min.css">
    <link href="<%=request.getContextPath()%>/css/project.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/auth.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/css" rel="stylesheet">

    <style>
        *{padding:0;margin:0;}
    </style>
</head>
<body class="page-brand">


<!-- 版权底部 -->
<jsp:include page="footer.jsp" flush="true" ></jsp:include>
<!-- 版权结束 -->

<div class="authpage auth-reg">
    <div class="container">
        <section class="content-inner">
            <div class="auth-main auth-row">
                <div class="auth-top auth-row">
                    <a class="boardtop-left" href="<%=request.getContextPath()%>/">
                        <div>首 页</div>
                    </a>
                    <div class="auth-logo">
                        <img src="<%=request.getContextPath()%>/img/9.png">
                    </div>
                    <a href="<%=request.getContextPath()%>/auth/login" class="boardtop-right">
                        <div>登 录</div>
                    </a>
                </div>

                <div class="rowtocol">
                    <div class="auth-row">
                        <div class="form-group-label auth-row">
                            <label class="floating-label" for="email">邮箱</label>
                            <input class="form-control maxwidth-auth" id="email" type="email" maxlength="32" inputmode="email" autocomplete="username">
                        </div>
                    </div>
                </div>
                <div class="rowtocol">
                    <div class="auth-row">
                        <div class="form-group form-group-label dropdown">
                            <label class="floating-label" for="imtype">选择您的联络方式</label>
                            <button class="form-control maxwidth-auth" id="imtype" data-toggle="dropdown">

                            </button>
                            <ul class="dropdown-menu" aria-labelledby="imtype">
                                <li><a href="#" class="dropdown-option" onclick="return false;" val="1"
                                       data="imtype">微信</a></li>
                                <li><a href="#" class="dropdown-option" onclick="return false;" val="2"
                                       data="imtype">QQ</a></li>
                                <li><a href="#" class="dropdown-option" onclick="return false;" val="3"
                                       data="imtype">Facebook</a></li>
                                <li><a href="#" class="dropdown-option" onclick="return false;" val="4"
                                       data="imtype">Telegram</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="rowtocol">
                    <div class="auth-row">
                        <div class="form-group form-group-label">
                            <label class="floating-label" for="wechat">在这输入联络方式账号</label>
                            <input class="form-control maxwidth-auth" id="wechat" type="text">
                        </div>
                    </div>
                </div>
                <div class="rowtocol">
                    <div class="auth-row">
                        <div class="form-group-label auth-row">
                            <label class="floating-label" for="passwd">新的密码</label>
                            <input class="form-control maxwidth-auth" id="passwd" type="password" autocomplete="new-password">
                            <p id="passwd-strong" style="text-align: left; margin: 3px; font-size: 80%"></p>
                        </div>
                    </div>
                </div>


                <div class="rowtocol">
                    <div class="btn-auth auth-row">
                        <button id="reset" type="submit" class="btn-reg btn btn-block btn-brand waves-attach waves-light waves-effect">找回密码
                        </button>
                    </div>
                </div>
            </div>
        </section>
        <div class="card auth-tg">
            <div class="card-main">

            </div>
        </div>

</div>



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
<!--
I'm glad you use this theme, the development is no so easy, I hope you can keep the copyright, I will thank you so much.
It will not impact the appearance and can give developers a lot of support :)

很高兴您使用并喜欢该主题，开发不易 十分谢谢与希望您可以保留一下版权声明。它不会影响美观并可以给开发者很大的支持和动力。 :)
-->

<!-- js -->
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.1"></script>
<script src="<%=request.getContextPath()%>/js/register.base.min.js"></script>
<script src="<%=request.getContextPath()%>/js/register.project.min.js"></script>



<script>
    let calltgbtn = document.querySelector('#calltgauth');
    let tgboard = document.querySelector('.card.auth-tg.cust-model');
    if (calltgbtn && tgboard) {
        custModal(calltgbtn, tgboard);
    }
</script>


<script>
    $(document).ready(function () {
        function reset() {
            // alert("button");

            document.getElementById("reset").disabled = true;

            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/auth/reset",
                dataType: "json",
                data: {
                    email: $$getValue('email'),
                    passwd: $$getValue('passwd'),
                    wechat: $$getValue('wechat'),
                    imtype: $$getValue('imtype')
                },
                success: (data) => {
                    if (data.ret == 1) {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                        document.getElementById("reset").disabled = false;
                        window.setTimeout("location.href='<%=request.getContextPath()%>/auth/login'", 1200);
                    } else {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                        document.getElementById("reset").disabled = false;
                    }
                }
                <%--error: (jqXHR) => {--%>
                <%--    $("#msg-error").hide(10);--%>
                <%--    $("#msg-error").show(100);--%>
                <%--    $$.getElementById('msg-error-p').innerHTML = `发生错误：${--%>
                <%--                jqXHR.status--%>
                <%--                }`;--%>
                <%--    document.getElementById("tos").disabled = false;--%>
                <%--}--%>
            });
        }

        $("html").keydown(function (event) {
            if (event.keyCode == 13) {
                $("#tos_modal").modal();
            }
        });


        $("#reset").click(function () {
            reset();
        });

        $("#tos").click(function () {
            $("#tos_modal").modal();
        });
    })
</script>
</body>
</html>