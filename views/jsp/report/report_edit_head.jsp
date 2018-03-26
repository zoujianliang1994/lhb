<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>数据分析情况</title>
	<meta http-equiv="X-UA-Compatible" content="IE=11">
	<%@ include file="../system/index/headcss.jsp" %>
</head>
<link rel="stylesheet" type="text/css" href="<%=basePath%>static/source/public/css/report_edit_head.css">
<script type="text/javascript" src="<%=basePath%>static/source/public/js/avalon.js"></script>
<body style="background:#fff">
<div class="tableBox report_edit_head ms-controller" ms-controller="report_edit_head" >
	<div class="operationBox">
		<div class="searchBox fl">
			<input name="keywords" type="text" ms-duplex="@name" id="name"  placeholder="请创建表单名称" class="layui-input fl search">
			<div class="fl srarchBtn" >
				<i class="layui-icon">&#xe63c;</i>
			</div>
		</div>

		<button type="button" class="layui-btn fl layui-btn-blue marL-20" ms-click="save">保存</button>

		<button type="button" class="layui-btn fl layui-btn-primary marL-20" ms-click="save(1)">保存并创建图形</button>
	</div>

	<table class="layui-table center" id="table" >
		<thead>
		<tr>
			<th ms-for="(index,item) in @list" :attr="{colspan:(item.children==0?1:item.children),rowspan:(item.children==0?2:1)}" :class="(item.active? 'active':'')" ms-click="active($event,index,1)">
				{{item.name}}
				<i class="layui-icon remove" ms-if="item.name!='区域'" ms-click="remove($event,index,1)">&#x1006;</i>
			</th>
		</tr>
		<tr>
			<th  ms-for="(index,item) in @list2" ms-click="active($event,index,2)" :class="(item.active? 'active':'')">{{item.name}}
				<i class="layui-icon remove" ms-click="remove($event,index,2)">&#x1006;</i>
			</th>
		</tr>
		</thead>
	</table>

	<div class="overhidden" style="margin:10px 0 10px 0">
		<button type="button" class="layui-btn marT-10 fl layui-btn-blue insert" ms-click="inArea($event)">插入</button>
	</div>

	<h2 class="marT-20 h2 ">字段选择&nbsp;&nbsp;<span class="redspan">(*选择字段名之后才会加入图表中)</span></h2>
	<div class="containerBox marT-10">
		<div class="layui-row" style="line-height:30px">
				<div class="layui-col-xs1"  style="padding: 10px;">
					搜索:
				</div>
				<div class=" layui-col-xs11"  >
					<input type="text" style="margin: 10px;width:280px"  name="title"  lay-verify="required" placeholder="请输入搜索字段"  ms-keyup="search"  ms-duplex="@keywords" autocomplete="off" class="layui-input">
				</div>
		</div>
		<div class="layui-row" style="line-height:30px">
			<div class="layui-col-xs1" style="padding: 10px;">
				类型:
			</div>
			<ul class="layui-col-xs11" >
				<li class="item" ms-for="(index,item) in @type" ms-click="selcetType($event,index)" :class="[(item.active?'active':'')]">{{item.class_name}}</li>
			</ul>
		</div>
		<div class="layui-row" style="line-height:30px">
				<div class="layui-col-xs1"  style="padding: 10px;">
					<span class="red">字段名:</span>
				</div>
				<ul class="layui-col-xs11">
					<li class="li-item"  ms-for="(index,item) in @typeList" ms-click="add($event,index,@typeList)" :class="(item.active?'active2':'')">{{item.name}}</li>
				</ul>
		</div>

	</div>

	<h2 class="marT-20 h2 ">年龄范围</h2>
	<div class="containerBox marT-10">
		<div class="layui-row">
			<div class="layui-row" style="max-width:400px">
				<div class="layui-form-item layui-form  marT-10" >
					<label class="layui-form-label" style="width:90px">区间数值选择:</label>
					<div class="layui-input-block" style="margin-left:120px">
						<select name="city" lay-verify="required">
							<option value="0">年龄</option>
						</select>
					</div>
				</div>
			</div>

			<div class="layui-row" style="max-width:400px">
				<div class="layui-form-item marT-10 layui-form">
					<label class="layui-form-label" style="width:90px">年龄范围:</label>
					<div class="layui-input-block" style="margin-left:120px">
						<div class="layui-col-xs4 ">
							<input  name="title"  id="startAge" ms-keyup="setAgeTitle($event)" style="text-align:center" ms-duplex="@startAge" type="number" required  lay-verify="required" placeholder="起始年龄" autocomplete="off" class="layui-input">
						</div>
						<div class="layui-col-xs4 " style="padding:10px">
							<hr class="hr" />
						</div>
						<div class="layui-col-xs4 ">
							<input  name="title" id="endAge" ms-keyup="setAgeTitle($event)" style="text-align:center" ms-duplex="@endAge" type="number" required  lay-verify="required" placeholder="结束年龄" autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
			</div>
			<div class="layui-row marT-10" style="max-width:400px;position:relative">
				<label class="layui-form-label" style="width:45px">命名:</label>
				<div class="layui-input-block" style="margin-left:120px">
					<input type="text" name="title" id="ageTitle" required  ms-duplex="@ageTitle" lay-verify="required" placeholder="请输入命名" autocomplete="off" class="layui-input">
				</div>
				<button type="button" class="layui-btn fl layui-btn-blue insert" ms-click="addAgeArea($event)">确定</button>
			</div>
		</div>
		<div class="layui-row marT-10" style="height:115px">
			<label class="fl layui-col-xs1" style="color:#666;font-size:13px;line-height:38px;padding: 9px 15px;" >年龄字段:</label>

			<div class="fl agearea layui-col-xs11" style="height:115px;overflow:auto;">
				<ul>
					<li  class="li" ms-for="(index,item) in ageArr"  ms-click="add($event,index,@ageArr)" :class="[(item.active?'active':'')]">
						<span  >{{item.name}}</span>
						<i class="layui-icon remove" ms-click="removeAgeArea($event,index)">&#x1006;</i>
					</li>

				</ul>
			</div>
		</div>


	</div>

</div>




<%@ include file="../system/index/foot.jsp" %>

<script type="text/javascript">
    avalon.ready(function(){
        var vm = avalon.define({
            $id: "report_edit_head",
            hasChildren:true,
            typeList:[
            ],
            timer:"",
            type:[],
            name:'${title}',
            startAge:"",
            index:"undefined",
            jndex:"undefined",
            endAge:"",
            ageTitle:'',
            keywords:'',
			ageArr:[],
            list:[
                {name:"区域",id:"-1",children:0,active:false,class_id:-1,sign:"quyu",class_name:"区域",type:-1}
            ],
            list2:[/*{name:'男',pid:'qy'},{name:'女',pid:'qy'},{name:'男',pid:'zes'},{name:'女',pid:'zes'}*/],
            search:function(){
                var that= this;
                clearTimeout(this.timer)
                this.timer= setTimeout(function(){
                    getTypeList(that.keywords)
                    clearTimeout(that.timer)
                },1000)
            },
            selcetType:function(e,index){
                e.stopPropagation();
                this.rec(this.type);
                this.type[index].active= true;
                getTypeList(this.type[index].class_name)
			},
            remove:function(e,index,lev){
                e.stopPropagation();
                if(lev == 1){
                    var id= this.list[index].id
                    this.list.splice(index,1)
                    for(var i=0;i<this.list2.length;i++){
                        if(this.list2[i].pid == id){
                            this.list2.splice(i,1)
                            i--;
                        }
                    }
                }else{
                    var pid= this.list2[index].pid
                    this.list2.splice(index,1)
                    for(var i=0;i<this.list.length;i++){
                        if(this.list[i].id == pid){
                            this.list[i].children=this.list[i].children-1;
                            return
                        }
                    }
                }
            },
            add:function(e,index,list){
                e.stopPropagation();
               	this.rec(this.typeList)
                this.rec(this.ageArr)
                list[index].active= true;
               	var id= list[index].id;
                // var json=avalon.mix(true, [], this.typeList[index])
                if(this.jndex == "undefined"){
                    //重复字段
                    for(var i=0;i<this.list.length;i++){
                        if(id == this.list[i].id){
                            layer.msg("已经添加了此字段，请不要重复添加",{icon:2,shift:6})
                            return false
                        }
                    }
                    var json= {
                        name: list[index].name,
                        children:0,
                        class_name:list[index].class_name,
                        active:false,
                        id: list[index].id,
                        sign: list[index].sign,
                        type: list[index].type,
                        class_id: list[index].class_id
                    }
                    if(list[index].sign == "ageArea"){
						json.ageArea= list[index].ageArea;
                    }
                    if(this.hasChildren){
                        json.children = 0;
                    }
                    if(this.index=="undefined"){
                        this.list.push(json);
                    }else{
                        this.list.splice(this.index+1,0,json)
                    }
                }else{
                    var pid=  this.list2[this.jndex].pid;
                    var class_name= list[index].class_name;

					for(var key in this.list){
                        if(class_name == this.list[key].class_name && pid == this.list[key].id){
                            layer.msg("区间内不能添加相同属性的字段",{
                                icon:2,
								shift:6
							})
							return
                        }
					}
					this.rec(this.list2)
                   if(this.list2[this.jndex].newClass){
                        this.list2[this.jndex].name= list[index].name;
                        this.list2[this.jndex].class_name= list[index].class_name;
                        this.list2[this.jndex].type= list[index].type;
                        this.list2[this.jndex].sign= list[index].sign;
                        this.list2[this.jndex].newClass= false;
                        this.list2[this.jndex].pid= pid;
                        this.list2[this.jndex].active= true;
                        this.list2[this.jndex].class_id= list[index].class_id;
					   	if(this.list2[this.jndex].sign == "ageArea"){
						   this.list2[this.jndex].ageArea= list[index].ageArea;
					   	}
				   }else{
                       var json={
                           name: list[index].name,
                           class_name:list[index].class_name,
                           sign: list[index].sign,
                           type: list[index].type,
                           active:true,
                           id: list[index].id,
                           pid: pid,
                           class_id: list[index].class_id
                       }
                       if(list[index].sign == "ageArea"){
                           json.ageArea= list[index].ageArea;
                       }
                        for(var i=0;i<this.list.length;i++){
                            if(this.list[i].id == pid){
                                this.list[i].children=this.list[i].children+1;
                                this.list2.splice(this.jndex+1,0,json)
                                this.jndex++;
                                return
                            }
                        }
                    }
                }


            },
            active:function(e,index,lev){
                e.stopPropagation();
                this.rec(this.list);
                this.rec(this.list2);
                if(lev == 1){
                    this.index= index;
                    this.list[index].active= true;
                    this.jndex= "undefined";
                }else{
                    this.index= "undefined";
                    this.jndex= index;
                    this.list2[index].active= true;
                }
            },
			addAgeArea:function(e){
                e.stopPropagation();
                if(this.startAge == "" && this.endAge== ""){
                    layer.msg("请至少填写一个年龄段 ",{icon:2,shift:6})
					$("#startAge").focus();
                    return
				}
				if(this.ageTitle== ""){
                    layer.msg("请输入命名 ",{icon:2,shift:6})
                    $("#ageTitle").focus();
                    return
				}

                if(parseInt(this.endAge) <= parseInt(this.startAge) && this.endAge !="" && this.startAge !=""){
                    layer.msg("起始年龄不能大于结束年龄 ",{icon:2,shift:6})
                    $("#startAge").focus();
                    return
                }
                var id= "id"+Math.random().toString(16).substr(2);
                var json={
                    id: id,
                    ageArea:this.startAge+'-'+this.endAge,
                    class_name:"年龄区间",
                    type:-1,
                    sign:'ageArea',
                    name:this.ageTitle,
                    children:0,
                    active:false,
                    class_id:-1
                }
                this.ageArr.push(json)
			},
            removeAgeArea:function(e,index){
			    e.stopPropagation();
			    this.ageArr.splice(index,1)
			},
            inArea:function(e){
                e.stopPropagation();
                if(this.index == "undefined"){
                    layer.msg("请选中所加区间表头",{icon:2,shift:6})
					return
				}
				for(var key in this.list2){
                    if(this.list[this.index].id == this.list2[key].pid){
                        layer.msg("以生成区间,不可重复插入",{icon:2,shift:6})
                        return
					}
				}
				var json={
                    id:"",
                    name:"请选择字段",
                    active:false,
                    pid: this.list[this.index].id,
                    newClass:true,
                    class_name:"",
                    type:-1,
                    sign:'',
                    class_id:-1,
                    ageArea:""
                }
                var len=0;
                for(var i=0;i<this.index+1;i++){
                    len+= this.list[i].children
                }
                this.list[this.index].children= 1;
                this.list2.splice(len,0,json)
			},
            rec:function(arr){
                for(var i=0;i<arr.length;i++){
                    arr[i].active= false;
                    if(arr[i].children){
                        this.rec(arr[i].children)
                    }
                }
            },
            save:function(type){
                if(this.name==""){
                    layer.msg("请输入表单名称",{icon:2,shift:6})
                    return
                }
                if(this.list.length==1){
                    layer.msg("请添加表单字段",{icon:2,shift:6})
                    return
                }
                var mark= false;
                $.each(this.list2,function(){
                    if(this.name == "请选择字段"){
                     	mark= true;
                     	return false;
					}
				})
				if(mark){
                    layer.msg("请选择区间字段",{icon:2,shift:6})
                    return false
				}
                var data={
                    parentList:this.list,
                    childrenList:this.list2
                }

				layer.load(2)
                $.post("<%=basePath%>customReport/addHead",{name:this.name,headStr:JSON.stringify(data),id:'${id}'},function(data){
                    layer.closeAll("loading")
                    if(data.isSuccess){
                        layer.msg("提交成功！请在表单列表中查看表单",{icon:1})
                        parent.closeSuspensionBox();
                        if(type==1){
                            parent.addTab(vm.name+"图形分析","customReport/getHeadDataView?id="+data.id)
							return
						}

                        setTimeout(function(){
                            parent.layer.transmit.location.reload()
						},500)

					}
                })
            },
			setAgeTitle:function(e){
                e.stopPropagation();
                if(this.startAge != "" && this.endAge !=""){
                    this.ageTitle=  this.startAge+'-'+this.endAge+'岁'
                }else if(this.startAge== ""){
                    this.ageTitle= this.endAge+"岁以下"
                }else if(this.endAge== ""){
                    this.ageTitle= this.startAge+"岁以上"
				}
			}

        })
        //customReport/addHead
        getTypeList("");
        function getTypeList(keyWords){
			var keyWords= keyWords=='全部' ? "" : keyWords;
            $.post("<%=basePath%>customReport/headFieldList",{searchName:keyWords},function(data){
                    var data= JSON.parse(data);

                    $.each(data,function(){
                        this.active= false;
                        this.children= 0;
                    })
                    vm.typeList= data


            })
        }
        $.post("<%=basePath%>customReport/headFieldClassList",function(data){
                var data= JSON.parse(data);
                data.unshift({
                    class_name:"全部"
				})
                $.each(data,function(){
                    this.active= false;
                })
                vm.type= data;
        })

		if('${id}'!= ""){
            $.post("<%=basePath%>customReport/getHead",{id:'${id}'},function(data){
                if(data){
                    var data= JSON.parse(data)
                    vm.list= data.parentList;
                    vm.list2= data.childrenList;
                }
            })
		}
        $(document).on("click",function(){
            vm.rec(vm.list)
            vm.rec(vm.list2)
            vm.index= "undefined";
            vm.jndex= "undefined";
        })
        avalon.scan(document.body)
    })

</script>
</body>
</html>