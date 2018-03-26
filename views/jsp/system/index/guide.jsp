<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<html>
<head>
    <title>导航</title>
    <meta http-equiv="X-UA-Compatible" content="IE=11">
    <link rel="shortcut icon" href="${basePath}/static/source/public/images/32.png" type="image/x-icon" />
    <%@ include file="./headcss.jsp"%>
</head>
<body>
    <div class="guide">
        <img class="guide-bg" src="<%=basePath%>static/source/public/images/guide.jpg" />
        <div class="guide-box"/>
            <form action="login_toLogin.do" name="form1" id="form1" method="post">
                <!-- <button type="submit" class="btn" id="login">进&nbsp;&nbsp;入</button> -->
            </form>
        </div>
        <div class="guide-loading"></div>
    </div>

    <%@ include file="./foot.jsp"%>
    <script type="text/javascript">
        $(function(){
            // layer.load(2);
           $('.guide').on('click', function(){
               console.log($.browserType())
               if($.browserType() != false){
                   selectionType($.browserType())
               }else{
                   $('#form1').submit();
               }
            });


            setTimeout(function(){
               //$('#form1').submit();
                if($.browserType() != false){
                    selectionType($.browserType())
                }else{
                    $('#form1').submit();
                }

            }, 3000);

        });
        //根据浏览器的不同做不同的操作
        function selectionType(str){
           if(str == "IE11" ){
               $('#form1').submit();
           }else{
               window.location.href="<%=basePath%>to_iedownload" ;
           }

        }
    </script>

</body>
</html>