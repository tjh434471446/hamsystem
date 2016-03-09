/**
 * Created by NM on 2014/3/27.
 */
var datePicker = function (con) {
    //默认值
    var defaults = {
        el: '#datePicker',         //select插入到此el中
        name: 'datePicker',        //select的id前缀
        val: 'now',                //默认选定值
        min: [-70, 0, 0],            //最小值    70岁
        max: [-16, 0, 0],            //最大值    16岁
        minNowMaxVal: [3, 0, 0],     //当最小值为now时,最大值的范围 默认:3年
        lang: {                    //单位: 年/月/日
            y: '',
            m: '',
            d: ''
        }
    };
    var con = $.extend(defaults, con);

    //当前时间
    var d = new Date();
    var now = {
        y: d.getFullYear(),
        m: d.getMonth() + 1,
        d: d.getDate()
    }

    //可选最小值
    var min = {};
    if (con.min == 'now') {
        min.y = now.y;
        min.m = now.m;
        min.d = now.d;
    } else if (con.min) {
        min.y = now.y + con.min[0];
        min.m = now.m + con.min[1];
        min.d = now.d + con.min[2];
    }

    //可选最大值
    var max = {};
    if (con.min == 'now') {
        con.max = con.minNowMaxVal;
    }
    max.y = now.y + con.max[0];
    max.m = now.m + con.max[1];
    max.d = now.d + con.max[2];

    //select默认选定值
    var val = {};
    if (con.val == 'now') {
        val.y = now.y;
        val.m = now.m;
        val.d = now.d;
    } else if (con.val) {
        var _now = con.val.split('-');
        val.y = _now[0];
        val.m = _now[1];
        val.d = _now[2];
    }

    //实例化
    new Y({
        e: con.el,
        name: con.name,
        min: min.y,
        max: max.y,
        lang: con.lang.y,
        val: val.y
    });
    new M({
        e: con.el,
        name: con.name,
        min: 1,
        max: 12,
        _min: min.m,
        _max: max.m,
        lang: con.lang.m,
        val: val.m
    });
    new D({
        e: con.el,
        name: con.name,
        min: 1,
        max: 31,
        _min: min.d,
        _max: max.d,
        lang: con.lang.d,
        val: val.d
    });
};
//---
var run = false;    //是否闰年
var MyModel = Backbone.Model.extend();
var MyView = Backbone.View.extend();
var modelY = new MyModel;
var modelM = new MyModel;
var modelD = new MyModel;
var minY = false;
var minM = false;
var maxY = false;
var maxM = false;
//下拉菜单视图类
var Select = MyView.extend({
    tagName: 'select',
    initialize: function (con) {
        $(this.el).off();
        this.model.set({
            min: con.min,
            max: con.max,
            _min: con._min || con.min,
            _max: con._max || con.max,
            val: con.val
        });
        this.name = con.lang;
        this.render();
        $(this.el).attr('id', con.name + this.type);
        $(con.e).append(this.el);
        if (this.type != 'D') {
            $(con.e).append('&nbsp;');
        }
    },
    render: function () {
        this.listenTo(this.model, 'change', this.render);
        var min = this.model.get('min');
        var max = this.model.get('max');
        var val = this.model.get('val');
        var html = [];
        for (var i = min; i <= max; i++) {
            html.push('<option value="' + i + '" ' + (val == i ? "selected=selected" : "") + '>' + (i < 10 ? '0' + i : i) + this.name + '</option>');
        }
        $(this.el).html(html.join(''));
        $(this.el).change();
    }
});
//年
var Y = Select.extend({
    type: 'Y',
    model: modelY,
    events: {
        'change': 'changeVal'
    },
    changeVal: function () {
        var y = $(this.el).val();
        //判断是否为闰年
        if ((y % 4 == 0 && y % 100 != 0) || (y % 100 == 0 && y % 400 != 0)) {
            run = true;
        } else {
            run = false;
        }

        minY = y == modelY.get('min') ? true : false;
        maxY = y == modelY.get('max') ? true : false;

        modelM.set({
            min: minY ? modelM.get('_min') : 1,
            max: maxY ? modelM.get('_max') : 12,
            y: y
        });
    }
});
//月
var M = Select.extend({
    type: 'M',
    model: modelM,
    events: {
        'change': 'changeVal'
    },
    changeVal: function () {
        var min = 1;
        var max = 1;
        var m = $(this.el).val();
        //计算当前月的天数
        var s = ['4', '6', '9', '11'];
        if (m == 2) {
            if (run) {
                max = 29;
            } else {
                max = 28;
            }
        } else if (_.indexOf(s, m) < 0) {
            max = 31;
        } else {
            max = 30;
        }
        ;

        minM = m == modelM.get('min') ? true : false;
        maxM = m == modelM.get('max') ? true : false;

        modelD.set({
            min: minY && minM ? modelD.get('_min') : min,
            max: maxY && maxM ? modelD.get('_max') : max,
            m: m
        });
    }
});
//日
var D = Select.extend({
    type: 'D',
    model: modelD
});