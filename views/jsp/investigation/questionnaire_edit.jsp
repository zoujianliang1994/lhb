<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->
	<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
	<%@ include file="../system/index/headcss.jsp"%>
	<style>

	</style>
</head>
<body >
<div class="edit_menu" class="disnone">

	<form action="classify/${msg}.do" class="layui-form"  name="form1" id="form1" >
		<div class="layui-form-item">
			<div class="layui-row">
				<div  style="width: 13rem">
					<input  name="ask-chapter-name" id="ask-chapter-name" placeholder="请输入问卷名"  type="text"  class="layui-input">
				</div>
			</div>
		</div>
	</form>
	<div class="add-ask-btn">


		<div class="ask-btn add-btn">
			增加题目
		</div>
		<div class="ask-btn ask-set-btn " id="question">
			题库
		</div>

	</div>
	<div class="ask-chapter-content layui-form">
		<div class="ask-item clearfloat">
			<div class="ask-number">
				<label>序号</label>
				<input type="text" class="min-No">
			</div>
			<div class="ask-centent">
				<div class="problem">
					<span>你平时中午吃什么</span>
					<span>(单选)</span>
				</div>
				<div class="ask-options" >
					<input type="radio" name="food" value="A" title="盖浇饭">
					<input type="radio" name="food" value="B" title="干拌面">
					<input type="radio" name="food" value="C" title="裤带面" >
					<input type="radio" name="food" value="D" title="炒菜">
					<input type="radio" name="food" value="E" title="干锅">
					<input type="radio" name="food" value="F" title="冒菜" >
				</div>
				<ul class="ask-operating">
					<li class="ask-edit">编辑</li>
					<li class="ask-del">删除</li>
					<li class="add-top">上方增加题目</li>
					<li class="add-bottom">下方增加题目</li>
				</ul>

			</div>
		</div>
		<div class="ask-item clearfloat">
			<div class="ask-number">
				<label>序号</label>
				<input type="text" class="min-No">
			</div>
			<div class="ask-centent">
				<div class="problem">
					<span>晚上干什么去</span>
					<span>(多选)</span>
				</div>
				<div class="ask-options" >
					<input type="checkbox" name="" title="写作" lay-skin="primary">
					<input type="checkbox" name="" title="方呆" lay-skin="primary">
					<input type="checkbox" name="" title="睡觉" lay-skin="primary">
					<input type="checkbox" name="" title="泡吧" lay-skin="primary">
					<input type="checkbox" name="" title="烹饪" lay-skin="primary">
					<input type="checkbox" name="" title="网吧" lay-skin="primary">
				</div>
				<ul class="ask-operating">
					<li class="ask-edit">编辑</li>
					<li class="ask-del">删除</li>
					<li class="add-top">上方增加题目</li>
					<li class="add-bottom">下方增加题目</li>
				</ul>
			</div>
		</div>
		<div class="ask-item clearfloat">
			<div class="ask-number">
				<label>序号</label>
				<input type="text" class="min-No">
			</div>
			<div class="ask-centent">
				<div class="fill-blank">
					你一般在这些场所用餐的频率是？
					食堂<input type="text" class="fill-blank-input">

					饭馆<input type="text" class="fill-blank-input">

					路边小摊<input type="text" class="fill-blank-input">

					外卖<input type="text" class="fill-blank-input">

					其他<input type="text" class="fill-blank-input">


				</div>
				<ul class="ask-operating">
					<li class="ask-edit">编辑</li>
					<li class="ask-del">删除</li>
					<li class="add-top">上方增加题目</li>
					<li class="add-bottom">下方增加题目</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="btnbox" >
		<c:if test="${pd.types=='0'}">
			<button id="sure" class="layui-btn layui-btn-primary layui-btn-small">确认</button>
		</c:if>
		<%--<button id="cancel" class="layui-btn layui-btn-primary layui-btn-small">取消</button>--%>
	</div>
</div>


	<!-- 页面底部js¨ -->
	<%@ include file="../system/index/foot.jsp"%>

	<!--提示框-->
	<script type="text/javascript">

        var form=layui.form;
        if("${pd.types}"=="1"){

            $.formToDiv(true);
		}

        layui.use('laydate', function () {
            var laydate = layui.laydate;
            //执行一个laydate实例
            laydate.render({
                elem: '#applyYear'
				,type: 'year'
            })
        });

        //题库
        $("#question").on("click", function() {
            parent.layer.open({
                title:"新增问题",
                type: 2,
                content:'<%=basePath%>questionnaire/bank.do',
                area: ["1000px","600px"]
            });
            transmit(window);
        })

		//新增
       $(".add-btn").on("click", function() {
           parent.layer.open({
               title:"新增问题",
               type: 2,
               content:'<%=basePath%>question/toAdd.do',
               area: ["1000px","500px"]
           });
           transmit(window);
       })
        //编辑
        $(".ask-chapter-content").on("click", ".ask-edit", function() {
            var id =  $(this).attr("data_id");
            parent.layer.open({
                title:"编辑题目",
                type: 2,
                content:'<%=basePath%>question/toEdit.do?id='+id+'&currentPage=${page.currentPage}',
                area: ["1000px","600px"]
            });
            transmit(window);
        })
        //

        //删除
        $(".ask-chapter-content").on("click", ".ask-del", function() {

            var id =  $(this).attr("data_id");
            parent.layer.confirm("是否确认删除此数据", {
                btn : [ '确定', '取消' ] //按钮
                ,resize : false
                ,title : "提示"
                ,maxWidth : 800
            }, function(index) {
                layer.msg('删除失败!', {icon: 5});
                parent.parent.layer.closeAll();
                /* var url = "<%=basePath%>affairs/delete.do?id=" + id + "&guid=" + new Date().getTime();
                $.get(url, function (data) {
                    if ("successs" == data.result) {
                        window.location.href = "<%=basePath%>affairs/list.do?currentPage=${page.currentPage}";
                        parent.parent.layer.closeAll();
                    } else if ("false" == data.result) {
                        layer.msg('删除失败!', {icon: 5});
                    }
                });*/
            });

        })
        var isTop=true;
        var data=[];
		//上方增加题目
		$(".ask-chapter-content").on("click",".add-top",function () {
		    var dom=$(this).parent().parent().parent();
            isTop=true
            addSingle(data,dom,isTop)
            form.render();

        })
        //下方增加题目
        $(".ask-chapter-content").on("click",".add-bottom",function () {
            var dom=$(this).parent().parent().parent();
            isTop=false
            addSingle(data,dom,isTop)
            form.render();
        })

		function addSingle(data,dom,isTop) {
			var html="";
			html='<div class="ask-item clearfloat">' +
                '<div class="ask-number">' +
                '<label>序号</label>' +
                '<input type="text" class="min-No">' +
                '</div>' +
                '<div class="ask-centent">' +
                '<div class="problem">' +
                '<span>你平时中午吃什么</span>' +
                '<span>(单选)</span>' +
                '</div>' +
                '<div class="ask-options" >' +
                '<input type="radio" name="food" value="A" title="盖浇饭">' +
                '<input type="radio" name="food" value="B" title="干拌面">' +
                '<input type="radio" name="food" value="C" title="裤带面" >' +
                '<input type="radio" name="food" value="D" title="炒菜">' +
                '<input type="radio" name="food" value="E" title="干锅">' +
                '<input type="radio" name="food" value="F" title="冒菜" >' +
                '</div>' +
                '<ul class="ask-operating">' +
                '<li class="ask-edit">编辑</li>' +
                '<li class="ask-del">删除</li>' +
                '<li class="add-top">上方增加题目</li>' +
                '<li class="add-bottom">下方增加题目</li>' +
                '</ul>' +
                '</div>' +
                '</div>'
			if(isTop){
                $(dom).before(html);
			}else{
                $(dom).after(html);
			}

        }

       function transmit(obj){
           parent.layer.transmit= obj;
       }



        $(document).ready(function(){

            $("#sure").on("click",function(){

                parent.layer.closeAll();

               var page ="${pd.currentPage}";

                $("#form1").ajaxSubmit({
                    type: 'post',
                    success: function(data) {
                        if ("success" == data.msg) {
                            parent.layer.transmit.location.href = "<%=basePath%>affairs/list.do?currentPage=" + page;
                            parent.layer.closeAll();
                        } else if ("error" == data.msg) {
                            layer.msg('系统异常,保存失败!', {icon: 5});
                        } else if("false" == data.msg){
                            layer.msg('相同类型数据已存在!', {icon: 5});
						}
                    }
				});

            });

            // $("#cancel").on("click",function(){
            //     parent.layer.closeAll();
            // })
        });


	</script>
</body>
</html>

