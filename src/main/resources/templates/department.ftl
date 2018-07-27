<#import "spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="utf-8">
    <title>部门列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<#include 'include/baselink.ftl'>
    <link rel="stylesheet" type="text/css" href="<@s.url '/assets/css/jquery.pagination.css'/>">
</head>
<body>
<div id="main">
    <section>
        <section id="content" class="table-layout animated fadeIn">
            <div class="tray tray-center">
                <div class="panel">
                    <div class="panel-body">
                        <div class="tab-content pn br-n">
                            部门列表
                        </div>
                    </div>
                    <div style="margin-left: 950px">
                        <button class="btn btn-danger btn-sm " data-target="#insert_model" data-toggle="modal">
                            <span class="fa fa-plus"> 添加</span>
                        </button>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                                <table class="table table-hover" id="departments_table">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>名称</th>
                                        <th>详情</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="oldDept in departments">
                                        <td>{{oldDept.id}}</td>
                                        <td>{{oldDept.name}}</td>
                                        <td>{{oldDept.detail}}</td>
                                        <td>
                                            <button class="btn btn-primary btn-sm " @click="update(oldDept)"
                                                    data-target="#update_model" data-toggle="modal">
                                                <span class="fa fa-pencil">修改</span>
                                            </button>
                                            <button class="btn btn-danger btn-sm " @click="updateDept(oldDept)"
                                                    data-target="#delete_model" data-toggle="modal">
                                                <span class="fa fa-trash"> 删除</span>
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

<#--修改-->
    <div class="modal fade" id="update_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改部门信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1">名称</label>
                        <input type="text" class="form-control" v-model="department.name">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">详情</label>
                        <input type="text" class="form-control" v-model="department.detail">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" @click="updateStaff"
                            data-dismiss="modal"> 保存
                    </button>
                </div>
            </div>
        </div>
    </div>

<#--添加-->
    <div class="modal fade" id="insert_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加部门</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1">名称</label>
                        <input type="text" class="form-control" v-model="insertInfo.name">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">详情</label>
                        <input type="text" class="form-control" v-model="insertInfo.detail">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" @click="insertStaff"
                            data-dismiss="modal"> 保存
                    </button>
                </div>
            </div>
        </div>
    </div>

<#--删除-->
    <div class="modal fade" id="delete_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">员工安排部门</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <table for="exampleInputEmail1">选择部门
                            <select name="selectDep" class="form-control input-sm" v-model="newDeptId">
                                <option v-for="newDept in departments" :value="newDept.id">{{newDept.name}}</option>
                            </select>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" @click="del(updatedDept.id)"
                            data-dismiss="modal"> 确认
                    </button>
                </div>
            </div>
        </div>
    </div>

</div>
<#include 'include/footer_js.ftl'/>
<script src="/assets/js/jquery.pagination-1.2.7.js"></script>
<script>
    var app = new Vue({
        el: '#main',
        data: {
            departments: [],
            searchInfo: {
                id: '',
                name: '',
                detail: ''
            },
            department: {},
            insertInfo: {},
            updatedDept: {},
            newDeptId: ''
        },
        created: function () {
            this.findList();
        },
        mounted: function () {

        },
        computed: {},
        watch: {
            "searchInfo.name": function () {
                this.findList();
            }
        },
        methods: {
            findList: function () {
                var url = "/api/dep/list";
                this.$http.post(url, this.searchInfo).then(function (response) {
                    this.departments = response.body.data;
                    console.log(this.departments);
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            updateDept: function(oldDept){
                console.log(oldDept);
                this.updatedDept = oldDept;
            },
            update: function (department) {
                console.log(department);
                this.department = department;
            },
            updateStaff: function () {
                var url = "/api/dep/update";
                this.$http.post(url, this.department).then(function (response) {
                    sweetAlert("操作成功");
                    this.findList();
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            del: function (oldId) {
                console.log(oldId);
                console.log(this.newDeptId);
                var url = "/api/dep/delete?oldId=" + oldId + "&newId=" + this.newDeptId ;
                this.$http.get(url).then(function (response) {
                    this.findList();
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            insertStaff: function () {
                var url = "/api/dep/insert";
                this.$http.post(url, this.insertInfo).then(function (response) {
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