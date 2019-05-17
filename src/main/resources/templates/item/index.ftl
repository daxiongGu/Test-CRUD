<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <link rel="shortcut icon" href="#"/>
    <meta charset="utf-8">
    <title>商品列表管理</title>
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
                    <li class="crumb-trail">商品列表管理</li>
                </ol>
            </div>
        </header>
        <#--Head end-->

        <!--Content start-->
        <section id="content" class="table-layout">
            <div class="tray tray-center">
                <div class="panel" id="spy7">

                    <#-- Content-Head start --->
                    <div class="panel-heading">
                        <span class="panel-icon"><i class="fa fa-table"></i></span>
                        <span class="panel-title">商品列表</span>
                        <span class="panel-controls">
                            <a href="#" class="btn btn-default btn-sm fw600 ml10" style="width: 105px"
                               v-on:click="showAddModal()" data-toggle="modal">
                                <span class="fa fa-plus pr5"></span>添加商品
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
                                        <div class="input-group-addon btn btn-default">按商品编号搜索</div>
                                        <input type="text" class="form-control input-sm" placeholder="请输入商品编号"
                                               v-model="itemCondition.id">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="input-group input-group-sm">
                                        <div class="input-group-addon btn btn-default">按商品名搜索</div>
                                        <input type="text" class="form-control input-sm" placeholder="请输入商品名"
                                               v-model="itemCondition.title">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="input-group input-group-sm">
                                        <div class="input-group-addon btn btn-default">按商品分类搜索</div>
                                        <select v-model="itemCondition.cid" class="form-control input-sm">
                                            <option value="">选择商品分类</option>
                                            <option v-for="cat in cats" :value="cat.id">{{cat.name}}</option>
                                        </select>
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
                                <table class="table table-striped table-responsive table-bordered">
                                    <thead>
                                    <tr>
                                        <th>编号</th>
                                        <th>商品标题</th>
                                        <th>价格(元)</th>
                                        <th>库存</th>
                                        <th>所属类目</th>
                                        <th>状态</th>
                                        <th>图片</th>
                                        <th>创建时间</th>
                                        <th>修改时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="item in itemList">
                                        <td>{{item.id}}</td>
                                        <td>{{item.title}}</td>
                                        <td>{{item.price}}元</td>
                                        <td>{{item.num}}</td>
                                        <td>{{item.catName}}</td>
                                        <td v-if="item.status =='UP'">正常</td>
                                        <td v-if="item.status =='DOWN'" style="color: #ff4949">下架</td>
                                        <td><img :src="'http://localhost:9999'+item.image" alt="" width="40px" height="40px" class="img-thumbnail"></td>
                                        <td>{{item.created}}</td>
                                        <td>{{item.updated}}</td>
                                        <td>
                                            <button class="label btn-info glyphicon glyphicon-pencil" data-toggle="modal" data-target="#myModal2" @click="toUpdateItem(item)">修改</button>
                                            <button class="label btn-danger glyphicon glyphicon-trash" @click="deleteItem(item.id)">删除</button>
                                        </td>
                                        <#--<td>
                                            <a :href="'<@s.url "/item/detail?id="/>'+item.id" class="btn btn-sm btn-link">
                                                查看该商品详情
                                            </a>
                                        </td>-->
                                    </tr>
                                    <tr>
                                        <td colspan="20" v-if="itemList.length == 0" class="text-center">暂无数据!</td>
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
        <!--Content end-->
        <#-- Update-item modal -->
        <#include 'itemDetailModal/updateItem.ftl'/>
        <#-- Add-item modal -->
        <#include 'itemDetailModal/addItem.ftl'/>
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
            itemList: [],
            itemCondition: {
                id: '',
                title: '',
                cid: '',
                pageNum: 1,
                pageSize:''
            },
            cats:[],
            selectCid:'',
            selectStatus:1,
            chooseItem:{
                id:'',
                title:'',
                price:'',
                num:'',
                cid:'',
                status:1
            }
        },
        created: function(){
            this.queryItem();
            this.selectItemCats();
        },
        watch:{
            "itemCondition.pageNum": function () {
                this.queryItem();
            },
            "itemCondition.id": function () {
                this.searchConditionChangeHandle();
            },
            "itemCondition.title": function () {
                this.searchConditionChangeHandle();
            },
            "itemCondition.cid": function () {
                this.searchConditionChangeHandle();
            }
        },
        mounted:function () {},
        computed:{},
        methods: {
            searchConditionChangeHandle: function(){
                this.itemCondition.pageNum=1;
                $("#pageMenu").page("destroy");
                this.queryItem();
            },
            //查询商品列表
            queryItem: function () {
                const temp = this;
                let url = contentPath + '/item/itemList';
                this.$http.get(url, {params:this.itemCondition}).then(function (response) {
                    if (response.data.retcode!=2000000) {
                        swal(response.data.msg);
                        return;
                    }
                    if (response.data.data.list != null) {
                        this.itemList = response.data.data.list;
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
                            temp.itemCondition.pageNum = pageIndex + 1;
                        })
                        .on('jumpClicked', function (event, pageIndex) {
                            temp.itemCondition.pageNum = pageIndex + 1;
                        });
                }, function (error) {
                    toastr.error(error.body.msg, '查询商品列表失败！');
                });
            },
            //删除商品信息
            deleteItem:function (id) {
                let url = contentPath + '/item/deleteItem/'+id;
                this.$http.post(url,this.itemCondition).then(function (response) {
                    if (response.data.retcode!=2000000) {
                        swal(response.data.msg);
                        return;
                    }
                    this.queryItem();
                }, function (error) {
                    toastr.error(error.body.msg, '商品删除失败！');
                });
            },
            //查询商品分类信息
            selectItemCats:function () {
                let url = contentPath + '/itemCat/itemCatAll';
                this.$http.get(url).then(function (response) {
                    if (response.data.retcode!=2000000) {
                        swal(response.data.msg);
                        return;
                    }
                    this.cats = response.data.data;
                    this.selectCid = '';
                    this.selectStatus = 1;
                }, function (error) {
                    toastr.error(error.body.msg, '查询商品分类列表失败！');
                });
            },
            //修改商品信息时数据回显
            toUpdateItem:function (item) {
                this.selectItemCats();
                this.chooseItem = item;
            },
            //修改商品
            updateItemInfo:function () {
                let url = contentPath + '/item/updateItem';
                this.$http.post(url,this.chooseItem).then(function (response) {
                    $("#myModal2").modal('hide');
                    this.queryItem();
                }, function (error) {
                    toastr.error(error.body.msg, '商品修改失败！');
                });
            },
            showAddModal:function () {
                $("#myModal").modal('show');
                this.selectItemCats();
            }
        }
    });
</script>
</body>
</html>