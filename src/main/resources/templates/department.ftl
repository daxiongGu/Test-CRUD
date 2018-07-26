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
                                    <tr v-for="department in departments">
                                        <td>{{department.id}}</td>
                                        <td>{{department.name}}</td>
                                        <td>{{department.detail}}</td>
                                        <td>
                                            <button class="btn btn-primary btn-sm " @click="update(department)"
                                                    data-target="#update_model" data-toggle="modal">
                                                <span class="fa fa-pencil">修改</span>
                                            </button>
                                            <button class="btn btn-danger btn-sm " @click="del(department.id)">
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
</div>
<#include 'include/footer_js.ftl'/>
<script src="/assets/js/jquery.pagination-1.2.7.js"></script>
<script>
    var app = new Vue({
        el: '#main',
        data: {
            departments:[],
            searchInfo:{
                id:'',
                name:'',
                detail:''
            },
            department:{}
        },
        created: function () {
            this.findList();
        },
        mounted: function () {
            
        },
        computed:{},
        watch:{

        },
        methods:{
            findList: function () {
                var url = "/api/dep/list";
                this.$http.post(url,this.searchInfo).then(function (response) {
                    this.departments = response.body.data;
                    console.log(response);
                },function (error) {
                    swal(error.body.msg);
                });
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
            del: function (id) {
                var url = "/api/dep/delete?id=" + id;
                this.$http.get(url).then(function (response) {
                    sweetAlert("本部门员工将移除");
                    this.findList();
                }, function (error) {
                    swal(error.body.msg);
                });
            },
        }
    });
</script>
</body>
</html>