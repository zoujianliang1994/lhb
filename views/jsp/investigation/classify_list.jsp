<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <title>题目分类管理</title>

    <%@ include file="../system/index/headcss.jsp"%>
</head>
<body>
<div class="tableBox">
    <div class="operationBox layui-form">
        <form action="list.do" method="post" name="Form" id="Form">

            <div class="searchBox fl marL-20">
                <input type="text" value="${pd.selApplyYear}" name="selApplyYear" id="selApplyYear" required   placeholder="题目类型名称" autocomplete="off" class="layui-input fl search">
                <div class="fl srarchBtn" >
                    <i class="layui-icon">&#xe615;</i>
                </div>
            </div>

        </form>

            <button class="layui-btn fl  marL-20 layui-btn-blue" id="add">新增</button>
    </div>


    <table class="layui-table center" id="table">

        <thead>
        <tr>
            <td>序号</td>
            <td>题目类型名称</td>
            <td>创建日期</td>
            <td>类型描述</td>
            <td>操作</td>
        </tr>
        </thead>
        <tbody>

            <tr>
                <td>1</td>
                <td>生活情况</td>
                <td>2018/1/18</td>
                <td>生活情况</td>
                <td style="width: 160px; text-align: center;">
                    <a class="layui-btn layui-btn-primary layui-btn-mini selUser" data_id="">查看</a>

                    <a class="layui-btn layui-btn-mini edit"  data_id="">编辑</a>


                    <a class="layui-btn layui-btn-danger layui-btn-mini del" data_id="">删除</a>

                </td>
            </tr>

            <tr>
                <td>2</td>
                <td>社保医保类</td>
                <td>2018/1/18</td>
                <td>社保医保类</td>
                <td style="width: 160px; text-align: center;">
                    <a class="layui-btn layui-btn-primary layui-btn-mini selUser" data_id="">查看</a>

                    <a class="layui-btn layui-btn-mini edit"  data_id="">编辑</a>


                    <a class="layui-btn layui-btn-danger layui-btn-mini del" data_id="">删除</a>

                </td>
            </tr>

            <tr>
                <td>3</td>
                <td>健康情况类</td>
                <td>2018/1/18</td>
                <td>健康情况类</td>
                <td style="width: 160px; text-align: center;">
                    <a class="layui-btn layui-btn-primary layui-btn-mini selUser" data_id="">查看</a>

                    <a class="layui-btn layui-btn-mini edit"  data_id="">编辑</a>


                    <a class="layui-btn layui-btn-danger layui-btn-mini del" data_id="">删除</a>

                </td>
            </tr>

            <tr>
                <td>4</td>
                <td>基本信息类</td>
                <td>2018/1/18</td>
                <td>基本信息</td>
                <td style="width: 160px; text-align: center;">
                    <a class="layui-btn layui-btn-primary layui-btn-mini selUser" data_id="">查看</a>

                    <a class="layui-btn layui-btn-mini edit"  data_id="">编辑</a>


                    <a class="layui-btn layui-btn-danger layui-btn-mini del" data_id="">删除</a>

                </td>
            </tr>
        </tbody>
    </table>

    <div class="laypageBox ">
        <div id="laypage" class="fr"></div>
    </div>
</div>

<%--	<div class="layui-form">
		<div class="layui-form-item" pane="">
			<label class="layui-form-label">原始复选框</label>
			<div class="layui-input-block">
				 复选框值源于数据库字典，根据父级英文名查询所得 默认样式(样式问题询问佳杰)
				<html:checkbox name="type" defaultValue="1,3,5,2" collection="personnel_categories" ></html:checkbox>

			</div>
		</div>
	</div>--%>

<%@ include file="../system/index/foot.jsp"%>
<script type="text/javascript">
    var first= true;

    function gsearch() {
        $("#Form").submit();
    }



    layui.use('laypage', function() {
        var laypage = layui.laypage;
        var layer = layui.layer;
        var form = layui.form;


        //执行一个laypage实例
        laypage.render({
            elem: 'laypage',
            count: 4,
            curr: 1,
            layout: ['prev', 'page', 'next', 'count', 'skip'],
            jump: function (obj, first) {
                if (!first) {
                    window.location.href = "<%=basePath%>affairs/list.do?currentPage=" + obj.curr ;
                }
            }
        });

        //搜索

        form.on('select(nd)', function(data){
            gsearch()
        });

        //新增
        $("#add").on("click", function() {
            parent.layer.open({
                title:"新增分类",
                type: 2,
                content:'<%=basePath%>classify/toAdd.do',
                area: ["1000px","500px"]
            });
            transmit(window);
        })

        //查看
        $("#table").on("click", ".selUser", function() {
            var id =  $(this).attr("data_id");
            parent.layer.open({
                title:"管理分类",
                type: 2,
                content:'<%=basePath%>classify/toSelect.do?id='+id,
                area: ["800px","500px"]
            });
            transmit(window);
        })
        //编辑
        $("#table").on("click", ".edit", function() {
            var id =  $(this).attr("data_id");
            parent.layer.open({
                title:"管理分类",
                type: 2,
                content:'<%=basePath%>classify/toEdit.do?id='+id+'&currentPage=${page.currentPage}',
                area: ["1000px","600px"]
            });
            transmit(window);
        })

        //删除
        $("#table").on("click", ".del", function() {

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

    });

    //所在区域
    $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId",{parentId:0},function(data){
        var sTree = $.Stree({
            title:"${pd.selAreaName}",
            el: $("#sTree"),
            isSingle: true,  //单选
            data:data,
            callback:function(){
                $("#selAreaName").val($.getString(this.arr,"title"))
                $("#selAreaCode").val($.getString(this.arr,"areaCode"))
                if(!first){
                    gsearch()
                }
            },
            switchCallback: function (obj) {
                var id = obj.id;
                if(obj.children == ""){
                    getAddress(id, sTree)
                }
            }
        });
        first=false;
    },"json")

    function getAddress(id, sTree) {
        $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId", {parentId: id}, function (data) {
            //数据
            sTree.findOne(id, function (obj) {
                if (obj.children == "") {
                    obj.children = data;
                }

                sTree.rec(data, function (obj, index) {
                    sTree.operation(obj, index);
                }, obj.lev)
            })
            //默认选中

            sTree.cheakedOldData()
            //展示

        })
    }

    function transmit(obj){
        parent.layer.transmit= obj;
    }
</script>
</body>
</html>