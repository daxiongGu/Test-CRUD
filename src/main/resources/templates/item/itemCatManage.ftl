<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <link rel="shortcut icon" href="#" />
    <meta charset="utf-8">
    <title>商品分类管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<@s.url '/assets/css/jquery.pagination.css'/>">
    <#include '../include/baselink.ftl'>
    <style>
        .item a {
            text-decoration: none;
        }
        .item a:hover {
            text-decoration: none;
        }
    </style>
</head>
<body class="dashboard-page">
<#include '../include/skin-toolbox.ftl'>
<div id="main">
    <#include '../include/header.ftl'>
    <#include '../include/sidebar.ftl'>
    <section id="content_wrapper">

        <#--Head start-->
        <header id="topbar" class=" ph10">
            <div class="topbar-left">
                <ol class="breadcrumb">
                    <li class="crumb-icon">
                        <a href="<@s.url '/'/>">
                            <span class="glyphicon glyphicon-home"></span>
                        </a>
                    </li>
                    <li class="crumb-link">
                        商品管理
                    </li>
                    <li class="crumb-trail">商品分类管理</li>
                </ol>
            </div>
        </header>
        <#--Head end-->

        <section id="content" class="table-layout">
            <div class="tray tray-center">
                <div class="panel" id="spy7">

                    <#-- Content-Head start --->
                    <div class="panel-heading">
                        <span class="panel-icon"><i class="fa fa-table"></i></span>
                        <span class="panel-title">商品类目</span>
                        <span class="panel-controls">
                                <a href="#" class="btn btn-default btn-sm fw600 ml10" style="width: 105px"
                                    @click="clickAddBtn()" data-toggle="modal" data-target="#myModal">
                                    <span class="fa fa-plus pr5"></span>添加分类
                                </a>
                                <a href="#" class="panel-control-color"></a>
                                <a href="#" class="panel-control-collapse"></a>
                                <a href="#" class="panel-control-fullscreen"></a>
                            </span>
                    </div>
                    <#-- Content-Head end --->

                    <#--Search start-->
                    <div class="panel-menu dark">
                        <div class="well well-sm mn">
                            <form class="form-inline">
                                <div class="form-group">
                                    <div class="input-group input-group-sm">
                                        <div class="input-group-addon btn btn-default">商品分类搜索</div>
                                        <input type="text" class="form-control input-sm" placeholder="请输分类名"
                                               v-model="itemCatCondition.name">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <#--Search end-->

                    <#--Data start-->
                    <div class="panel-body pn">
                        <div class="bs-component">
                            <div class="table-responsive">
                                <table class="table table-bitemed table-hover table-condensed">
                                    <thead>
                                    <tr>
                                        <th>商品分类编号</th>
                                        <th>商品分类标题</th>
                                        <th>创建时间</th>
                                        <th>修改时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="itemCat in itemCatList">
                                        <td>{{itemCat.id}}</td>
                                        <td>{{itemCat.name}}</td>
                                        <td>{{itemCat.created}}</td>
                                        <td>{{itemCat.updated}}</td>
                                        <td>
                                            <button class="label btn-info glyphicon glyphicon-pencil" data-toggle="modal" data-target="#myModal2" @click="toUpdateItemCat(itemCat)">
                                                修改</button>
                                            <button class="label btn-danger glyphicon glyphicon-trash" @click="deleteItemCat(itemCat.id)"> 删除</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="20" v-if="itemCatList.length == 0" class="text-center">暂无数据!</td>
                                    </tr>
                                    </tbody>
                                    <#-- Page-menu start -->
                                    <tfoot>
                                    <tr>
                                        <td colspan="20">
                                            <div class="table-responsive">
                                                <div id="pageMenu"></div>
                                            </div>
                                        </td>
                                    </tr>
                                    </tfoot>
                                    <#-- Page-menu end -->
                                </table>
                            </div>
                        </div>
                    </div>
                    <#--Data end-->

                </div>
            </div>
        </section>
        <#-- Update-item modal -->
        <#include 'itemCatModal/updateItemCat.ftl'/>
        <#-- Add-item modal -->
        <#include 'itemCatModal/addItemCat.ftl'/>
    </section>
</div>
    <#include '../include/footer.ftl'/>
    <#include '../include/footer_js.ftl'/>
    <script src="<@s.url '/assets/js/jquery.pagination-1.2.7.js'/>"></script>

<#--Vue-->
<script>
    var app = new Vue({
        el: '#main',
        data: {
            itemCatList: [],
            itemCatCondition: {
                name: '',
                pageSize:'',
                pageNum:1
            },
            currentPage:0,
            dataTotal:0,
            totalPage:0,
            chooseItemCat:{
                id:'',
                name:''
            },
            addItemCat:{
                name:''
            }
        },
        created: function(){
            this.queryItemCats();
        },
        watch:{
            "itemCatCondition.pageNum": function () {
                this.queryItemCats();
            },
            "itemCatCondition.name": function () {
                this.itemCatConditionChange();
            }
        },
        mounted:function () {},
        computed:{},
        methods: {
            itemCatConditionChange: function(){
                this.itemCatCondition.pageNum = 1;
                $("#pageMenu").page("destroy");
                this.queryItemCats();
            },
            //查询商品分类列表
            queryItemCats: function () {
                const temp = this;
                let url = contentPath + '/itemCat/itemCatList';
                this.$http.get(url , {params:this.itemCatCondition}).then(function (response) {
                    if (response.data.retcode!=2000000) {
                        swal(response.data.msg);
                        return;
                    }
                    if (response.data.data.list != null) {
                        this.itemCatList = response.data.data.list;
                    }
                    $("#pageMenu").page({
                        total: response.data.data.total,
                        pageSize: response.data.data.pageSize,
                        firstBtnText: '首页',
                        lastBtnText: '尾页',
                        prevBtnText: '上一页',
                        nextBtnText: '下一页',
                        showInfo: true,
                        showJump: true,
                        jumpBtnText: '跳转',
                        infoFormat: '{start} ~ {end}条，共{total}条'
                    }, response.data.data.pageNum)
                        .on("pageClicked", function (event, pageIndex) {
                            temp.itemCatCondition.pageNum = pageIndex + 1;
                        })
                        .on('jumpClicked', function (event, pageIndex) {
                            temp.itemCatCondition.pageNum = pageIndex + 1;
                        });
                }, function (error) {
                    toastr.error(error.body.msg, '查询商品分类列表失败！');
                });
            },
            //删除商品分类
            deleteItemCat:function (id) {
                let url = contentPath + '/itemCat/deleteItemCat/'+id;
                this.$http.post(url,this.itemCatCondition).then(function (response) {
                    this.itemCatCondition.pageNum = response.data.data.pageNum;
                    this.queryItemCats();
                }, function (error) {
                    toastr.error(error.body.msg, '商品分类删除失败！');
                });
            },
            //修改商品分类信息时数据回显
            toUpdateItemCat:function (itemCat) {
                this.chooseItemCat = itemCat;
            },
            //修改商品分类
            updateItemCatInfo:function () {
                let url = contentPath + '/itemCat/updateItemCat';
                this.$http.post(url,this.chooseItemCat).then(function (response) {
                    $("#myModal2").modal('hide');
                    this.queryItemCats();
                }, function (error) {
                    toastr.error(error.body.msg, '商品类目名修改失败！');
                });
            },
            //添加商品分类
            addItemCatInfo:function () {
                let url = contentPath + '/itemCat/addItemCat';
                this.$http.post(url,this.addItemCat).then(function (response) {
                    $("#myModal").modal('hide');
                    this.addItemCat.name='';
                    this.queryItemCats();
                }, function (error) {
                    toastr.error(error.body.msg, '商品类目添加失败！');
                });
            },
            clickAddBtn:function () {
                $("#myModal").modal('show');
            }
        }
    });
</script>
</body>
</html>