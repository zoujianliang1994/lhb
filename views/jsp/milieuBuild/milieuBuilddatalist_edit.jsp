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

    <form action="affairs/${msg}.do" class="layui-form"  name="form1" id="form1" >


        <div class="layui-form-item">
            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">提交人：</label>
                    <div class="layui-input-block">
                        <input  name="submit-people" id="submit-people" placeholder="这里输入姓名" value="${pd.applyName}" type="text" placeholder="请输入角色名"
                                class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">提交处室：</label>
                    <div class="layui-input-block">
                        <input  name="submit-office" id="submit-office" placeholder="这里输入处室" value="${pd.applyUnitName}" type="text" placeholder="请输入角色名"
                                class="layui-input">
                    </div>
                </div>

            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-row">
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">提交单位：</label>
                    <div class="layui-input-block">
                        <input  name="submit-department" id="submit-department" placeholder="这里输入单位" value="" type="text" placeholder="请输入角色名"
                                class="layui-input">
                    </div>
                </div>

                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">提交日期：</label>
                    <div class="layui-input-block">
                        <input  name="submit-date" id="submit-date" placeholder="这里输入日期" value="${pd.areaName}" type="text" placeholder="请输入角色名"
                                class="layui-input">
                    </div>
                </div>

            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-row">
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <label class="layui-form-label">数据年份：</label>
                    <div class="layui-input-block">
                        <input  name="data-date" id="data-date" placeholder="这里输入年份" value="" type="text" placeholder="请输入角色名"
                                class="layui-input">
                    </div>
                </div>

            </div>
        </div>

        <blockquote class="layui-elem-quote">填表信息</blockquote>
        <p class="milieu">适老居住环境</p>
        <div class="milieu-info">
            <div class="layui-form-item">
                <div class="layui-row">
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">适老居住实施项目</label>
                        <div class="layui-input-block">
                            <input   name="suit-live" id="suit-live" placeholder="这里输入数据"  type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label unit">个</label>
                    </div>

                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">完成老年人适老改造</label>
                        <div class="layui-input-block">
                            <input   name="old-retrofit" id="old-retrofit" placeholder="这里输入数据" value="${pd.areaName}" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label unit">处</label>
                    </div>

                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-row">
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">建立紧急救援网络社区</label>
                        <div class="layui-input-block">
                            <input   name="network-community" id="network-community" placeholder="这里输入数据"  type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label unit">个</label>
                    </div>

                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">安装独立式感烟设备</label>
                        <div class="layui-input-block">
                            <input   name="smoke-detector" id="smoke-detector" placeholder="这里输入数据" value="${pd.areaName}" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label unit">处</label>
                    </div>

                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-row">
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">给与特困老年人改造经费</label>
                        <div class="layui-input-block">
                            <input   name="retrofit-money" id="retrofit-money" placeholder="这里输入数据"  type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label unit">元</label>
                    </div>



                </div>
            </div>
        </div>
        <p class="milieu">适老出行环境</p>
        <div class="milieu-info">
            <div class="layui-form-item">
                <div class="layui-row">
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">适老出行实施项目</label>
                        <div class="layui-input-block">
                            <input   name="suit-travel" id="suit-travel" placeholder="这里输入数据"  type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label unit">个</label>
                    </div>

                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">老年人公用设施无障碍改造</label>
                        <div class="layui-input-block">
                            <input   name="public-retrofit" id="public-retrofit" placeholder="这里输入数据" value="${pd.areaName}" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label unit">处</label>
                    </div>

                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-row">
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">构建社区步行网络</label>
                        <div class="layui-input-block">
                            <input   name="walk-network" id="walk-network" placeholder="这里输入数据"  type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label unit">处</label>
                    </div>

                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">提供老弱病残专座</label>
                        <div class="layui-input-block">
                            <input   name="special-seat" id="special-seat" placeholder="这里输入数据" value="${pd.areaName}" type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label unit">个</label>
                    </div>

                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-row">
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                        <label class="layui-form-label">提供老年人免费公交补贴</label>
                        <div class="layui-input-block">
                            <input   name="travel-money" id="travel-money" placeholder="这里输入数据"  type="text" placeholder="请输入角色名"
                                   class="layui-input">
                        </div>
                        <label class="layui-form-label unit">元</label>
                    </div>



                </div>
            </div>
        </div>

    </form>
    <div class="btnbox" >
        <c:if test="${pd.types=='0'}">
            <button id="sure" class="layui-btn layui-btn-primary layui-btn-small">提交</button>
        </c:if>
        <button id="cancel" class="layui-btn layui-btn-primary layui-btn-small">取消</button>
    </div>
</div>


<!-- 页面底部js¨ -->
<%@ include file="../system/index/foot.jsp"%>

<!--提示框-->
<script type="text/javascript">

    var sum ="&selAreaCode=${pd.selAreaCode}&selApplyYear=${pd.selApplyYear}&selAreaName=${pd.selAreaName}&selApplyAnnual=${pd.selApplyAnnual }";

    if("${pd.types}"=="1"){

        $.formToDiv(true);
    }
    function typeControl(control) {
        if(control == "1"){
            $("#law_type_block").hide();

        }else{
            $("#law_type_block").show()
        }

    }
    layui.use('laydate', function () {
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#applyYear'
            ,type: 'year'
        })
    });
    $(document).ready(function(){
        var form= layui.form;
        typeControl(${pd.type});

        $("#sure").on("click",function(){
            if ($("#applyYear").val() == "") {
                layer.tips('请检查输入数据',  $("#applyYear"), {
                    tips: [4, '#D16E6C'],
                    time: 4000
                });
                $("#applyYear").focus();
                return false;
            }

            if ($("#mcgysyclcs").val() == ""||isNaN($("#mcgysyclcs").val())||$("#mcgysyclcs").val()<0) {
                layer.tips('请检查输入数据',  $("#mcgysyclcs"), {
                    tips: [4, '#D16E6C'],
                    time: 4000
                });
                $("#mcgysyclcs").focus();
                return false;
            }

            if ($("#xsbzfwbtzrs").val() == ""||isNaN($("#xsbzfwbtzrs").val())||$("#xsbzfwbtzrs").val()<0) {
                layer.tips('请检查输入数据',  $("#xsbzfwbtzrs"), {
                    tips: [4, '#D16E6C'],
                    time: 4000
                });
                $("#xsbzfwbtzrs").focus();
                return false;
            }
            if ($("#xsbzfwbtzje").val() == ""||isNaN($("#xsbzfwbtzje").val())||$("#xsbzfwbtzje").val()<0) {
                layer.tips('请检查输入数据',  $("#xsbzfwbtzje"), {
                    tips: [4, '#D16E6C'],
                    time: 4000
                });
                $("#xsbzfwbtzje").focus();
                return false;
            }


            var page ="${pd.currentPage}";

            $("#form1").ajaxSubmit({
                type: 'post',
                success: function(data) {
                    if ("success" == data.msg) {
                        parent.layer.transmit.location.href = "<%=basePath%>affairs/list.do?currentPage=" + page+sum;
                        parent.layer.closeAll();
                    } else if ("error" == data.msg) {
                        layer.msg('系统异常,保存失败!', {icon: 5});
                    } else if("false" == data.msg){
                        layer.msg('相同类型数据已存在!', {icon: 5});
                    }
                }
            });

        });

        $("#cancel").on("click",function(){
            parent.layer.closeAll();
        })
    });


</script>
</body>
</html>

