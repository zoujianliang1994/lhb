<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>人口老龄化态势分析</title>
    <%@ include file="../system/index/headcss.jsp" %>
</head>
<body>
<div class="tableBox">
    <div class="operationBox" style="height: auto">
        <form class="layui-form" action="listInfo.do" method="post" name="Form" id="Form">

            <div class="searchBox fl">
                <input type="hidden" name="begins" id="begins" value="${pd.begins}"/>
                <input type="text" value="${pd.begins}" name="year_begin" id="year_begin" required lay-verify="required" placeholder="起始年份"
                       autocomplete="off" class="layui-input fl search">
                <div class="fl srarchBtn">
                    <i class="layui-icon">&#xe637;</i>
                </div>
            </div>

            <div class="searchBox fl marL-20">
                <input type="hidden" name="ends" id="ends" value="${pd.ends}"/>
                <input type="text" value="${pd.ends}" name="year_end" id="year_end" required lay-verify="required" placeholder="截止年份"
                       autocomplete="off" class="layui-input fl search">
                <div class="fl srarchBtn">
                    <i class="layui-icon">&#xe637;</i>
                </div>
            </div>

            <div class="searchBox fl marL-20">
                <div class="layui-form-item ">
                    <select name="type" lay-verify="required" lay-filter='select1'>
                        <option value="">请选择区域</option>
                        <option value="1" <c:if test="${pd.type == '1'}">selected</c:if>>成都市</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">请选择分析维度：</label>
                <div class="layui-input-block">
                    <input type="checkbox" lay-filter="city" name="like[cx]" title="城乡人口" checked>
                    <input type="checkbox" lay-filter="sex" name="like[sex]" title="性别" checked>
                    <input type="checkbox" lay-filter="age60" name="like[age60]" title="60-64岁" checked>
                    <input type="checkbox" lay-filter="age65" name="like[age65]" title="65-69岁" checked>
                    <input type="checkbox" lay-filter="age70" name="like[age70]" title="70-79岁" checked>
                    <input type="checkbox" lay-filter="age80" name="like[age80]" title="80-89岁" checked>
                    <input type="checkbox" lay-filter="age90" name="like[age90]" title="90-99岁" checked>
                    <input type="checkbox" lay-filter="age100" name="like[age100]" title="100以上" checked>
                </div>
            </div>

        </form>
    </div>


    <table class=" layui-table center" id="table">
        <colgroup>
            <col width="80">
            <col width="150">
            <col>
            <col>
            <col>
            <col>
            <col>
            <col>
            <col>
            <col>
            <col>
        </colgroup>
        <thead>

        <tr>
            <th rowspan="2">序号</th>
            <th rowspan="2">户籍人口</th>
            <th colspan="2" >户籍人口总数</th>
            <th colspan="4" class="city-human">城乡人口</th>
            <th colspan="4" class="sex">性别</th>
            <th colspan="2" class="sixty-four">60-64岁</th>
            <th colspan="2" class="sixty-nine">65-69岁</th>
            <th colspan="2" class="seventy-nine">70-79岁</th>
            <th colspan="2" class="eighty-nine">80-89岁</th>
            <th colspan="2" class="ninety-nine">90-99岁</th>
            <th colspan="2" class="hundred">100岁以上</th>
        </tr>
        <tr>
            <th >人口总数</th>
            <th >人口总数全川占比</th>

            <th class="city-human">城市人口总数</th>
            <th class="city-human">城市人口占比</th>
            <th class="city-human">农村人口总数</th>
            <th class="city-human">农村人口占比</th>

            <th class="sex">男性人口总数</th>
            <th class="sex">男性人口占比</th>
            <th class="sex">女性人口总数</th>
            <th class="sex">女性人口占比</th>

            <th class="sixty-four">人口总数</th>
            <th class="sixty-four">人口占比</th>

            <th class="sixty-nine">人口总数</th>
            <th class="sixty-nine">人口占比</th>

            <th class="seventy-nine">人口总数</th>
            <th class="seventy-nine">人口占比</th>

            <th class="eighty-nine">人口总数</th>
            <th class="eighty-nine">人口占比</th>

            <th class="ninety-nine">人口总数</th>
            <th class="ninety-nine">人口占比</th>

            <th class="hundred">人口总数</th>
            <th class="hundred">人口占比</th>
        </tr>

        </thead>
        <tbody id="tbody">
        <c:choose>
            <c:when test="${not empty list}">
                <c:forEach items="${list}" var="var" varStatus="vs">
                    <tr>
                        <td>${vs.index+1}</td>
                        <td>${var.all_count}</td>

                        <td >${var.all_count}</td>
                        <td >${var.all_zb}</td>

                        <td class="city-human">${var.cs}</td>
                        <td class="city-human">${var.cszb}</td>
                        <td class="city-human">${var.nc}</td>
                        <td class="city-human">${var.nczb}</td>

                        <td class="sex">${var.nx}</td>
                        <td class="sex">${var.nxzb}</td>
                        <td class="sex">${var.lx}</td>
                        <td class="sex">${var.lxzb}</td>

                        <td class="sixty-four">${var.age_60}</td>
                        <td class="sixty-four">${var.age_60_zb}</td>

                        <td class="sixty-nine">${var.age_65}</td>
                        <td class="sixty-nine">${var.age_65_zb}</td>

                        <td class="seventy-nine">${var.age_70}</td>
                        <td class="seventy-nine">${var.age_70_zb}</td>

                        <td class="eighty-nine">${var.age_80}</td>
                        <td class="eighty-nine">${var.age_80_zb}</td>

                        <td class="ninety-nine">${var.age_90}</td>
                        <td class="ninety-nine">${var.age_90_zb}</td>

                        <td class="hundred">${var.age_100}</td>
                        <td class="hundred">${var.age_100_zb}</td>


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

    var form = layui.form;

    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#year_begin',
            type: 'year',
            value: '${pd.year_begin}',
            done: function (value) {
                $("#begins").val(value);
                gsearch();
            }
        });

        laydate.render({
            elem: '#year_end',
            type: 'year',
            value: '${pd.year_end}',
            done: function (value) {
                $("#ends").val(value);
                gsearch();
            }
        });

    });

    function gsearch() {
        $("#Form").submit();
    }
    form.on('select(select1)', function (data) {
            gsearch();
        }
    );
    form.on('checkbox(city)', function(data){
        if(data.elem.checked){
            $(".city-human").show()
        }else{
            $(".city-human").hide()
        }
    });
    form.on('checkbox(sex)', function(data){
        if(data.elem.checked){
            $(".sex").show()
        }else{
            $(".sex").hide()
        }
    });
    form.on('checkbox(age60)', function(data){
        if(data.elem.checked){
            $(".sixty-four").show()
        }else{
            $(".sixty-four").hide()
        }
    });
    form.on('checkbox(age65)', function(data){
        if(data.elem.checked){
            $(".sixty-nine").show()
        }else{
            $(".sixty-nine").hide()
        }
    });
    form.on('checkbox(age70)', function(data){
        if(data.elem.checked){
            $(".seventy-nine").show()
        }else{
            $(".seventy-nine").hide()
        }
    });
    form.on('checkbox(age80)', function(data){
        if(data.elem.checked){
            $(".eighty-nine").show()
        }else{
            $(".eighty-nine").hide()
        }
    });
    form.on('checkbox(age90)', function(data){
        if(data.elem.checked){
            $(".ninety-nine").show()
        }else{
            $(".ninety-nine").hide()
        }
    });form.on('checkbox(age100)', function(data){
        if(data.elem.checked){
            $(".hundred").show()
        }else{
            $(".hundred").hide()
        }
    });


</script>
</body>
</html>