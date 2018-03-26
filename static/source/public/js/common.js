$.extend({

	//数组对象中的某个字段转字符串，都好分割
	getString: function(arr,str){
		var len= arr.length;
		var data=[];
		for(var i=0;i<len;i++){
			data.push(arr[i][str])
		}
		return data.join(",")
	},//字符串转数组
	toArr:function(str){
		var arr=[];
		var strArr= str.split(",");
		for(var i=0;i<strArr.length;i++){
			if(strArr[i] != ""){
				arr.push(strArr[i])
			}
		}
		return arr;
	},//form表单变div
	formToDiv:function(mark){
		var that= this;
		if(mark){
			$(".layui-form input").each(function(){
				switch($(this).attr("type")){
					case "text":
                        that.setVal($(this),'.layui-input-block')
						break;
                    case "number":
                        that.setVal($(this),'.layui-input-block')
                        break;
                    case "checkbox":
                        if($(this)[0].checked){
                            var $block= $(this).next()
                            var title= $block.children("span").text();
                            $block.children("i").remove();
                        }else{
                            $(this).next().remove()
                        }
                        break;
                    case "radio":
                        var $next= $(this).next();
                        console.log($next)
                        if(!$next.hasClass("layui-form-radioed")){
                            $next.hide();
                        }else{
                            $next.find("i").hide();
                        }

				}

			})

            $("#sonTable input").each(function(){
                switch($(this).attr("type")) {
                    case "text":
                        that.setVal($(this), 'td')
                        break;
                }
            })
            $(".layui-form textarea").each(function(){
                that.setVal($(this),'.layui-input-block')
            })


		}
	},//给最近的父类class赋值
	setVal:function(obj,parent){
        var val= $(obj).val();
        $(obj).closest(parent).html(val);
	},//layTree选中active事件
	treeActive:function(dom){
        dom.find("a").first().addClass("active");
        dom.on("click","a",function(){
            dom.find("a").each(function(){
                $(this).removeClass("active")
            })
            $(this).addClass("active");
        })
	},
	//判断当前浏览器
    browserType:function(){
        var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
        var isOpera = userAgent.indexOf("Opera") > -1; //判断是否Opera浏览器
        var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera; //判断是否IE浏览器
        var isEdge = userAgent.indexOf("Windows NT 6.1; Trident/7.0;") > -1 && !isIE; //判断是否IE的Edge浏览器
        var isFF = userAgent.indexOf("Firefox") > -1; //判断是否Firefox浏览器
        var isSafari = userAgent.indexOf("Safari") > -1 && userAgent.indexOf("Chrome") == -1; //判断是否Safari浏览器
        var isChrome = userAgent.indexOf("Chrome") > -1 && userAgent.indexOf("Safari") > -1; //判断Chrome浏览器
        if (isIE) {
            var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
            reIE.test(userAgent);
            var fIEVersion = parseFloat(RegExp["$1"]);
            if(fIEVersion == 7)
            { return "IE7";}
            else if(fIEVersion == 8)
            { return "IE8";}
            else if(fIEVersion == 9)
            { return "IE9";}
            else if(fIEVersion == 10)
            { return "IE10";}
            else if(fIEVersion == 11)
            { return "IE11";}
            else
            { return "0"}//IE版本过低
        }//isIE end
        return false;
    },
    getCPU:function(){
        var agent=navigator.userAgent.toLowerCase();
        if(agent.indexOf("win64")>=0||agent.indexOf("wow64")>=0) return "x64";
        return navigator.cpuClass;
    }
});

(function ($) {
    $.fn.extend({
        /* 在textarea处插入文本 */
        insertContent: function (myValue, t) {
            var $t = $(this)[0];
            if (document.selection) { // ie
                this.focus();
                var sel = document.selection.createRange();
                sel.text = myValue;
                this.focus();
                sel.moveStart('character', -l);
                var wee = sel.text.length;
                if (arguments.length == 2) {
                    var l = $t.value.length;
                    sel.moveEnd("character", wee + t);
                    t <= 0 ? sel.moveStart("character", wee - 2 * t - myValue.length) : sel.moveStart("character", wee - t - myValue.length);
                    sel.select();
                }
            } else if ($t.selectionStart
                || $t.selectionStart == '0') {
                var startPos = $t.selectionStart;
                var endPos = $t.selectionEnd;
                var scrollTop = $t.scrollTop;
                $t.value = $t.value.substring(0, startPos)
                    + myValue
                    + $t.value.substring(endPos, $t.value.length);
                this.focus();
                $t.selectionStart = startPos + myValue.length;
                $t.selectionEnd = startPos + myValue.length;
                $t.scrollTop = scrollTop;
                if (arguments.length == 2) {
                    $t.setSelectionRange(startPos - t,
                        $t.selectionEnd + t);
                    this.focus();
                }
            } else {
                this.value += myValue;
                this.focus();
            }
        }
    })
})(jQuery);