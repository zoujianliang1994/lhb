﻿﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html >
<head>
	<title>鱼骨图</title>
	<meta http-equiv="X-UA-Compatible" content="IE=11">
	<base href="<%=basePath%>">
	<!-- jsp文件头和头部 -->
	<%@ include file="./headcss.jsp"%>
</head>
<body class="hidden">
<div class="fishmodules layui-container">
	<div class="layui-row layui-col-space10">
		<div class="layui-col-xs3 text-center">
			<a class="moduleitem" title="老年人口信息管理" href="javascript:void(0);">
				<!-- <div class="ico ico-user"></div> -->
				<img src="<%=basePath%>static/source/public/images/user.png"/>
				<div class="tit">老年人口信息管理</div>
			</a>
		</div>
		<div class="layui-col-xs3 text-center">
			<a class="moduleitem" title="老龄工作数据统计分析" href="javascript:void(0);">
				<img src="<%=basePath%>static/source/public/images/chart.png"/>
				<div class="tit">老龄工作数据统计分析</div>
			</a>
		</div>
		<div class="layui-col-xs3 text-center">
			<a class="moduleitem" title="老龄工作行政管理" href="javascript:void(0);">
				<img src="<%=basePath%>static/source/public/images/userlist.png"/>
				<div class="tit">老龄工作行政管理</div>
			</a>
		</div>
		<div class="layui-col-xs3 text-center">
			<a class="moduleitem" title="高龄津贴管理" href="javascript:void(0);">
				<img src="<%=basePath%>static/source/public/images/module.png"/>
				<div class="tit">高龄津贴管理</div>
			</a>
		</div>
	</div>
	<div class="layui-row layui-col-space10">
		<div class="layui-col-xs3 text-center">
			<!-- <div class="stepitem step1"></div> -->
			<img class="stepimg" onselectstart="return false" unselectable="on"
				 src="<%=basePath%>static/source/public/images/step1.png"/>
		</div>
		<div class="layui-col-xs3 text-center">
			<img class="stepimg" onselectstart="return false" unselectable="on"
				 src="<%=basePath%>static/source/public/images/step2.png"/>
		</div>
		<div class="layui-col-xs3 text-center">
			<img class="stepimg" onselectstart="return false" unselectable="on"
				 src="<%=basePath%>static/source/public/images/step3.png"/>
		</div>
		<div class="layui-col-xs3 text-center">
			<img class="stepimg" onselectstart="return false" unselectable="on"
				 src="<%=basePath%>static/source/public/images/step4.png"/>
		</div>
	</div>
	<div class="layui-row layui-col-space10">
		<div class="layui-col-xs3 text-center">
			<a class="moduleitem" title="人口老龄化趋势分析" href="javascript:void(0);">
				<img src="<%=basePath%>static/source/public/images/defense.png"/>
				<div class="tit">人口老龄化趋势分析</div>
			</a>
		</div>
		<div class="layui-col-xs3 text-center">
			<a class="moduleitem" title="老年人生活质量综合监测与跟踪评估" href="javascript:void(0);">
				<img src="<%=basePath%>static/source/public/images/edit.png"/>
				<div class="tit">
					老年人生活质量<br />综合监测与跟踪评估
				</div>
			</a>
		</div>
		<div class="layui-col-xs3 text-center">
			<a class="moduleitem" title="老龄事业评估" href="javascript:void(0);">
				<img src="<%=basePath%>static/source/public/images/list.png"/>
				<div class="tit">老龄事业评估</div>
			</a>
		</div>
		<div class="layui-col-xs3 text-center">
			<a class="moduleitem" title="老龄工作管理" href="javascript:void(0);">
				<img src="<%=basePath%>static/source/public/images/check.png"/>
				<div class="tit">老龄工作管理</div>
			</a>
		</div>
	</div>
</div>
</body>
<%@ include file="./foot.jsp"%>
<script>
  var resize4win = LLW.later(function(){
        var $win, $box, winsize, boxsize;
        $win = $(window);
        $box = $('.fishmodules');
        winsize = {
            w: $win.width(),
            h: $win.height()
        };
        boxsize = {
            w: $box.width(),
            h: $box.height()
        };
        if( 'undefined' === typeof resize4win.FIRST ){
            $box.css({
                top:  winsize.h < boxsize.h ? 0 : (winsize.h/2-boxsize.h/2) +'px',
                left: winsize.w < boxsize.w ? 0 : (winsize.w/2-boxsize.w/2) +'px'
            });
            $('body').removeClass('hidden');
            resize4win.FIRST = true;
        } else {
            $box.animate({
                top:  winsize.h < boxsize.h ? 0 : (winsize.h/2-boxsize.h/2) +'px',
                left: winsize.w < boxsize.w ? 0 : (winsize.w/2-boxsize.w/2) +'px'
            },150);
        }
    }, 300);

    function goTo(menuId,areaCode) {
        parent.location.href = '<%=basePath%>to_module.do?areaCode=' +areaCode+ '&menuId='+menuId;
    }
    $(function() {
        $(".moduleitem").each(function(index){
            $(this).attr("index",index);
        })

        var menuData = parent.getMenuList();
        $(".moduleitem").on("click", function() {
            var index= $(this).attr("index");
            var mark= false;
            for(var i=0;i<menuData.length;i++){

                if(parseInt(index)+1 == parseInt(menuData[i].order)){
                    var id= menuData[i].id
                    mark= true;
                }
            }
            if(mark){
                var areaCode= parent.getAreaCode();
                goTo(id,areaCode);
            }else{
                layer.msg('暂没有访问权限')
            }

        });


        $(window).resize(resize4win);       //自适应居中
        resize4win();
    })
</script>
</html>
