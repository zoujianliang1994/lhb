<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>主页</title>
	<meta http-equiv="X-UA-Compatible" content="IE=11">
	<link rel="shortcut icon" href="${basePath}/static/source/public/images/32.png" type="image/x-icon" />

</head>
<body>
	<div class="wrap">
		<%@ include file="./header.jsp"%>

		<div class="contentBox">
			<%--<hr class="line" id="line"/>--%>
			<div class="menu" >
				<c:if test="${user.USERNAME!='superAdmin'}">
				<a class="back" href="<%=basePath%>to_module_list">
					<span><i style="vertical-align: middle;margin-right:5px;font-size:13px" class="iconfont icon-fanhui"></i></span>返回
				</a>
				</c:if>
				<div id="menu" class="treeView"></div>
			</div>
			<div class="contentBody">
				<div class="layui-tab wh100" lay-allowClose="true" lay-filter="table">
					<ul class="layui-tab-title" id="layui-tab-title">

					</ul>
					<div class="layui-tab-content wh100">

					</div>
				</div>
			</div>

			<div class="suspensionBox" id="suspensionBox">
				<div class="layui-layer-title" style="text-align:center">
					<i class="layui-icon layui-unselect layui-tab-close fl" style="cursor:pointer" id="closeSuspensionBox">ဆ</i> <span class="title"></span>
				</div>
				<div class="layui-tab-content wh100">
					<iframe src=""  class="iframe"  frameBorder="0"></iframe>
				</div>
			</div>


		</div>

	</div>

	<%@ include file="./foot.jsp"%>
	<script>
	
    $(function () {
        var element  = layui.element;
        var data= eval('${menuList}');
      //  console.log(data)
        //左边导航条
        treeView = $.TreeView({
            el: $("#menu"),
            show: true,
            data: data,
            //导航回掉
            callback: function (obj) {
              //  console.log(obj)
                var title = obj.title;
                var url = obj.url;
                //没有链接跳出
                addTab(title,url,this)
            }
        })
		
		var obj=rec(data[0]);



        $("#menu .lev"+obj.lev).find(".title").click();
        //getMap(0,treeView)

        function addTab(title,url,obj){
            var mark = true; //tab是否已有
            if(url =="#"){
                return
            }
            closeSuspensionBox();
            var $title = $("#layui-tab-title").find("li");
            //active选中
           $("#menu").find(".treeItem").each(function(){
                $(this).removeClass("active")
			})
			$(obj).closest(".treeItem").addClass("active");
			//如果以有跳转到
			$title.each(function () {
				if (url == $(this).attr("lay-id")) {
					element.tabChange('table', url);
					mark = false
					return false
				}
			})

			$("#menu").find(".treeItem").each(function(){
			    $(this).children(".title").css("color","#000");
                $(this).children(".icon-icon").css("color","#000");
			})

            $(obj).prev().css("color","#fff");
            $(obj).css("color","#fff");

            $(obj).parents(".itemBox").each(function(index){
				var calssArr=this.className.split(" ")
				if(calssArr.length>=2 && index >=2){
				    $("."+calssArr[1]).children(".treeItem").children(".title").css("color","#108ee9")
                    $("."+calssArr[1]).children(".treeItem").children(".icon-icon ").css("color","#108ee9")
				}
			})

            //table 已经有了刷新
            if (!mark) {
                var $iframe= $(".layui-tab .layui-show iframe");

                $iframe.attr("src",$iframe.attr("src"));
                return;
            }
            //新增
            element.tabAdd("table", {
                title: title
                , content: '<iframe src="<%=basePath%>'+url+'"  class="iframe"  frameBorder="0"></iframe>' //支持传入html
                , id: url
            });

            element.tabChange('table', url);
        }
        window.addTab= addTab;

        $("#closeSuspensionBox").on("click",function(){
            closeSuspensionBox();
		})
    })
	function closeSuspensionBox(){
        $("#suspensionBox").css("right",'-80%')
	}

	function showSuspensionBox(url,title){
        $("#suspensionBox").find(".title").text(title)
        $("#suspensionBox").find("iframe").attr("src",url)
		layer.load(2)
		var timer= setTimeout(function(){
            $("#suspensionBox").css("right",0)
            layer.closeAll("loading")
		},300)

	}
    function rec(obj){
    	if(obj.children == "" ){
    		return obj
    	}else{
    		$("#menu .lev"+obj.lev).children(".treeItem").children(".item-switch").click();
    		return rec(obj.children[0])    	
    	}
    }

    function logOut() {
        window.location.href = "<%=basePath%>logout";
    }

    function getMap(index, treeView) {
        $.post("<%=basePath%>areaCode/findLevel2", {
				parentId : index
			}, function(data) {
			for (var i = 0; i < data.length; i++) {
				data[i].title = data[i].name;
				data[i].url = data[i].id;
			}
			treeView.callback = function(id) {
			}
			treeView.refresh(data)
		})
	}



	</script>
</body>
</html>