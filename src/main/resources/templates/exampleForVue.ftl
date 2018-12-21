<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <title>测试v-bind类</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <#include 'include/baselink.ftl'>
    <link rel="stylesheet" type="text/css" href="<@s.url '/assets/css/jquery.pagination.css'/>">
    <link href="<@s.url '/assets/plugins/select2/css/core.css'/>" rel="stylesheet" type="text/css">
</head>
<body class="admin-modals-page sb-l-o sb-r-c onload-check">
<div id="main">
<div class="panel">
    <div class="panel-body">
        <div class="input-group input-sm" v-bind:class="classObject">
            这里用来测试绑定computer类的是否显示
        </div>
    </div>
    <div v-bind:class="classObject">
        <span>测试绑定isActive的是否显示</span>
        <input class="input-group input-sm" v-model="name">
        <span>{{name}}</span>
    </div>
</div>
    <#include 'include/footer_js.ftl'/>
    <script src="<@s.url '/assets/plugins/bs-confirmation/bootstrap-confirmation.js'/>"></script>
    <script src="<@s.url '/assets/js/jquery.pagination.min.js'/>"></script>
    <script src="<@s.url '/assets/plugins/select2/select2.full.min.js'/>"></script>
<script>
    var app = new Vue({
        el: '#main',
        data: {
            name: '',
            isActive: false
        },
        created: function () {
            console.log("看是够有加载了本VUE");
        },
        computed: {
            classObject: function () {
                return {
                    'well': true
                }
            }
        }
    });
</script>
</body>
</html>