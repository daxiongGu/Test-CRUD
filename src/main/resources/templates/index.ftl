<#import "spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="utf-8">
    <title>员工列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<#include 'include/baselink.ftl'>
    <link rel="stylesheet" type="text/css" href="<@s.url '/assets/css/jquery.pagination.css'/>">
</head>
<body class="dashboard-page">
<div id="main">
    <section>
        <section id="content" class="table-layout animated fadeIn">
            <div class="tray tray-center">
                <div class="panel">

                </div>
            </div>
        </section>
    </section>



</div>
<#include 'include/footer_js.ftl'/>
<script src="/assets/js/jquery.pagination-1.2.7.js"></script>
<script>
    var app = new Vue({
        el: '#main',
        data: {

        },
        created: function () {

        },
        mounted: function () {
        },
        computed: {},
        watch: {

        },
        methods: {

        }
    });
</script>
</body>
</html>