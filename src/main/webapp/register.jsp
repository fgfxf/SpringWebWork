<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="<%=request.getContextPath() %>/ico/favicon.ico">
    <link rel="bookmark" href="<%=request.getContextPath() %>/ico/favicon.ico">

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>入住布吉岛</title>
    <meta name="description" content="入住布吉岛">
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
                        <img src="<%=request.getContextPath()%>/img/2.png">
                    </div>
                    <a href="<%=request.getContextPath()%>/auth/login" class="boardtop-right">
                        <div>登 录</div>
                    </a>
                </div>
                <div class="rowtocol">
                    <div class="auth-row">
                        <div class="form-group-label auth-row">
                            <label class="floating-label" for="name">昵称</label>
                            <input class="form-control maxwidth-auth" id="name" type="text">
                        </div>
                    </div>
                </div>
                <div class="rowtocol">
                    <div class="auth-row">
                        <div class="form-group-label auth-row">
                            <label class="floating-label" for="email">邮箱(唯一凭证请认真对待)</label>
                            <input class="form-control maxwidth-auth" id="email" type="email" maxlength="32" inputmode="email" autocomplete="username">
                        </div>
                    </div>
                </div>
                <div class="rowtocol">
                    <div class="auth-row">
                        <div class="form-group-label auth-row">
                            <label class="floating-label" for="passwd">密码</label>
                            <input class="form-control maxwidth-auth" id="passwd" type="password" autocomplete="new-password">
                            <p id="passwd-strong" style="text-align: left; margin: 3px; font-size: 80%"></p>
                        </div>
                    </div>
                </div>
                <div class="rowtocol">
                    <div class="auth-row">
                        <div class="form-group form-group-label">
                            <label class="floating-label" for="repasswd">重复密码</label>
                            <input class="form-control maxwidth-auth" id="repasswd" type="password" autocomplete="new-password">
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
                        <div class="form-group form-group-label">
                            <label class="floating-label" for="introduce">自我介绍</label>
                            <input class="form-control maxwidth-auth" id="introduce" type="text">
                        </div>
                    </div>
                </div>
                <div class="rowtocol">
                    <div class="btn-auth auth-row">
                        <button id="tos" type="submit" class="btn-reg btn btn-block btn-brand waves-attach waves-light waves-effect">确认注册
                        </button>
                    </div>
                </div>
                <div class="auth-bottom auth-row auth-reg">
                    <div class="tgauth">

                        <p>注册即代表同意<a href="<%=request.getContextPath()%>/#2">服务条款</a>，以及保证所录入信息的真实性，如有不实信息会导致账号被删除。</p>

                    </div>
                </div>
            </div>
        </section>
        <div class="card auth-tg">
            <div class="card-main">

            </div>
        </div>

</div>

<div aria-hidden="true" class="modal modal-va-middle fade" id="tos_modal" role="dialog" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-heading">
                <h2 class="modal-title">注册 TOS</h2>
            </div>
            <div class="modal-inner">
                <ul>
                    <li>请提供真实邮箱，并自行保管。邮箱为用户的唯一凭证。</li>
                    <li>本站会加密存储用户密码，尽量保证数据安全，但并不保证这些信息的绝对安全。</li>
                    <li>禁止使用本站服务进行任何违法恶意活动。</li>
                    <li>使用任何节点，需遵循节点所属国家的相关法律以及中国法律。</li>
                    <li>禁止滥用本站提供的服务。</li>
                    <li>对于免费用户，我们有权在不通知的情况下删除账户。</li>
                    <li>任何违反使用条款的用户，我们将会删除违规账户并收回使用本站服务的权利。</li>
                </ul>            </div>
            <div class="modal-footer">
                <p class="text-right">
                    <button class="btn btn-flat btn-brand-accent waves-attach waves-effect"
                            data-dismiss="modal" type="button" id="cancel">我不同意
                    </button>
                    <button class="btn btn-flat btn-brand-accent waves-attach waves-effect" data-dismiss="modal"
                            id="reg"
                            type="button">我同意
                    </button>
                </p>
            </div>
        </div>
    </div>
</div>

<div aria-hidden="true" class="modal modal-va-middle fade" id="email_nrcy_modal" role="dialog" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-heading">
                <h2 class="modal-title">收不到验证码？</h2>
            </div>
            <div class="modal-inner">
                <ul>
                    <img src="/images/email_nrcy.jpg" height="458" width="468">
                    <br/>
                </ul>
            </div>
            <div class="modal-footer">
                <p class="text-right">
                    <button class="btn btn-flat btn-brand-accent waves-attach waves-effect" data-dismiss="modal"
                            type="button">我知道了
                    </button>
                </p>
            </div>
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


<!-- Google Analytics -->
<script>
    window.ga = window.ga || function () {
        (ga.q = ga.q || []).push(arguments)
    };
    ga.l = +new Date;
    ga('create', 'UA-111801619-3', 'auto');
    var hostDomain = window.location.host || document.location.host || document.domain;
    ga('set', 'dimension1', hostDomain);
    ga('send', 'pageview');

    (function () {
        function perfops() {
            var js = document.createElement('script');
            js.src = 'https://cdn.jsdelivr.net/npm/perfops-rom';
            document.body.appendChild(js);
        }

        if (document.readyState === 'complete') {
            perfops();
        } else {
            window.addEventListener('load', perfops);
        }
    })();
</script>
<script async src="https://www.google-analytics.com/analytics.js"></script>
<!-- End Google Analytics -->

<!-- js -->
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.1"></script>
<script src="<%=request.getContextPath()%>/js/register.base.min.js"></script>
<script src="<%=request.getContextPath()%>/js/register.project.min.js"></script>

</body>
</html>

<script>
    const checkStrong = (sValue) => {
        let modes = 0;
        if (sValue.length < 7) return modes;
        if (/\d/.test(sValue)) modes++;
        if (/[a-z]/.test(sValue)) modes++;
        if (/[A-Z]/.test(sValue)) modes++;
        if (/\W/.test(sValue)) modes++;

        switch (modes) {
            case 1:
                return 1;
                break;
            case 2:
                return 2;
            case 3:
            case 4:
                return sValue.length < 12 ? 3 : 4
                break;
        }
    }

    const showStrong = () => {
        const password = document.getElementById('passwd').value;
        const $passwordStrongEl = document.getElementById('passwd-strong');
        const strong = checkStrong(password);
        if (strong = 0) {
            $passwordStrongEl.innerHTML = '需大于 8 位；推荐使用包含大小写字母、数字、符号的密码';
        } else if (strong = 1) {
            $passwordStrongEl.innerHTML = '你的密码强度为： <span style="color: red; font-weight: bold">非常弱</span>';
        } else if (strong = 2) {
            $passwordStrongEl.innerHTML = '你的密码强度为： <span style="color: red; font-weight: bold">弱</span>';
        } else if (strong = 3) {
            $passwordStrongEl.innerHTML = '你的密码强度为： <span style="color: yellow; font-weight: bold">中等</span>';
        } else if (strong = 4) {
            $passwordStrongEl.innerHTML = '你的密码强度为： <span style="color: green; font-weight: bold">强</span>';
        }
    }

    document.getElementById('passwd').addEventListener('input', checkStrong);
</script>


<script>
    let calltgbtn = document.querySelector('#calltgauth');
    let tgboard = document.querySelector('.card.auth-tg.cust-model');
    if (calltgbtn && tgboard) {
        custModal(calltgbtn, tgboard);
    }
</script>


<script>
    $(document).ready(function () {
        function register() {
            // alert("button");

            document.getElementById("tos").disabled = true;

            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/auth/register",
                dataType: "json",
                data: {
                    email: $$getValue('email'),
                    name: $$getValue('name'),
                    passwd: $$getValue('passwd'),
                    repasswd: $$getValue('repasswd'),
                    wechat: $$getValue('wechat'),
                    imtype: $$getValue('imtype'),
                    introduce: $$getValue('introduce')
                },
                success: (data) => {
                    if (data.ret == 1) {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                        document.getElementById("tos").disabled = false;
                        window.setTimeout("location.href='<%=request.getContextPath()%>/auth/login'", 1200);
                    } else {
                        $("#result").modal();
                        $$.getElementById('msg').innerHTML = data.msg;
                        document.getElementById("tos").disabled = false;
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


        $("#reg").click(function () {
            register();
        });

        $("#tos").click(function () {
            $("#tos_modal").modal();
        });
    })
</script>
</body>
</html>