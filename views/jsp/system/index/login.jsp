<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=11">
<head>
    <title>登录</title>
    <%@ include file="./headcss.jsp" %>
    <link rel="shortcut icon" href="<%=basePath%>static/source/public/images/32.png" type="image/x-icon"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/source/public/css/login.css"/>
    <style></style>
</head>
<body class="hidden">
<div class="loginbody">
    <div class="earthbg">
        <img class="wh100" src="<%=basePath%>static/source/public/images/earth.png"/>
    </div>

    <div class="mapbg"></div>
    <div class="loginBox">
        <div class="input-group">
            <i class="icon iconfont icon-yonghu fl"></i>
            <input class="login-input fl " id="user" placeholder="用户名" maxlength="20"/>
        </div>
        <div class="input-group">
            <i class="icon iconfont icon-mima fl"></i>
            <input class="login-input fl" id="password" placeholder="密码" type="password" maxlength="20"/>
        </div>
        <div class="login-btn" id="login">登&nbsp;&nbsp;录</div>
    </div>
</div>
<%@ include file="./foot.jsp" %>

<script color="255,255,255" opacity='0.6' zIndex="0" count="120" src="<%=basePath%>static/source/public/js/canvas-nest.js"></script>


<script type="text/javascript">

    var resize4win = LLW.later(function () {
        var $win, $box, $bg, winsize, loginsize, bgsize;
        $win = $(window);
        $box = $('.loginBox');
        $bg = $('.mapbg');
        winsize = {
            w: $win.width(),
            h: $win.height()
        };
        loginsize = {
            w: $box.width(),
            h: $box.height()
        };
        bgsize = {
            w: $bg.width(),
            h: $bg.height()
        };
        if ('undefined' === typeof resize4win.FIRST) {
            $box.css({
                top: (winsize.h / 2 - loginsize.h / 2) + 'px',
                left: (winsize.w / 2 - loginsize.w / 2) + 'px'
            });
            $bg.css({
                top: (winsize.h / 2 - bgsize.h / 2) + 'px',
                left: (winsize.w / 2 - bgsize.w / 2) + 'px'
            });
            $('body').removeClass('hidden');
            $('#user').focus();
            resize4win.FIRST = true;
        } else {
            $box.animate({
                top: (winsize.h / 2 - loginsize.h / 2) + 'px',
                left: (winsize.w / 2 - loginsize.w / 2) + 'px'
            }, 150);
            $bg.animate({
                top: (winsize.h / 2 - bgsize.h / 2) + 'px',
                left: (winsize.w / 2 - bgsize.w / 2) + 'px'
            }, 150);
        }
    }, 300);

    //避免频繁提交登录
    function isdoing(issubmit) {
        if (true === issubmit) {
            if (true === isdoing.BUSY) {
                return true;
            }
            $('#login').text('登录中...');
            isdoing.BUSY = true;
            return false;
        } else {
            $('#login').text('登录');
            isdoing.BUSY = false;
            return false;
        }
    }

    $(function () {
        var layer = layui.layer;
        $("#login").on("click", function () {
            login(user, password);
        });
        $('#user,#password').on('keyup', function (e) {
            var ev = e || window.event;
            if (13 === ev.keyCode) {
                login(user, password);
            }
        });

        //服务叫校验
        function login(user, password) {
            var $user = $("#user");
            var $password = $("#password");
            var user = $user.val();
            var password = $password.val();
            if (user == "") {
                layer.tips('账号不能为空', $user);
                return
            }
            if (password == "") {
                layer.tips('密码不能为空', $user);
                return
            }
            //通过前端校验"src/main/webapp/views/jsp/system/index/headcss.jsp"
            if (isdoing(true)) {
                return;
            }

            var code = user + ",fh," + password;
            $.post("<%=basePath%>/login_login", {KEYDATA: code, tm: new Date().getTime()}, function (data) {
                if (data.result == "usererror") {
                    isdoing(false);
                    layer.msg("登陆失败,用户名或密码错误！", {icon: 2});
                } else if(data.result =="error"){
                	isdoing(false);
                    layer.msg("登陆失败,缺少参数！", {icon: 2});
                }else if (data.result == "success") {
                    window.location.href = "<%=basePath%>main/index";
                }else{
                	isdoing(false);
                    layer.msg("服务器繁忙，登陆失败！", {icon: 2});
                }
            })
        }

        $(window).resize(resize4win);       //自适应居中
        resize4win();
    })

</script>
</body>
</html>
