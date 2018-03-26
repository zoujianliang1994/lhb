<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ include file="./headcss.jsp" %>
<div class="header">
    <div class="logo"></div>
    <div class="navs">
        <c:if test="${user.USERNAME!='superAdmin'&&hasMap}">
            <a class="nav" data-type="map" title="地图" href="<%=basePath%>to_map_list.do?areaCode=${areaCode}&menuId=${menuId}">地图</a>
            <c:if test="${areaCode!=''&&menuId!=''}">
                <a class="nav" data-type="module" title="功能菜单" href="<%=basePath%>to_module.do?areaCode=${areaCode}&menuId=${menuId}">功能菜单</a>
            </c:if>
            <c:if test="${areaCode==''&&menuId==''}">
                <a class="nav" data-type="module" title="功能菜单" href="<%=basePath%>to_module_list.do">功能菜单</a>
            </c:if>
        </c:if>
    </div>
    <div class="avatar hide" data-uid="${user.USER_ID}">
        <div class="sayhi">
            <span class="time"></span>
            <span class="nickname">${user.NAME}</span>
        </div>
        <div class="user">
            <ul class="layui-nav ">
                <li class="layui-nav-item" style="line-height:0">
                    <a href="javascript:void(0);">
                        <img class="layui-nav-img" src="<%=basePath%>static/source/public/images/avatar.png"
                             onerror="this.src='<%=basePath%>static/source/public/images/avatar.png'"/>
                             <c:if test="${num!=''&&num!=0}">
		                        <i class="message_num">
		                            ${num} 
		                        </i>
                        </c:if>
                    </a>
                    <dl class="layui-nav-child" style="text-align:center">
                        <dd>
                            <a id="updatePw" href="javascript:">修改密码</a>
                        </dd>
                        <dd>
                            <a  href="<%=basePath%>personalpanel/to_personalpanel.do">个人消息</a>
                        </dd>
                        <dd onclick="logOut();">
                            <a href="javascript:">登出</a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
</div>
<%@ include file="../index/foot.jsp" %>
<script type="text/javascript">
    //修改密码
    $("#updatePw").on("click", function () {
        parent.parent.layer.edit = window;
        parent.parent.layer.open({
            title: "修改密码",
            type: 2,
            content: '<%=basePath%>user/goEditPassWord?USER_ID=${user.USER_ID}',
            area: ["500px", "400px"]
        });
    });
</script>
