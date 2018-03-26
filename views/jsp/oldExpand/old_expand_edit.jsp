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
</head>
<style>
	.layui-input2{
		width:100%;
		text-align:center;
		border:0;
		/* height: 25px; */
	}
	.layui-table tbody tr:hover, .layui-table-hover{
		background:#fff!important
	}
</style>
<body >
<div class="edit_menu" class="disnone">
	<form action="oldExpand/${msg}.do" class="layui-form" name="form1" id="form1" method="post" >
		<input type="hidden" name="id" id="id" value="${pd.id}" />
		<input type="hidden" name="szqy_code" id="szqy_code" value="${null == pd.szqy_code ? user.areaCode:pd.szqy_code}" />

		<div class="layui-form-item">
			<div class="layui-row">

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">填表人：</label>
					<div class="layui-input-block">
						<input  name="tbr" id="tbr"  value="${null == pd.tbr ? user.NAME:pd.tbr}" type="text" 
								class="layui-input" readonly style="background-color: #f2f2f2">
					</div>
				</div>

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">填表单位：</label>
					<div class="layui-input-block">
						<input  name="tbdw" id="tbdw" value="${null == pd.tbdw ? user.SECTION_NAME:pd.tbdw}" type="text" 
								class="layui-input" readonly style="background-color: #f2f2f2">
					</div>
				</div>

			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label">填表日期：</label>
					<div class="layui-input-block">
						<input  name="tbrq" id="tbrq"  value="${null == pd.tbrq ? date:pd.tbrq}" type="text" 
								class="layui-input" readonly style="background-color: #f2f2f2">
					</div>
				</div>

				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>上报年份：</label>
					<div class="layui-input-block">
									<input  name="sbnf" id="sbnf"  value="${pd.sbnf}" type="text"required lay-verify="required"  placeholder="点击选择年份" autocomplete="off"
											class="layui-input">
								</div>
				</div>

			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<label class="layui-form-label"><i class="require">*</i>年度：</label>
					<div class="layui-input-block">
					 <html:select name="nd" classs="layui-input-inline" >
                            <html:options collection="nd"  defaultValue="${pd.nd}"></html:options>
                        </html:select>
					</div>
				</div>
			</div>
		</div>


		<div class="layui-col-sm12">
			<table class="layui-table center ms-controller" id="table"  ms-controller="table">
				<colgroup>
					<col width="50">
					<col >
					<col width="200">
					<col width="200">
				</colgroup>
				<thead>
				<tr>
					<th colspan="4">活动信息</th>
				</tr>
				<tr>
					<th colspan="2">社会参与活动类型</th>
					<th>活动数量</th>
					<th>参与老年人总人数</th>
				</tr>
				</thead>
				<tbody ms-validate="@validate">
					<tr ms-for="(index,item) in @list">
						<%--<td ms-if="item.title != '' ">{{item.title}}</td>--%>
						<td ms-if="item.title == '老年人志愿服务' " rowspan="8">{{item.title}}</td>
						<td :attr="{colspan:(item.title == '' ? 2 : 1)}">
							{{item.title2}}
							<input type="hidden" ms-duplex="item.value" :attr="{name:item.name}"/>
						</td>
						<td ms-if="!item.modifyAct" ms-click="modifyAct(index)" >
							{{item.actNum}}
							<input type="hidden" ms-duplex="item.actNum" :attr="{name:item.actName}"/>
						</td>
						<td ms-if="item.modifyAct" >
							<input class="layui-input2" ms-blur="modifyAct(index)" ms-focus="focus"  type="number"  data-duplex-focus="true"  autocomplete="off"  ms-duplex="item.actNum" ms-keyup="rules(index,'actNum')"/>
						</td>
						<td ms-if="!item.modifyPeop" ms-click="modifyPeop(index)">
							{{item.peopNum}}
							<input type="hidden" ms-duplex="item.peopNum" :attr="{name:item.peopName}"/>
						</td>
						<td ms-if="item.modifyPeop" >
							<input class="layui-input2" ms-blur="modifyPeop(index)" ms-focus="focus" data-duplex-focus="true" type="number"    autocomplete="off"  ms-duplex="item.peopNum" ms-keyup="rules(index,'peopNum')"/>
						</td>
					</tr>
				</tbody>
			</table>
	</form>

	<div class="btnbox" >
		<button id="sure" class="layui-btn layui-btn-primary layui-btn-small">保存</button>
		<button id="cancel" class="layui-btn layui-btn-primary layui-btn-small">取消</button>
	</div>
</div>


	<!-- 页面底部js¨ -->
	<%@ include file="../system/index/foot.jsp"%>
	<script type="text/javascript" src="<%=basePath%>static/source/public/js/avalon.js"></script>
	<!--提示框-->
	<script type="text/javascript">

		//初始化日期控件
		layui.use('laydate', function () {
	        var laydate = layui.laydate;
	
	        //执行一个laydate实例
	        laydate.render({
	            elem: '#sbnf'
	            ,type: 'year',
	            value:new Date()
	        })
	    });

        $(document).ready(function(){
            $("#form1").on("submit",function(){
                 return false;
            });
            if (${pd.TYPE == '1'}) {
            	$.formToDiv(true);
                $(".btnbox").hide();
            } else {
                $(".btnbox").show();
            }
            $("#sure").on("click",function(){
            	if ($("#sbnf").val() == "") {
                    layer.tips('上报年份不能为空', $("#sbnf"), {
                        tips: [3, '#D16E6C'],
                        time: 4000
                    });
                    $("#sbnf").focus();
                    return false;
                }
               var page =${pd.currentPage};
              // console.log($('#form1').serialize())
               parent.layer.load(1);
               $.post('<%=basePath%>oldExpand/${msg}.do',$('#form1').serialize(), function (data) {
                	parent.layer.closeAll('loading');
                    if ("success" == data.result) {
                         parent.layer.edit.location.href = "<%=basePath%>oldExpand/list.do?id=${id}&currentPage=${pd.currentPage}";
                       	 parent.layer.closeAll();
                    } else {
                        layer.msg('系统异常,保存失败!', {icon: 5});
                    }
                });
            });

            $("#cancel").on("click",function(){
                parent.layer.closeAll();
            })

            var vm= avalon.define({
                $id:"table",
				iswatch:${pd.TYPE == '1'},
                list:[
                    {title:"",title2:"自主创业",name:"hdlx_zzcy",value:"1",actName:"hdsl_zzcy",actNum:"${pd.hdsl_zzcy}",peopName:"cyzs_zzcy",peopNum:"${pd.cyzs_zzcy}",modifyAct:false,modifyPeop:false},
                    {title:"老年人志愿服务",title2:"参与基层民主监督",name:"hdlx_mzjd",value:"2",actName:"hdsl_mzjd",actNum:"${pd.hdsl_mzjd}",peopName:"cyzs_mzjd",peopNum:"${pd.cyzs_mzjd}",modifyAct:false,modifyPeop:false},
                    {title:"1",title2:"社会治安",name:"hdlx_shza",value:"3",actName:"hdsl_shza",actNum:"${pd.hdsl_shza}",peopName:"cyzs_shza",peopNum:"${pd.cyzs_shza}",modifyAct:false,modifyPeop:false},
                    {title:"1",title2:"参与公益慈善",name:"hdlx_gycs",value:"4",actName:"hdsl_gycs",actNum:"${pd.hdsl_gycs}",peopName:"cyzs_gycs",peopNum:"${pd.cyzs_gycs}",modifyAct:false,modifyPeop:false},
                    {title:"1",title2:"参与移风易俗",name:"hdlx_yfys",value:"5",actName:"hdsl_yfys",actNum:"${pd.hdsl_yfys}",peopName:"cyzs_yfys",peopNum:"${pd.cyzs_yfys}",modifyAct:false,modifyPeop:false},
                    {title:"1",title2:"参与民事调解",name:"hdlx_mstj",value:"6",actName:"hdsl_mstj",actNum:"${pd.hdsl_mstj}",peopName:"cyzs_mstj",peopNum:"${pd.cyzs_mstj}",modifyAct:false,modifyPeop:false},
                    {title:"1",title2:"参与文教卫生",name:"hdlx_wjws",value:"7",actName:"hdsl_wjws",actNum:"${pd.hdsl_wjws}",peopName:"cyzs_wjws",peopNum:"${pd.cyzs_wjws}",modifyAct:false,modifyPeop:false},
                    {title:"1",title2:"参与全民健身",name:"hdlx_qmjs",value:"8",actName:"hdsl_qmjs",actNum:"${pd.hdsl_qmjs}",peopName:"cyzs_qmjs",peopNum:"${pd.cyzs_qmjs}",modifyAct:false,modifyPeop:false},
                    {title:"1",title2:"其他",name:"hdlx_qt",value:"9",actName:"hdsl_qt",actNum:"${pd.cyzs_qmjs}",peopName:"cyzs_qt",peopNum:"${pd.cyzs_qt}",modifyAct:false,modifyPeop:false},
                    {title:"",title2:"发挥自身优势助推当地经济发展",name:"hdlx_jjfz",value:"10",actName:"hdsl_jjfz",actNum:"${pd.hdsl_jjfz}",peopName:"cyzs_jjfz",peopNum:"${pd.cyzs_jjfz}",modifyAct:false,modifyPeop:false}
				],
                modifyAct:function(index,dom){
                	
				    if(this.iswatch){
				        return
					}
                    this.list[index].modifyAct= !this.list[index].modifyAct  ;
                    $(".layui-input2").focus();
				},
                modifyPeop:function(index){
                    if(this.iswatch){
                        return
                    }
                    this.list[index].modifyPeop= !this.list[index].modifyPeop;
                    $(".layui-input2").focus();
                },
				rules:function(index,key){
                    if(this.list[index][key].length>=8){
                        this.list[index][key]=this.list[index][key].substring(0,8)
					}
				},
                focus:function(){
				    console.log("focus默认选中")
				}


            })


            avalon.scan(document.body)

           /* $(window).on("click",function(){
                $.each(vm.list,function(){
                    this.modifyAct= false;
                    this.modifyPeop= false;
                })
            })*/
        });


	</script>
</body>
</html>

