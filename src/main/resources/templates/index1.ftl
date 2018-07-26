<#import "spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="utf-8">
    <title>CURD</title>
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
                    <div class="panel-body">
                        <div class="tab-content pn br-n">
                            CRUD
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="form-inline">
                            <div class="form-group">
                                <div class="input-group input-group-sm">
                                    <div class="input-group-addon btn btn-default">姓名：</div>
                                    <input type="text" class="form-control input-sm w200" placeholder="请输入姓名"
                                           v-model="searchInfo.realName">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group input-group-sm">
                                    <div class="input-group-addon btn btn-default">昵称：</div>
                                    <input type="text" class="form-control input-sm" placeholder="请输入昵称"
                                           v-model="searchInfo.nickName">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group input-group-sm">
                                    <div class="input-group-addon btn btn-default">电话：</div>
                                    <input type="text" class="form-control input-sm" placeholder="请输入电话"
                                           v-model="searchInfo.mobile">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group input-group-sm">
                                    <div class="input-group-addon btn btn-default">性别：</div>
                                    <select name="selectGender" v-model="searchInfo.gender"
                                            class="form-control input-sm">
                                        <option value="1">男</option>
                                        <option value="0">女</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group input-group-sm">
                                    <div class="input-group-addon btn btn-default">部门：</div>
                                    <input type="text" class="form-control input-sm" placeholder="请输入所在部门"
                                           v-model="searchInfo.department">
                                </div>
                            </div>
                            <button type="button" class="btn btn-sm btn-success" @click="findList">
                                <span class="fa fa-tasks">查询</span>
                            </button>
                            <button class="btn btn-danger btn-sm " data-target="#insert_model" data-toggle="modal">
                                <span class="fa fa-plus"> 添加</span>
                            </button>
                            <button class="btn btn-danger btn-sm " @click="deleteSome(userIds)">
                                <span class="fa fa-trash"> 删除选中</span>
                            </button>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                                <table class="table table-hover" id="users_table">
                                    <thead>
                                    <tr>
                                        <th>
                                            <input type="checkbox" id="check_all" @click="checkedAll"
                                                   :checked="users.length===userIds.length && userIds.length"/>
                                        </th>
                                        <th>#</th>
                                        <th>姓名</th>
                                        <th>性别</th>
                                        <th>年龄</th>
                                        <th>电话</th>
                                        <th>昵称</th>
                                        <th>部门</th>
                                        <th>创建人</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="user in users">
                                        <td>
                                            <input type='checkbox' class='check_item' @click="checkedOne(user.id)"
                                                   :checked="userIds.indexOf(user.id)>=0"/>
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
                                        <td>{{user.department}}</td>
                                        <td>{{user.createdBy}}</td>
                                        <td>
                                            <button class="btn btn-primary btn-sm " @click="update(user)"
                                                    data-target="#update_model" data-toggle="modal">
                                                <span class="fa fa-pencil"> 编辑</span>
                                            </button>
                                            <button class="btn btn-danger btn-sm " @click="del(user.id)">
                                                <span class="fa fa-trash"> 删除</span>
                                            </button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="table-responsive" style="margin-top: 10px ">
                                    <div id="pageMenu"></div>
                                </div>
                            </div>
                        </div>
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
                    <div class="form-group" style="margin-bottom: 5px">
                        <label for="exampleInputPassword1">性别</label>
                    </div>
                    <div style="margin-bottom: 5px ">
                        <input type="radio" value="1" v-model="user.gender"> 男
                        <input type="radio" value="0" v-model="user.gender" style="margin-left: 10px"> 女
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
                        <label for="exampleInputPassword1">部门</label>
                        <input type="text" class="form-control" v-model="user.department">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">创建人</label>
                        <input type="text" class="form-control" v-model="user.createdBy">
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
                    <div class="form-group" style="margin-bottom: 5px">
                        <label for="exampleInputPassword1">性别</label>
                    </div>
                    <div style="margin-bottom: 5px">
                        <input type="radio" value="1" v-model="insertUser.gender">男
                        <input type="radio" value="0" v-model="insertUser.gender" style="margin-left: 10px">女
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
                        <label for="exampleInputPassword1">部门</label>
                        <input type="text" class="form-control" v-model="insertUser.department">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">创建人</label>
                        <input type="text" class="form-control" v-model="insertUser.createdBy">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" @click="insert"
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
                    users: [],
                    searchInfo: {
                        realName: '',
                        gender: '',
                        mobile: '',
                        nickName: '',
                        department:'',
                        page: 1,
                        pageSize: 5
                    },
                    user: {},
                    insertUser: {},
                    userIds: [],
                    isCheckedAll: false
                },
                created: function () {
                    this.searchInfo.page = 1;
                    this.findList();
                },
                mounted: function () {
                },
                computed: {},
                watch: {
                    "searchInfo.realName": function () {
                        this.findList();
                    }
                },
                methods: {
                    findList: function () {
                        this.searchInfo.page = 1;
                        $('#pageMenu').page('destroy');
                        this.query();
                    },
                    update: function (user) {
                        console.log(user);
                        this.user = user;
                    },
                    updateStaff: function () {
                        var url = "/api/user/update";
                        this.$http.post(url, this.user).then(function (response) {
                            sweetAlert("操作成功");
                            this.findList();
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
                    del: function (id) {
                        var url = "/api/user/delete?id=" + id;
                        this.$http.get(url).then(function (response) {
                            sweetAlert("操作成功");
                            this.findList();
                        }, function (error) {
                            swal(error.body.msg);
                        });
                    },
                    checkedOne: function (userId) {
                        let idIndex = this.userIds.indexOf(userId)
                        if (idIndex >= 0) {//如果已经包含就去除
                            this.userIds.splice(idIndex, 1)
                        } else {//如果没有包含就添加
                            this.userIds.push(userId)
                        }
                    },
                    checkedAll: function (e) {
                        this.isCheckedAll = e.target.checked;
                        if (this.isCheckedAll) {//全选时
                            this.userIds = []
                            this.users.forEach(item => {
                                this.userIds.push(item.id)
                            })
                        } else {
                            this.userIds = []
                        }
                    },
                    deleteSome: function (ids) {
                        var url = "/api/user/deleteSome?ids=" + ids;
                        this.$http.post(url).then(function (response) {
                            sweetAlert("操作成功");
                            this.findList();
                        }, function (error) {
                            swal(error.body.msg);
                        });
                    },
                    query: function () {
                        var url = "/api/user/list";
                        this.$http.post(url, this.searchInfo).then(function (response) {
                            this.users = response.body.data.list;
                            console.log(response);
                            var temp = this;
                            $("#pageMenu").page({
                                total: response.body.data.total,
                                pageSize: response.body.data.pageSize,
                                firstBtnText: '首页',
                                lastBtnText: '尾页',
                                prevBtnText: '上一页',
                                nextBtnText: '下一页',
                                showInfo: true,
                                showJump: true,
                                jumpBtnText: '跳转',
                                infoFormat: '{start} ~ {end}条，共{total}条'
                            }, response.body.data.page).on("pageClicked", function (event, pageIndex) {
                                temp.searchInfo.page = pageIndex + 1;
                            }).on('jumpClicked', function (event, pageIndex) {
                                temp.searchInfo.page = pageIndex + 1;
                            });
                        }, function (error) {
                            swal(error.body.msg);
                        });
                    }
                }
            });
</script>
</body>
</html>