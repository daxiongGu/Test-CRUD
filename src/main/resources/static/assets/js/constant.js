var contentPath = "";

function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    var context = "";
    if (r != null) {
        context = r[2];
    }
    reg = null;
    r = null;
    return context == null || context == "" || context == "undefined" ? "" : context;
}

function imageInit() {
    var appTemp = this;
    var id ="";
    if (appTemp.id != undefined){
        id = appTemp.id;
    }
    $( id + ' .fileupload-btn').each(function () {
        var key = $(this).data('key');
        var type = $(this).data('type');
        var groupName = $(this).data('group');
        var myDropzone = new Dropzone(this, {
            url: contentPath+"/api/file/upload?category=" + type,
            previewsContainer: $(this).attr('_target'),
            previewTemplate: '<div class="custom-dz-preview-box"><img data-dz-thumbnail /><a class="custom-dz-preview-box-delete" href="javascript:;">删除</a></div>'
        });
        myDropzone.on("success", function (file, resp) {
            var data = {
                orderNo: appTemp.orderNo,
                videoKey: key,
                imageType: type,
                groupName: groupName,
                videoValue: resp.data.key
            };
            appTemp.$http.post(contentPath+"/api/file/save", data).then(function (response) {
                appTemp.uploadedFiles[file.name] = response.data.data;
            }, function (response) {
                sweetAlert(response.data.message, "错误码" + response.data.code, "error");
            });
        });
    });

    $('body').on('click', id + ' .custom-dz-preview-box-delete', function () {
        var name = $(this).prev().attr('alt');
        var imageId = $(this).data('id') || appTemp.uploadedFiles[name].id;
        var thisTemp = $(this);
        swal({
                title: "你确定删除该照片",
                text: "删除后，将无法找回该文件",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "是",
                cancelButtonText:"取消",
                closeOnConfirm: false
            },
            function(){
                appTemp.$http.post(contentPath+"/api/file/del?imageId=" + imageId)
                    .then(function (response) {
                        thisTemp.parent('.custom-dz-preview-box').remove();
                        swal({
                            title: "已删除",
                            text: "改图片已经删除",
                            timer: 1000,
                            showConfirmButton: false
                        });
                    }, function (response) {
                        swal("删除失败!", response.data.message, "success");
                    });
            });
    });

    $('body').on('click', id +  ' .custom-dz-preview-box img', function () {
        var localPath = $(this).attr('alt');
        // var remotePath = '';
        // if (localPath && appTemp.uploadedFiles[localPath].videoValue) {
        //     remotePath = appTemp.uploadedFiles[localPath].videoValue;
        // } else {
        //     remotePath = $(this).attr('real');
        // }
        appTemp.$http.get(contentPath+"/api/file/view?path=" + localPath)
            .then(function (response) {
                layer.open({
                    type: 1,
                    title: '图片信息',
                    area: ['700px', '600px'],
                    shade: 0,
                    offset: [Math.random() * ($(window).height() - 480),
                        Math.random() * ($(window).width() - 300)
                    ],
                    maxmin: true,
                    content: '<div id="viewImg' + appTemp.imgBox
                    + '" class="viewer iviewer_cursor"></div>',
                    zIndex: layer.zIndex,
                    success: function (layero) {
                        layer.setTop(layero);
                        $("#viewImg" + appTemp.imgBox).iviewer({src: response.data.data,zoom_base: 100,zoom: 100,zoom_min: 25});
                    }
                });
            }, function (response) {
                sweetAlert(response.data.message, "错误码" + response.data.code, "error");
            });
        appTemp.imgBox = appTemp.imgBox + 1;
    });
};

var digitUppercase = function(n) {
    var fraction = ['角', '分'];
    var digit = [
        '零', '壹', '贰', '叁', '肆',
        '伍', '陆', '柒', '捌', '玖'
    ];
    var unit = [
        ['元', '万', '亿'],
        ['', '拾', '佰', '仟']
    ];
    var head = n < 0 ? '欠' : '';
    n = Math.abs(n);
    var s = '';
    for (var i = 0; i < fraction.length; i++) {
        s += (digit[Math.floor(n * 10 * Math.pow(10, i)) % 10] + fraction[i]).replace(/零./, '');
    }
    s = s || '整';
    n = Math.floor(n);
    for (var i = 0; i < unit[0].length && n > 0; i++) {
        var p = '';
        for (var j = 0; j < unit[1].length && n > 0; j++) {
            p = digit[n % 10] + unit[1][j] + p;
            n = Math.floor(n / 10);
        }
        s = p.replace(/(零.)*零$/, '').replace(/^$/, '零') + unit[0][i] + s;
    }
    return head + s.replace(/(零.)*零元/, '元')
        .replace(/(零.)+/g, '零')
        .replace(/^整$/, '零元整');
};

Array.prototype.contain = function (item) {
    for (var i = 0; i < this.length; i++) {
        // 严格比较，即类型与数值必须同时相等。
        if (this[i] === item) {
            return true;
        }
    }
    return false;
};
Array.prototype.delete = function (varElement) {
    for (var i = 0; i < this.length; i++) {
        // 严格比较，即类型与数值必须同时相等。
        if (this[i] === varElement) {
            this.splice(i, 1);
            break;
        }
    }
    return this;
};
String.prototype.format = function () {

    if (arguments.length <= 0) return this;

    var ref = this;

    for (var i = 0; i < arguments.length; i++) {
        ref = ref.replace(new RegExp("\\{" + i + "\\}", "gm"), arguments[i]);
    }

    return ref;
};

function splitMoney(val) {
    if(val == undefined || val == '' || val == 0){
        return 0;
    }
    //根据`.`作为分隔，将val值转换成一个数组
    var aIntNum = val.toString().split('.');
    // 整数部分
    var iIntPart = aIntNum[0];
    // 小数部分（传的值有小数情况之下）
    var iFlootPart = aIntNum.length > 1 ? '.' + aIntNum[1] : '';
    var rgx = /(\d+)(\d{3})/;
    // 如果整数部分位数大于或等于5
    if (iIntPart.length >= 5) {
        // 根据正则要求，将整数部分用逗号每三位分隔
        while (rgx.test(iIntPart)) {
            iIntPart = iIntPart.replace(rgx, '$1' + ',' + '$2');
        }
    }
    // 如果小数部分位数大于或等于5
    if (iFlootPart && iFlootPart.length >= 5) {
        // 根据正则要求，将小数部分用每三位分隔按空格号分开
        while (rgx.test(iFlootPart)) {
            iFlootPart = iFlootPart.replace(/(\d{3})/g, '$1 ');
        }
    }
    // 将整数部分和小数组部分合并在一起，并返回
    return iIntPart + iFlootPart;
};

function getProdDate() {
    var now = new Date();
    var y = now.getFullYear();
    var m = now.getMonth() + 1;
    m = m < 10 ? ('0' + m) : m;
    var d = now.getDate();
    d = d < 10 ? ('0' + d) : d;
    var h = now.getHours();
    var minute = now.getMinutes();
    minute = minute < 10 ? ('0' + minute) : minute;
    return y + '年' + m + '月' + d + '日';
    // return y + '年' + m + '月' + d + '日 ' + h + ':' + minute;
};

function unitConvert(num) {
    var moneyUnits = ["元", "万元", "亿元", "万亿"];
    var dividend = 10000;
    var curentNum = num;//转换数字
    var curentUnit = moneyUnits[0]; //转换单位
    for (var i = 0; i < 4; i++) {
        curentUnit = moneyUnits[i];
        if (strNumSize(curentNum) < 5) {
            break;
        }
        curentNum = curentNum / dividend;
    }
    var m = {num: 0, unit: ""};
    m.num = curentNum.toFixed(2);
    m.unit = curentUnit;

    // var str = curentNum.toFixed(2)+curentUnit;
    return m;
};

function strNumSize(tempNum) {
    // if(tempNum == 'undefined'){
    //     tempNum = 0;
    // }
    // console.log("jsjsjsjs",tempNum);
    var stringNum = tempNum.toString();
    var index = stringNum.indexOf(".");
    var newNum = stringNum;
    if (index != -1) {
        newNum = stringNum.substring(0, index);
    }
    return newNum.length
}