<script type="text/javascript" src="<%=basePath%>static/source/public/js/jquery-1.8.3.min.js"></script>

<script type="text/javascript" src="<%=basePath%>static/source/layui/layui.all.js"></script>

<script type="text/javascript" src="<%=basePath%>static/source/public/js/echarts.min.js"></script>
<script type="text/javascript" src="<%=basePath%>static/source/public/js/walden.js"></script>
<script type="text/javascript" src="<%=basePath%>static/source/public/plugin/js/treeView.js"></script>
<script type="text/javascript" src="<%=basePath%>static/source/public/plugin/js/sTree.js"></script>
<script type="text/javascript" src="<%=basePath%>static/source/public/plugin/js/tree.js"></script>
<script type="text/javascript" src="<%=basePath%>static/source/public/js/llw.js"></script>
<script type="text/javascript" src="<%=basePath%>static/source/public/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>static/source/public/js/socket.io/socket.io.js"></script>
<script type="text/javascript" src="<%=basePath%>static/js/jquery.form.js"></script>
<script type="text/javascript" src="<%=basePath%>static/js/jquery.base64.js"></script>
<script type="text/javascript" src="<%=basePath%>static/source/public/js/idnCheck.js"></script>


<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
  <script src="<%=basePath%>static/source/public/js/html5.min.js"></script>
  <script src="<%=basePath%>static/source/public/js/respond.min.js"></script>
<![endif]-->

<script>
  //兼容ie8的
window.console = window.console || (function () {
    var c = {}; c.log = c.warn = c.debug = c.info = c.error = c.time = c.dir = c.profile
    = c.clear = c.exception = c.trace = c.assert = function () { };
    return c;
})();

  //console.log("%c\n","font-size:81px;background:url('http://www.baidu.com/img/bdlogo.gif') no-repeat 0 0");
  //已选中 就不能选了
  $(".navs .nav").on("click",function(e){
      console.log(e)
      if($(this).hasClass("current")){
          if ( e && e.preventDefault ) {
              //阻止默认浏览器动作(W3C)
              e.preventDefault();
          }else{
              //IE中阻止函数器默认动作的方式
              window.event.returnValue = false;
              return false;
          }
      }
  })
  // llw的画面操作们
  document.onkeydown = function(e){
      var ev =document.all ? window.event : e;
      if(ev.keyCode==13) {
          return false
      }
  }

  $(function(){
    LLW.setnav('module');
    LLW.showavatar();
  });
</script>