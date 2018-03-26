<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>老年人社会参与</title>
    <%@ include file="../system/index/headcss.jsp" %>
</head>
<body>
<div class="tableBox">
    <div class="operationBox">
        <form class="layui-form" action="list.do" method="post" name="Form" id="Form">

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
    <div style="text-align:center;"><span style="color: #FF3333;">${sysArea.name}</span> 老年人社会参与报表</div>

    <table class=" layui-table center" id="table">
        <colgroup>
            <col width="200">
            <col>
            <col>
            <col>
        </colgroup>
        <thead>
        <tr>
            <th rowspan="3">
                <c:if test="${pd.level == '1'}">
                    市州
                </c:if>
                <c:if test="${pd.level == '2'}">
                    区(县)
                </c:if>
                <c:if test="${pd.level == '3'}">
                    乡/街道
                </c:if>
                <c:if test="${pd.level == '4'}">
                    社区
                </c:if>
            </th>
            <th rowspan="2" colspan="2">老年人自主创业</th>
            <th colspan="16">老年人志愿服务</th>
            <th colspan="2" rowspan="2">老年人发挥自身优势助推当地经济发展</th>
        </tr>
        <tr>
            <th colspan="2">参与基层民主监督</th>
            <th colspan="2">参与社会治安</th>
            <th colspan="2">参与公益慈善</th>
            <th colspan="2">参与移风易俗</th>
            <th colspan="2">参与民事调解</th>
            <th colspan="2">参与文教卫生</th>
            <th colspan="2">参与全民健身</th>
            <th colspan="2">其他</th>
        </tr>
        <tr>
            <th >活动数量</th>
            <th >参与老年人总数</th>
            <th >活动数量</th>
            <th >参与老年人总数</th>
            <th >活动数量</th>
            <th >参与老年人总数</th>
            <th >活动数量</th>
            <th >参与老年人总数</th>
            <th >活动数量</th>
            <th >参与老年人总数</th>
            <th >活动数量</th>
            <th >参与老年人总数</th>
            <th >活动数量</th>
            <th >参与老年人总数</th>
            <th >活动数量</th>
            <th >参与老年人总数</th>
            <th >活动数量</th>
            <th >参与老年人总数</th>
            <th >活动数量</th>
            <th >参与老年人总数</th>
        </tr>
        </thead>
        <tbody id="tbody">
        <c:choose>
            <c:when test="${not empty list}">
                <c:forEach items="${list}" var="var" varStatus="vs">
                    <tr>
                        <td>
                            <c:if test="${pd.level == '1'}">
                                  <a style="color: #0C64B5;" class="address" data-id="${var.area_code }" data-level="${var.level}"  href="javascript:void(0);">${var.name }</a>
                            </c:if>
                            <c:if test="${pd.level != '1'}">
                                ${var.name}
                            </c:if>
                        </td>
                        <td>${var.hdsl_zzcy_num}</td>
                        <td>${var.cyzs_zzcy_num}</td>
                         <td>${var.hdsl_mzjd_num}</td>
                        <td>${var.cyzs_mzjd_num}</td>
                         <td>${var.hdsl_shza_num}</td>
                        <td>${var.cyzs_shza_num}</td>
                         <td>${var.hdsl_gycs_num}</td>
                        <td>${var.cyzs_gycs_num}</td>
                         <td>${var.hdsl_yfys_num}</td>
                        <td>${var.cyzs_yfys_num}</td>
                         <td>${var.hdsl_mstj_num}</td>
                        <td>${var.cyzs_mstj_num}</td>
                         <td>${var.hdsl_wjws_num}</td>
                        <td>${var.cyzs_wjws_num}</td>
                         <td>${var.hdsl_qmjs_num}</td>
                        <td>${var.cyzs_qmjs_num}</td>
                         <td>${var.hdsl_qt_num}</td>
                        <td>${var.cyzs_qt_num}</td>
                         <td>${var.hdsl_jjfz_num}</td>
                        <td>${var.cyzs_jjfz_num}</td>
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

        //导出
        $("#dowExcel").on("click", function () {
            var version = '${version}';
            if (version != null && "" != version) {
                window.location.href = '<%=basePath%>oldExpandReport/dowExcel.do?version=' + version + '&level=${pd.level}';
            } else {
                layer.tips('没有数据,无法导出!', $("#dowExcel"), {
                    tips: [3, '#D16E6C'],
                    time: 4000
                });
            }
        });
    });

     $("#tbody").on("click", ".address", function () {
        var id = $(this).data("id");
        var title = $(this).text();
        parent.addTab(title + "老年人参与社会经济发展报表", "oldExpandReport/list.do?area_code=" + id + "&area_name=&year=" + '${pd.year}' + "&nd=" + '${pd.nd}');
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
        var sTree = $.Stree({
            title: "${pd.area_name}",
            el: $("#sTree"),
            oldData: ['${pd.area_code}'],
            isSingle: true,  //单选
            data: data,
            callback: function () {
            	$("#area_name").val($.getString(this.arr, "title")||$("#area_name").val());
                $("#area_code").val($.getString(this.arr, "areaCode")||$("#area_code").val());
                if (!first) {
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