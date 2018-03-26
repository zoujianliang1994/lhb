<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>老年人意外保险优待统计表管理</title>
    <%@ include file="../system/index/headcss.jsp" %>
</head>
<body>
<div class="tableBox">
    <div class="operationBox">
        <form class="layui-form" action="listInfo.do" method="post" name="Form" id="Form">

            <div class="searchBox fl ">
                <input type="hidden" name="area_code" id="area_code" value="${sysArea.area_code}"/>
                <input type="hidden" name="area_name" id="area_name" value="${sysArea.name}"/>
                <div class="sTree fl" id="sTree" style="width:200px">
                    
                </div>
                <div class="fl srarchBtn">
                    <i class="layui-icon">&#xe715;</i>
                </div>
            </div>

            <div class="searchBox fl marL-20">
                <input type="hidden" name="year" id="year" value="${pd.year}"/>
                <input type="text" value="${pd.years}" name="years" id="years" required lay-verify="required" placeholder="年份"
                       autocomplete="off" class="layui-input fl search">
                <div class="fl srarchBtn">
                    <i class="layui-icon">&#xe637;</i>
                </div>
            </div>

            <div class="searchBox fl marL-20">
                <input type="hidden" name="nd" id="nd" value="${pd.nd}"/>
                <div class="layui-form-item ">
                    <select name="nds" lay-verify="required" lay-filter='select1'>
                        <option value="">全年</option>
                        <option value="1" <c:if test="${pd.nd == '1'}">selected</c:if>>上半年</option>
                    </select>
                </div>
            </div>

            <button type="button" class="layui-btn fl layui-btn-primary marL-20" id="dowExcel">导出</button>

        </form>
    </div>

    <hr>
    <div style="text-align:center;"><span style="color: #FF3333;">${sysArea.name}</span>老年人意外保险统计表</div>

    <table class=" layui-table center" id="table">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
            <col width="150">
        </colgroup>
        <thead>
        <tr>
            <th>区域</th>
            <th>保费总额</th>
            <th>投保总人数</th>
            <th>赔付总金额</th>
            <th>理赔人次</th>
        </tr>
        </thead>
        <tbody id="tbody">
        <c:choose>
            <c:when test="${not empty list}">
                <c:forEach items="${list}" var="var" varStatus="vs">
                    <tr>
                        <td>
                            <c:if test="${pd.level == '3'}">
                                ${var.name }
                            </c:if>

                            <c:if test="${pd.level != '3'}">
                                <a style="color: #0C64B5;" class="address" data-id="${var.area_code }" data-level="${var.level}"  href="javascript:void(0);">${var.name }</a>
                            </c:if>
                        </td>
                        <td>${var.bfzje_num}</td>
                        <td>${var.tbr_num}</td>
                        <td>${var.pfzje_num}</td>
                        <td>${var.lp_num}</td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr class="main_info">
                    <td colspan="100" class="center">没有相关数据</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>

</div>

<%@ include file="../system/index/foot.jsp" %>
<script type="text/javascript">
    var first = true;
    var form = layui.form;
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#years',
            type: 'year',
            value: '${pd.year}',
            done: function (value) {
                $("#year").val(value);
                gsearch();
            }
        });
    });
    
    //导出
    $("#dowExcel").on("click", function () {
        var version = '${version}';
        if (version != null && "" != version) {
            window.location.href = '<%=basePath%>insuranceReport/dowExcel.do?version=' + version + '&level=${pd.level}';
        } else {
            layer.tips('没有数据,无法导出!', $("#dowExcel"), {
                tips: [3, '#D16E6C'],
                time: 4000
            });
        }
    });

    $("#tbody").on("click", ".address", function () {
        var level = $(this).data("level");
        var szqy_code = $(this).data("id");
        if(level!=2){
        	 var title = $(this).text();
             parent.addTab(title + "老年人意外保险优待统计表", "insuranceReport/listInfo.do?area_code=" + szqy_code + "&area_name=&year=" + '${pd.year}' + "&nd=" + '${pd.nd}');
        }
        if(level==2){
        	 var title = $(this).text();
             parent.addTab(title + "老年人意外保险优待统计表", "insuranceReport/goReportViewDetail.do?area_code=" + szqy_code + "&area_name=&year=" + '${pd.year}' + "&nd=" + '${pd.nd}');
        }
    });

    function gsearch() {
        $("#Form").submit();
    }
    form.on('select(select1)', function (data) {
            $("#nd").val(data.value);
            gsearch();
        }
    );

    //所在区域
    $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId", {parentId:0}, function (data) {
    	//过滤掉子集
    	$.each( data, function(i, n){ 
    		if(data[i].level=='1'){
    			data[i].hasNext=false;
    		}
    	});
    	
        var sTree = $.Stree({
            el: $("#sTree"),
            isSingle: true,  //单选
            data: data,
            callback: function () {
                if (!first) {
                	$("#area_name").val($.getString(this.arr, "title"));
                    $("#area_code").val($.getString(this.arr, "areaCode"));
                    gsearch();
                }
            },
            switchCallback: function (obj) {
                var id = obj.id;
                if (obj.children == "") {
                    getAddress(id, sTree);
                }
            }
        });
        first = false;
    }, "json");

    function getAddress(id, sTree) {
        $.post("<%=basePath%>areaCode/listSubAreaCodeByParentId", {parentId: id}, function (data) {
        	$.each( data, function(i, n){ 
        		if(data[i].level=='1'){
        			data[i].hasNext=false;
        		}
        	});
            //数据
            sTree.findOne(id, function (obj) {
                if (obj.children == "") {
                    obj.children = data;
                }

                sTree.rec(data, function (obj, index) {
                    sTree.operation(obj, index);
                }, obj.lev)
            });
            //默认选中
            sTree.cheakedOldData();
        })
    }
    function transmit(obj) {
        parent.layer.transmit = obj;
    }
</script>
</body>
</html>