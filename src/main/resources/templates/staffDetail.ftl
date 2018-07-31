<#import "spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="utf-8">
    <title>员工详情</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<#include 'include/baselink.ftl'>
    <link rel="stylesheet" type="text/css" href="<@s.url '/assets/css/jquery.pagination.css'/>">
</head>
<body class="dashboard-page">
<div id="main">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="panel">
                <div class="panel-body">
                    <div class="tab-content pn br-n">
                        员工信息
                    </div>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-hover" id="users_table">
                                <tr>
                                    <td>#</td>
                                    <td>{{updateDetail.id}}</td>
                                </tr>
                                <tr>
                                    <td>姓名</td>
                                    <td><input type="text" v-model="updateDetail.realName"></td>
                                </tr>
                                <tr>
                                    <td>性别</td>
                                    <td>
                                        <input type="radio" value="1" v-model="updateDetail.gender"> 男
                                        <input type="radio" value="0" v-model="updateDetail.gender" style="margin-left: 10px">
                                        女
                                    </td>
                                </tr>
                                <tr>
                                    <td>年龄</td>
                                    <td><input type="text" v-model="updateDetail.age"></td>
                                </tr>
                                <tr>
                                    <td>电话</td>
                                    <td><input type="text" v-model="updateDetail.mobile"></td>
                                </tr>
                                <tr>
                                    <td>昵称</td>
                                    <td><input type="text" v-model="updateDetail.nickName"></td>
                                </tr>
                                <tr>
                                    <td>部门</td>
                                    <td>
                                        <select name="selectDep" class="form-control input-sm"
                                                v-model="updateDetail.deptId">
                                            <option v-for="newDept in departments" :value="newDept.id">
                                                {{newDept.name}}
                                            </option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>邮箱</td>
                                    <td><input type="text" v-model="updateDetail.email"></td>
                                </tr>
                                <tr>
                                    <td>地址</td>
                                    <td><input type="text" v-model="updateDetail.address"></td>
                                </tr>
                                <tr>
                                    <td>生日</td>
                                    <td><input type="text" id="dayDateTime" class="form-control datainp date_time"
                                                        v-model="updateDetail.birthday"  readonly ></td>
                                </tr>
                                <tr>
                                    <td>学历</td>
                                    <td>
                                        <select name="selectEducation" class="form_control input-sm" v-model="updateDetail.education">
                                            <option value="ZHUAN_KE">专科</option>
                                            <option value="BEN_KE">本科</option>
                                            <option value="SHUO_SHI">硕士</option>
                                            <option value="BO_SHI">博士</option>
                                            <option value="OTHER">其他</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>毕业院校</td>
                                    <td><input type="text" v-model="updateDetail.university"></td>
                                </tr>
                                <tr>
                                    <td>专业</td>
                                    <td><input type="text" v-model="updateDetail.major"></td>
                                </tr>
                                <tr>
                                    <td>入学时间</td>
                                    <td><input type="text" id="enrollDateTime" class="form-control datainp date_time"
                                                v-model="updateDetail.enrollTime" readonly></td>
                                </tr>
                                <tr>
                                    <td>毕业时间</td>
                                    <td><input type="text" id="educutDateTime" class="form-control datainp date_time"
                                               v-model="updateDetail.educutTime" readonly></td>
                                </tr>
                                <tr>
                                    <td>
                                        <button class="btn btn-primary btn-sm " @click="updateStaffDetail">
                                        <#--@click="update(detail)"data-target="#update_model" data-toggle="modal"-->
                                            <span class="fa fa-pencil"> 保存</span>
                                        </button>
                                        <button class="btn btn-primary btn-sm " @click="returnIndex">
                                            <span class="fa fa-pencil"> 返回</span>
                                        </button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<#--编辑-->
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
                        <input type="text" class="form-control" v-model="updateDetail.realName">
                    </div>
                    <div class="form-group" style="margin-bottom: 5px">
                        <label for="exampleInputPassword1">性别</label>
                    </div>
                    <div style="margin-bottom: 5px ">
                        <input type="radio" value="1" v-model="updateDetail.gender"> 男
                        <input type="radio" value="0" v-model="updateDetail.gender" style="margin-left: 10px"> 女
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">年龄</label>
                        <input type="text" class="form-control" v-model="updateDetail.age">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">电话</label>
                        <input type="text" class="form-control" v-model="updateDetail.mobile">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">昵称</label>
                        <input type="text" class="form-control" v-model="updateDetail.nickName">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">部门</label>
                        <select name="selectDep" class="form-control input-sm" v-model="updateDetail.deptId">
                            <option v-for="newDept in departments" :value="newDept.id">{{newDept.name}}</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">邮箱</label>
                        <input type="text" class="form-control" v-model="updateDetail.email">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">地址</label>
                        <input type="text" class="form-control" v-model="updateDetail.address">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">生日</label>
                        <input type="text" class="form-control" v-model="updateDetail.birthday">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">学历</label>
                        <select name="selectEducation" class="form_control input-sm" v-model="updateDetail.education">
                            <option value="ZHUAN_KE">专科</option>
                            <option value="BEN_KE">本科</option>
                            <option value="SHUO_SHI">硕士</option>
                            <option value="BO_SHI">博士</option>
                            <option value="OTHER">其他</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">毕业院校</label>
                        <input type="text" class="form-control" v-model="updateDetail.university">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">专业</label>
                        <input type="text" class="form-control" v-model="updateDetail.major">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">入学时间</label>
                        <input type="text" class="form-control" v-model="updateDetail.enrollTime">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">毕业时间</label>
                        <input type="text" class="form-control" v-model="updateDetail.educutTime">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" @click="updateStaffDetail"
                            data-dismiss="modal"> 保存
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<#include 'include/footer_js.ftl'/>
<script src="/assets/js/jquery.pagination-1.2.7.js"></script>
<script src="<@s.url '/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js'/>"></script>
<script src="<@s.url '/assets/plugins/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js'/>"></script>
<script>
    var app = new Vue({
        el: '#main',
        data: {
            departments: [],
            searchInfo: {

            },
            resultOfStaff: {
                id: ''
            },
            updateDetail: {}
        },
        created: function () {
            this.getStaffId();
            this.detailList();
            this.findDep();
        },
        mounted: function () {
            $("#dayDateTime").datepicker({
                language: "zh-CN",
                autoclose: true,
                format: "yyyy-mm-dd "
            });
            $("#dayDateTime").datepicker();
            $("#enrollDateTime").datepicker({
                language: "zh-CN",
                autoclose: true,
                format: "yyyy-mm-dd "
            });
            $("#enrollDateTime").datepicker();
            $("#educutDateTime").datepicker({
                language: "zh-CN",
                autoclose: true,
                format: "yyyy-mm-dd "
            });
            $("#educutDateTime").datepicker();
        },
        computed: {},
        watch: {
        },
        methods: {
            findDep: function () {
                var url = "/api/dep/list";
                this.$http.post(url, this.searchInfo).then(function (response) {
                    this.departments = response.body.data;
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            getStaffId: function () {
                var url = window.location.search;
                if (url.indexOf("?") != -1) {
                    this.resultOfStaff.id = url.substr(url.indexOf("=") + 1);
                }
            },
            detailList: function () {
                var url = "/api/detail/select?id=" + this.resultOfStaff.id;
                this.$http.get(url).then(function (response) {
                    this.updateDetail = response.body.data;
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            // update: function (detail) {
            //     this.updateDetail = detail;
            // },
            updateStaffDetail: function () {
                this.updateDetail.birthday = $("#dayDateTime").val();
                this.updateDetail.enrollTime = $("#enrollDateTime").val();
                this.updateDetail.educutTime =  $("#educutDateTime").val();
                // this.updateDetail.staffId = parseInt(this.resultOfStaff.id);
                console.log(this.updateDetail);
                var url = "/api/detail/update";
                this.$http.post(url, this.updateDetail).then(function (response) {
                    sweetAlert("操作成功！");
                    this.detailList();
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            returnIndex: function () {
                window.location.href = "/index";
            }
        }
    })
</script>
</body>
</html>