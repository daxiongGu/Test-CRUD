<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="utf-8">
    <title>员工列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <#include '../include/baselink.ftl'>  <!--include和在本文件的高级文件中，需要退格-->
    <link rel="stylesheet" type="text/css" href="<@s.url '/assets/css/jquery.pagination.css'/>">
    <link href="<@s.url '/assets/plugins/select2/css/core.css'/>" rel="stylesheet" type="text/css">
</head>
<body class="admin-modals-page sb-l-o sb-r-c onload-check">
    <div id="main"> <!--在这个地方是绑定的vue元素-->
        <div class="panel ">
            <div class="table-responsive">
                <table class="table table-bordered table-hover container-sm center-column">
                    <thead>
                        <tr>
                            <td>
                                <input type="checkbox" id="check_all"
                                        @click="checkManyUser"
                                        :checked="userIdForMany.length === users.length && userIdForMany.length">
                            </td>
                            <td>姓名</td>
                            <td>性别</td>
                            <td>班级</td>
                            <td>数学</td>
                            <td>英语</td>
                            <td>语文</td>
                            <td>修改</td>
                            <td>删除</td>
                        </tr>
                    </thead>

                    <tbody>
                        <tr v-for="user in users"> <!--遍历vue中的数组-->
                            <td>
                                <input type="checkbox"
                                        @click="checkOneUser(user.id)"
                                        :checked="userIdForMany.indexOf(user.id) >= 0">
                            </td>
                            <td>{{user.name}}</td>
                            <td>{{user.sex}}</td>
                            <td>{{user.uclass}}</td>
                            <td>{{user.math}}</td>
                            <td>{{user.english}}</td>
                            <td>{{user.chinese}}</td>
                            <td>
                                <button v-on:click="findUserById" class="btn btn-primary btn-sm dz-size" data-toggle="modal" data-target="#myModalUpdate" v-model="userId = user.id">修改用户</button>
                            </td>
                            <td>
                                <button class="btn btn-warning btn-sm" v-on:click="deleteOneUser">
                                    删除学生
                                </button>
                            </td>
                            <td>
                                <button v-on:click="deleteManyUser" v-bind:disabled="buttonOfDeleteManyUser">删除选中</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div>
                    <button class="btn btn-primary btn-sm dz-size" data-toggle="modal" data-target="#myModalAdd">添加用户</button>
                </div>
            </div>
        </div>

        <div class="modal fade" id="myModalUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content modal-sm">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h3 class="modal-title" id="myModalLabel">添加用户信息</h3>
                    </div>
                    <div class="modal-body">
                        <div class="input-group input-group-sm row">
                            <span>学生姓名:</span>
                            <input type="text" class="input-sm"
                                   v-model="user.name">
                        </div>
                        <div class="input-group input-group-sm row">
                            <span>学生性别:</span>
                            <input type="text" class="input-sm"
                                   v-model="user.sex">
                        </div>
                        <div class="input-group input-group-sm row">
                            <span>学生班级:</span>
                            <input type="text" class="input-sm"
                                   v-model="user.uclass">
                        </div>
                        <div class="input-group input-group-sm row">
                            <span>数学成绩:</span>
                            <input type="text" class="input-sm"
                                   v-model="user.math">
                        </div>
                        <div class="input-group input-group-sm row">
                            <span>英语成绩:</span>
                            <input type="text" class="input-sm"
                                   v-model="user.english">
                        </div>
                        <div class="input-group input-group-sm row">
                            <span>语文成绩:</span>
                            <input type="text" class="input-sm"
                                   v-model="user.chinese">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" v-on:click="updateUser">提交更改</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="myModalAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content modal-sm">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h3 class="modal-title" id="myModalLabel">添加用户信息</h3>
                    </div>
                    <div class="modal-body">
                        <div class="input-group input-group-sm row">
                            <span>学生姓名:</span>
                            <input type="text" class="input-sm"
                                   v-model="user.name">
                        </div>
                        <div class="input-group input-group-sm row">
                            <span>学生性别:</span>
                            <input type="text" class="input-sm"
                                   v-model="user.sex">
                        </div>
                        <div class="input-group input-group-sm row">
                            <span>学生班级:</span>
                            <input type="text" class="input-sm"
                                   v-model="user.uclass">
                        </div>
                        <div class="input-group input-group-sm row">
                            <span>数学成绩:</span>
                            <input type="text" class="input-sm"
                                   v-model="user.math">
                        </div>
                        <div class="input-group input-group-sm row">
                            <span>英语成绩:</span>
                            <input type="text" class="input-sm"
                                   v-model="user.english">
                        </div>
                        <div class="input-group input-group-sm row">
                            <span>语文成绩:</span>
                            <input type="text" class="input-sm"
                                   v-model="user.chinese">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" v-on:click="addUser">提交更改</button>
                    </div>
                </div>
            </div>
        </div>


    </div>
    <#include '../include/footer_js.ftl'/>
    <script src="<@s.url '/assets/plugins/bs-confirmation/bootstrap-confirmation.js'/>"></script>
    <script src="<@s.url '/assets/js/jquery.pagination.min.js'/>"></script>
    <script src="<@s.url '/assets/plugins/select2/select2.full.min.js'/>"></script>
</body>
<script>
    var app = new Vue({
        el: '#main',
        data: {
            userId:'',
            users:[],
            userInfo:{
                name:'',
                sex:'',
                uclass:'',
                math:'',
                english:'',
                chinese:''
            },
            user:{},
            userIdForMany: []
        },
        created: function(){
            this.findUserList();
        },
        watch:{

        },
        mounted:function () {
            
        },
        computed:{
            buttonOfDeleteManyUser: function () {
                console.log(this.userIdForMany.length);
                return !this.userIdForMany.length > 0;
            }
        },
        methods: {
            findUserList:function () {
                 var url = contentPath + "/api/userList";
                 this.$http.get(url).then(function (response) {
                     if(response.data.retcode === 2000000){
                         this.users = response.data.data;

                     }
                 },function (error) {
                        toastr.error(error.body.msg,'查询用户失败');
                 });
            },
            updateUser: function () {
                let url = contentPath + '/api/updateUser';
                this.user.id = this.userId;
                this.$http.post(url,this.user).then(function (response) {
                    if(response.data.retcode === 2000000){
                        location.reload();
                    }
                },function (error) {
                    toastr.error(error.body.msg,'失败');
                });
            },
            addUser: function () {
                let url = contentPath + '/api/userAdd';
                this.$http.post(url,this.user).then(function (response) {
                    if(response.data.retcode === 2000000){
                        location.reload();
                    }
                },function (error) {
                    toastr.error(error.body.msg,'失败');
                });
            },
            deleteOneUser: function () {
                let url = contentPath + '/api/deleteOneUser';
                this.user.id = this.userId;
                this.$http.post(url, this.user).then(function (response) {
                    if(response.data.retcode === 2000000){
                        location.reload();
                    }
                }, function (error) {
                    toastr.error(error.body.msg, '失败');
                });
            },
            deleteManyUser: function(){
                let url = contentPath + "/api/deleteManyUser";
                this.$http.post(url, this.userIdForMany).then(function (response) {
                    if (response.data.retcode === 2000000){
                        location.reload();
                    }
                } ,function (error) {
                    toastr.error(error.body.msg,'失败');
                });
            },
            findUserById: function () {
                let url = contentPath + "/api/findUserById"
                this.user.id = this.userId;
                this.$http.post(url,this.user).then(function (response) {
                    this.user = response.data.data;
                },function (error) {
                    toastr.error(error.body.msg,'根据用户Id查询失败');
                });
            },
            checkOneUser: function (userIdToCheck) {
                let idIndex = this.userIdForMany.indexOf(userIdToCheck);
                if(idIndex >= 0){
                    this.userIdForMany.splice(idIndex,1);
                }else{
                    this.userIdForMany.push(userIdToCheck);
                }
            },
            checkManyUser: function (check) {
                if(check.target.checked) {
                    this.userIdForMany = [];
                    this.users.forEach(item => {
                        this.userIdForMany.push(item.id);
                    });
                }else{
                    this.userIdForMany = [];
                }
            }
        }
    });
</script>
</html>
