﻿
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>四川省60岁以上人口总量分析</title>
    <%@ include file="../system/index/headcss.jsp" %>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/source/public/css/report_edit_head.css">
</head>
<body>
    <div class="tableBox " >

       <!--  <div class="operationBox">
            <button class="layui-btn fl  layui-btn-blue" id="add">新增</button>
        </div> -->
		<div class="operationBox">
            <button class="layui-btn fl  layui-btn-blue" id="syncArea">同步行政区划</button>
            <input type="hidden" id="version" value="">
            <button type="button" class="layui-btn layui-btn-primary  " id="dowload" style="margin-left: 16px;margin-bottom: 10px">导出当前数据</button>
            <button type="button" class="layui-btn layui-btn-primary  " id="dowloadAll" style="margin-left: 16px;margin-bottom: 10px">全部导出</button>
        </div>
        <table class="layui-table center ms-controller" id="table" ms-controller="table"  style="margin-bottom:30px">
            <thead>
                <tr>
                   <th colspan="18"> 四川省老年人口60岁以上人口信息上报表</th>
                </tr>
                <tr>
                    <th rowspan="2">所在区域</th>
                    <th colspan="3">人口总数</th>
                    <th colspan="2">60-64岁总人口数</th>
                    <th colspan="2">65-69岁总人口数</th>
                    <th colspan="2">70-79岁总人口数</th>
                    <th colspan="2">80-89岁总人口数</th>
                    <th colspan="2">90-99岁总人口数</th>
                    <th colspan="2">100岁以上总人口数</th>
                    <th rowspan="2">图形分析</th>
                </tr>
                <tr>
               		<th >户籍人口总数</th>
                	<th >60岁以上人口总数</th>
                    <th >占比</th>
                    
                    <th >人口数</th>
                    <th >占比</th>
                    <th >人口数</th>
                    <th >占比</th>
                    <th >人口数</th>
                    <th >占比</th>
                    <th >人口数</th>
                    <th >占比</th>
                    <th >人口数</th>
                    <th >占比</th>
                    <th >人口数</th>
                    <th >占比</th>
                </tr>
            <thead>
            <tbody>
                <tr ms-for="(index,item) in @tbody">
                    <td>
                       <a href="javascript:void(0);" :click="addTab(index)"  :css="{color:item.level == 2 ? '' : '#0C64B5'}"> {{item.xzqh_name}}</a>
                    </td>
                    <td>{{item.hjage_one}}</td>
                    <td>{{item.totalCount}}</td>
                    <td>{{((item.totalCount==0 ? 1 : item.totalCount)/item.hjage_one*100).toFixed(2)+'%'}}</td>
                    <td>{{item.age_one}}</td>
                    <td>{{(item.age_one/(item.totalCount==0 ? 1 : item.totalCount)*100).toFixed(2)+'%'}}</td>
                    <td>{{item.age_two}}</td>
                    <td>{{(item.age_two/(item.totalCount==0 ? 1 : item.totalCount)*100).toFixed(2)+'%'}}</td>
                    <td>{{item.age_three}}</td>
                    <td>{{(item.age_three/(item.totalCount==0 ? 1 : item.totalCount)*100).toFixed(2)+'%'}}</td>
                    <td>{{item.age_four}}</td>
                    <td>{{(item.age_four/(item.totalCount==0 ? 1 : item.totalCount)*100).toFixed(2)+'%'}}</td>
                    <td>{{item.age_five}}</td>
                    <td>{{(item.age_five/(item.totalCount==0 ? 1 : item.totalCount)*100).toFixed(2)+'%'}}</td>
                    <td>{{item.age_six}}</td>
                    <td>{{(item.age_six/(item.totalCount==0 ? 1 : item.totalCount)*100).toFixed(2)+'%'}}</td>
                    <td>
                        <a ms-if="item.level==2" class="layui-btn layui-btn-mini layui-btn-normal" ms-click="edit(index)">编辑</a>
                        <a class="layui-btn layui-btn-mini " ms-click="seeCharts(index)">查看图形</a>
                        <a ms-if="item.level==2" class="layui-btn layui-btn-mini layui-btn-danger " ms-click="remove(index)">删除</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
<%@ include file="../system/index/foot.jsp" %>
<script type="text/javascript" src="<%=basePath%>static/source/public/js/avalon.js"></script>
<script>
    avalon.ready(function(){
        var xzqh_code= "${xzqh}";
        var vm= avalon.define({
            $id: "table",
            tbody:[],
            addTab:function(index){
                var xzqh_code= this.tbody[index].xzqh_code;
                if(xzqh_code==510000000000){
                    return
                }
                if(this.tbody[index].level == 2){
                	return
                }
                var title= this.tbody[index].xzqh_name
                console.log(xzqh_code)
                top.addTab(title+"60岁以上人口总量分析","fixedStatistics/sextenReport?xzqh="+xzqh_code)
            },
            seeCharts:function(index){
                var id= this.tbody[index].id;
                parent.showSuspensionBox("fixedStatistics/goSextenReport?id="+id,"图形分析")
            },
            edit:function(index){
            	top.layer.trasmit= window;
                top.layer.open({
                    title: "编辑",
                    type: 2,
                    content: '<%=basePath%>fixedStatistics/goAddOrUpdateSixten?id='+this.tbody[index].id,
                    area: ["500px", "600px"]
                });
            },
            remove:function(index){
                var id= this.tbody[index].id;
                top.layer.confirm("是否删除这条数据?", {
                    btn: ['确定', '取消'],
                    resize: false,
                    title: "提示",
                    maxWidth: 800
                }, function (index) {
                    $.post("<%=basePath%>fixedStatistics/deleteSixtenReport",{id:id},function(data){
						if(data.code == 10000){
							top.layer.closeAll();
							window.location.reload();
						}else{
							top.layer.msg(data.desc,{
								icon:2,
								shift:6
							})
						}
                    })
                });
            }
        })

        if(xzqh_code==510000000000){
            $.post("<%=basePath%>fixedStatistics/getSixtenList",{xzqh:xzqh_code},function(data){
                if(data.code == 10000){
                    vm.tbody= data.data.lists;
                    $("#version").val(data.data.version);
                }else{
                    layer.msg(data.desc,{icon:2})
                }
            })
        }else{
            $.post("<%=basePath%>fixedStatistics/getSixtenChildList ",{parent_xzqh:xzqh_code},function(data){
                console.log(data);
                if(data.code == 10000){
                    vm.tbody= data.data.lists;
                    $("#version").val(data.data.version);
                }else{
                    layer.msg(data.desc,{icon:2})
                }
            })
        }


        $("#add").on("click",function(){
        	top.layer.trasmit= window;
            top.layer.open({
                title: "新增",
                type: 2,
                content: '<%=basePath%>fixedStatistics/goAddOrUpdateSixten',
                area: ["500px", "600px"]
            });
        })
        //同步行政区划 
        $("#syncArea").on("click",function(){
        	top.layer.load(2);
        	 $.post("<%=basePath%>fixedStatistics/createAreaToSix ",{parent_xzqh:xzqh_code},function(data){
        		 top.layer.closeAll("loading")
                 if(data.code == 10000){
                     layer.msg('同步成功',{icon:1});
                     setTimeout(function(){
                    	 window.location.reload();
                     },1000)
                 }else{
                     layer.msg(data.desc,{icon:2})
                 }
                 
             })
        })

        //导出
        $("#dowload").on("click", function () {
            window.location.href = '<%=basePath%>fixedStatistics/exportExcel.do?version='+$("#version").val();
        });


        //导出
        $("#dowloadAll").on("click", function () {
            window.location.href = '<%=basePath%>fixedStatistics/exportExcel.do';
        });

        avalon.scan(document.body)
    })
</script>
</body>
</html>