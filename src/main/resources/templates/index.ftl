<#import "spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="utf-8">
    <title>CURD</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<#include 'include/baselink.ftl'>
</head>
<body class="dashboard-page">
<div id="main">
    <section>
        <section id="content" class="table-layout animated fadeIn">
            <div class="tray tray-center">
                <div class="panel">
                    <div class="panel-body">
                        <div class="tab-content pn br-n">
                            CRUD
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                                <table class="table table-hover" id="users_table">
                                    <thead>
                                    <tr>
                                        <th>
                                            <input type="checkbox" id="check_all"/>
                                        </th>
                                        <th>#</th>
                                        <th>用户名</th>
                                        <th>性别</th>
                                        <th>邮箱</th>
                                        <th>生日</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="">
                                        <td>
                                            <input type='checkbox' class='check_item'/>
                                        </td>
                                        <td>{{}}</td>
                                        <td>{{}}</td>
                                        <td>{{}}</td>
                                        <td>{{}}</td>
                                        <td>{{}}</td>
                                        <td>
                                            <button class="btn btn-primary btn-sm edit_user_btn">
                                                <span class="glyphicon glyphicon-pencil">编辑</span>
                                            </button>
                                            <button class="btn btn-danger btn-sm delete_user_btn">
                                                <span class="glyphicon glyphicon-trash">删除</span>
                                            </button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>
</div>
<#include 'include/footer_js.ftl'/>
<script>
    var app = new Vue({
        el: '#main',
        data: {

        },
        created: function () {

        },
        mounted: function () {

        },
        computed: {

        },
        watch: {

        },
        methods: {

        }
    });
</script>
</body>
</html>