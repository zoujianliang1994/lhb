(function ($) {

    function Stree(options) {
        this.init(options);
    }

    Stree.prototype = {
        oldData: [],
        isSingle: false,
        isAclick: false,
        iShow: false,
        init: function (options) {
            this.data = options.data;
            this.$el = options.el;
            if (options.type) {//查看
                this.$el.html(options.title);
                return
            }
            this.arr = [];
            if (options.isSingle) this.isSingle = options.isSingle;
            if (options.oldData) this.oldData = options.oldData;
            if (options.iShow) this.iShow = options.iShow;
            this.$el.html("");
            this.initEl(options.title);
            this.each(this.data);
            this.onEvent();
            this.cheakedOldData();
            this.callback = options.callback;
            this.switchCallback = options.switchCallback;
            if (!options.title) this.setTit();
        },
        initEl: function (title) {
            var div = '<div class="layui-form-select">' +
                '<input class="layui-input input" type="text" style="color:#333" placeholder="请选择" autocomplete="off"  value="' + title + '"/>' +
                '<i class="layui-edge"></i>' +
                '</div>' +
                '<div class="treeBox lev0" style="' + (this.iShow ? "display:block" : "") + '">' +
                '<div class="treeItem"  style="' + (this.isSingle ? "display:none" : "") + '">' +
                '<div class="title" style="color:#2196F3">全选</div>' +
                '<div class="item-label allCheaked">' +
                '<i class="icon-gou iconfont checked" ></i>' +
                '</div>' +
                '</div>' +
                '</div>';
            this.$el.append(div);
        },
        each: function (arr) {
            for (var i = 0; i < arr.length; i++) {
                var lev = i + 1;
                arr[i].lev = lev;
                this.operation(arr[i], lev);

                if (arr[i].children != undefined && arr[i].children != "") {
                    this.rec(arr[i].children, function (obj, index) {
                        this.operation(obj, index);
                    }, lev)
                }
            }
        },
        rec: function (arr, callback, index) {
            for (var i = 0; i < arr.length; i++) {
                if (index) {
                    var temp = index + "-" + (i + 1);
                    arr[i].lev = temp;
                }
                if (callback) callback.call(this, arr[i], temp);
                if (arr[i].children != undefined && arr[i].children != "") {
                    this.rec(arr[i].children, callback, temp)
                }

            }
        },
        operation: function (obj, index) {
            this.create(obj);
            var indexArr = index.toString().split("-");
            var len = indexArr.length;
            //第一级
            if (len == 1) {
                this.$el.find(".lev" + 0).append(this.$dom);
                return
            }
            //之后
            this.$dom.children(".treeItem").css({
                "padding-left": 33 + 10 * len
            });
            this.$dom.find(".item-switch").css({
                "left": 10 + 10 * len
            });
            indexArr.pop();
            var parentIndex = indexArr.join("-");
            this.$el.find(".lev" + parentIndex).children(".itemBox").append(this.$dom)
        },
        create: function (options) {
            if (options.isChecked) this.arr.push(options);
            //如果选中
            this.$dom = $('<div class="itemBox lev' + options.lev + '" lev="' + options.lev + '">' +
                '<div class="treeItem ' + (options.isChecked ? "active" : "") + '">' +
                '<div class="item-switch" style="' + (options.children == "" && !options.hasNext || options.children == undefined ? "display:none" : "") + '">' +
                '<span class="iconfont icon-jia item-switch-icon" ></span>	' +
                '</div>' +
                '<div class="title">' +
                 options.title +
                '</div>' +
                '<div class="item-label item-cheaked">' +
                '<i class="icon-gou iconfont checked" ></i>' +
                '</div>' +
                '</div>' +
                '<div class="itemBox" style="display:none">' +
                '</div>' +
                '</div> ')
        },
        onEvent: function () {
            this.active();
            this.ofcous();
            this.switchIcon();
            this.allCheaked();
        },
        ofcous: function () {
            var that = this;
            this.$el.find("input").on("focus", function () {
                that.$el.find(".lev0").show();
            });
            $(document).on("click", function () {
                if (!that.iShow) {
                    that.$el.find(".lev0").css("display", "none");
                }
            });
            $(this.$el).on("click", function (e) {
                e.stopPropagation();
            });

            this.$el.on("click", ".title", function () {
                $(this).next().click();
            });

            this.$el.on("click", ".layui-edge", function () {
                $(this).prev().focus()
            })
        },
        active: function (mark) {
            var that = this;
            this.$el.on("click", ".item-cheaked", function () {
                that.isAclick = false;
                var $parent = $(this).closest(".treeItem");
                //视图
                if (that.isSingle) {
                    that.$el.find(".treeItem").each(function () {
                        $(this).removeClass("active")
                    })
                }
                $parent.toggleClass("active");
                var isActive = $parent.hasClass("active");
                var lev = $(this).closest(".itemBox").attr("lev");
                //数据
                if (isActive) {
                    that.findOne(lev, function (obj) {
                        if (!that.isSingle) {
                            that.arr.push(obj)
                        } else {
                            that.arr = [];
                            that.arr.push(obj);
                            // that.$el.find(".lev0").hide();
                            if (that.initOver) {
                                that.$el.find(".lev0").hide();
                            }
                        }
                        if (that.callback) that.callback(obj);
                    })
                } else {
                    that.del(lev)

                }
                that.setTit();
            })
        },
        setTit: function () {
            if (!this.isAclick) {
                var nameStr = this.getStr('title');
                this.$el.find(".input").val(nameStr);
                //if(this.callback)this.callback(obj);
            }
        },
        getStr: function (name) {
            var arr = [];
            for (var i = 0; i < this.arr.length; i++) {
                arr.push(this.arr[i][name]);
            }
            return arr.join(",")
        },
        switchIcon: function () {
            var that = this;
            this.$el.on("click", ".item-switch", function () {
                var lev = $(this).closest(".itemBox").attr("lev");
                var $itemBox = $(this).closest(".treeItem").next();
                var $icon = $(this).children("span");
                $icon.toggleClass("icon-jian");
                if ($(this).children("span").hasClass("icon-jian")) {
                    $icon.removeClass("icon-jia");
                    $itemBox.slideDown(200);
                    that.findOne(lev, function (obj) {
                        if (that.switchCallback) that.switchCallback(obj)
                    })
                } else {
                    $icon.addClass("icon-jia");
                    $itemBox.slideUp(200)
                }
            })
        },
        allCheaked: function () {
            var that = this;
            this.$el.on("click", ".allCheaked", function () {
                that.isAclick = true;
                var $parent = $(this).closest(".treeItem");
                $parent.toggleClass("active");
                var isActive = $parent.hasClass("active");
                var $item = that.$el.find(".item-cheaked");
                if (isActive) {
                    $item.each(function () {
                        if (!$(this).closest(".treeItem").hasClass("active")) {
                            $(this).click();
                        }
                    })
                } else {
                    $item.each(function () {
                        if ($(this).closest(".treeItem").hasClass("active")) {
                            $(this).click();
                        }
                    })
                }
                that.isAclick = false;
                that.setTit();
            })
        },
        cheakedOldData: function () {
            var that = this;
            for (var i = 0; i < this.oldData.length; i++) {
                var id = this.oldData[i];
                this.findOne(id, function (obj) {
                    if (!obj.isChecked) {
                        that.$el.find(".lev" + obj.lev).children(".treeItem").children(".item-cheaked").click()
                    }
                })
            }
            this.isAclick = false;
            //this.setTit();
        },
        del: function (lev) {
            for (var i = 0; i < this.arr.length; i++) {
                if (lev == this.arr[i].lev) {
                    this.arr.splice(i, 1);
                    break;
                }
            }
        },
        findOne: function (lev, callback) {
            this.rec(this.data, function (obj) {
                if (lev == obj.lev || lev == obj.id || lev == obj.areaCode) {
                    if (callback) callback(obj)
                }

            })
        },
        refresh: function (data) {
            this.data = data;
            this.each(this.data);
        },
        addData: function (options) {
            var $this = this;
            $.post(options.url, options.opt, function (data) {
                //是否还展示下级

                //数据
                $this.findOne(options.id, function (obj) {
                    if (obj.children == "") {
                        obj.children = data;
                    }

                    $this.rec(data, function (obj, index) {
                        if (obj.level == options.index) {
                            obj.hasNext = false;
                        }
                        $this.operation(obj, index);
                    }, obj.lev)
                });
                //默认选中
                //sTree.cheakedOldData();
            })
        }
    };

    $.extend({
        Stree: function (options) {
            return new Stree(options);
        }
    })

})(jQuery);