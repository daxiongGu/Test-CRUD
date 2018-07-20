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
                                        <th>姓名</th>
                                        <th>性别</th>
                                        <th>年龄</th>
                                        <th>电话</th>
                                        <th>昵称</th>
                                        <th>创建人</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="user in users">
                                        <td>
                                            <input type='checkbox' class='check_item'/>
                                        </td>
                                        <td>{{user.id}}</td>
                                        <td>{{user.realName}}</td>
                                        <td>
                                            <span v-if="user.gender === 0">女</span>
                                            <span v-else="">男</span>
                                        </td>
                                        <td>{{user.age}}</td>
                                        <td>{{user.mobile}}</td>
                                        <td>{{user.nickName}}</td>
                                        <td>{{user.createdBy}}</td>
                                        <td>
                                            <button class="btn btn-primary btn-sm "@click="update(user)"
                                                    data-target="#update_model"data-toggle="modal">
                                                <span class="fa fa-pencil"> 编辑</span>
                                            </button>
                                            <button class="btn btn-danger btn-sm " @click="del(user.id)">
                                                <span class="fa fa-trash"> 删除</span>
                                            </button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="panel-footer" align="right">
                        <button class="btn btn-danger btn-sm " data-target="#insert_model" data-toggle="modal">
                            <span class="fa fa-plus"> 添加</span>
                        </button>
                    </div>
                </div>
            </div>
        </section>
    </section>

    <!-- 编辑 -->
    <div class="modal fade" id="update_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改员工信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1">姓名</label>
                        <input type="text" class="form-control" v-model="user.realName">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">性别</label>
                        <input type="text" class="form-control" v-model="user.gender">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">年龄</label>
                        <input type="text" class="form-control" v-model="user.age">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">电话</label>
                        <input type="text" class="form-control" v-model="user.mobile">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">昵称</label>
                        <input type="text" class="form-control" v-model="user.nickName">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">创建人</label>
                        <input type="text" class="form-control" v-model="user.createdBy">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" @click="updateStaff"
                            data-dismiss="modal"> 保存</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 添加 -->
    <div class="modal fade" id="insert_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">新增员工信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1">姓名</label>
                        <input type="text" class="form-control" v-model="insertUser.realName">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">性别</label>
                        <input type="text" class="form-control" v-model="insertUser.gender">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">年龄</label>
                        <input type="text" class="form-control" v-model="insertUser.age">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">电话</label>
                        <input type="text" class="form-control" v-model="insertUser.mobile">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">昵称</label>
                        <input type="text" class="form-control" v-model="insertUser.nickName">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">创建人</label>
                        <input type="text" class="form-control" v-model="insertUser.createdBy">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" @click="insert"
                            data-dismiss="modal"> 保存</button>
                </div>
            </div>
        </div>
    </div>
</div>
<#include 'include/footer_js.ftl'/>
<script>
    var app = new Vue({
        el: '#main',
        data: {
            users: [],
            searchInfo: {
                realName: '',
                age: '',
                mobile: '',
                gender: '',
                nickName: ''
            },
            user: {},
            insertUser: {}
        },
        created: function () {
            this.findList();
        },
        mounted: function () {


        },
        computed: {},
        watch: {},
        methods: {

            findList: function () {
                var url = "/api/user/list";
                this.$http.post(url, this.searchInfo).then(function (response) {
                    this.users = response.body.data;
                    console.log(response);
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            update: function (user) {
                console.log(user);
                this.user = user;
            },
            updateStaff: function () {
                var url = "/api/user/update";
                this.$http.post(url, this.user).then(function (response) {
                    sweetAlert("操作成功");
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            insert: function () {
                var url = "/api/user/insert";
                this.$http.post(url, this.insertUser).then(function (response) {
                    sweetAlert("操作成功");
                    this.findList();
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            del:function (id) {
                var url = "/api/user/delete?id=" + id;
                this.$http.get(url).then(function (response) {
                    sweetAlert("操作成功");
                    this.findList();
                }, function (error) {
                    swal(error.body.msg);
                });
            }
        }
    });
</script>
</body>
</html>