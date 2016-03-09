var datePicker = function (con) {
    //Ĭ��ֵ
    var defaults = {
        el: '#datePicker',         //select���뵽��el��
        name: 'datePicker',        //select��idǰ׺
        val: 'now',                //Ĭ��ѡ��ֵ
        min: [-100, 0, 0],            //��Сֵ    70��
        max: [-100, 0, 0],            //���ֵ    16��
        minNowMaxVal: [3, 0, 0],     //����СֵΪnowʱ,���ֵ�ķ�Χ Ĭ��:3��
        lang: {                    //��λ: ��/��/��
            y: '',
            m: '',
            d: ''
        }
    };
    var con = $.extend(defaults, con);

    //��ǰʱ��
    var d = new Date();
    var now = {
        y: d.getFullYear(),
        m: d.getMonth() + 1,
        d: d.getDate()
    }

    //��ѡ��Сֵ
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

    //��ѡ���ֵ
    var max = {};
    if (con.min == 'now') {
        con.max = con.minNowMaxVal;
    }
    max.y = now.y + con.max[0];
    max.m = now.m + con.max[1];
    max.d = now.d + con.max[2];

    //selectĬ��ѡ��ֵ
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

    //ʵ����
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
var run = false;    //�Ƿ�����
var MyModel = Backbone.Model.extend();
var MyView = Backbone.View.extend();
var modelY = new MyModel;
var modelM = new MyModel;
var modelD = new MyModel;
var minY = false;
var minM = false;
var maxY = false;
var maxM = false;
//�����˵���ͼ��
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
//��
var Y = Select.extend({
    type: 'Y',
    model: modelY,
    events: {
        'change': 'changeVal'
    },
    changeVal: function () {
        var y = $(this.el).val();
        //�ж��Ƿ�Ϊ����
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
//��
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
        //���㵱ǰ�µ�����
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
//��
var D = Select.extend({
    type: 'D',
    model: modelD
});