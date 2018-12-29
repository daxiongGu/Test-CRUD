<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <link rel="shortcut icon" href="#" />
    <meta charset="utf-8">
    <title>Shop_Management_ItemCat</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <#include '../include/baselink.ftl'>
</head>
<body class="admin-modals-page sb-l-o sb-r-c onload-check">


    <div id="main">

        <#--菜单栏-->
        <div class="container" style="padding:5px;margin-left: 3px;">
            <ul class="nav nav-pills">
                <li><a href="/">商品信息管理</a></li>
                <li class="active"><a href="#">商品分类管理</a></li>
            </ul>
        </div>

        
        <div class="panel" style="margin-left: 4px;">
            <#--搜索框-->
            <div class="panel">
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
            <#--搜索框结束-->

            <#--数据展示-->
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
                            <button class="label label-info" data-toggle="modal" data-target="#myModal2" @click="toUpdateItemCat(itemCat)">
                                修改</button>
                            <button class="label label-success" @click="deleteItemCat(itemCat.id)">删除</button>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="20" v-if="itemCatList.length == 0" class="text-center">暂无数据!</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <#--数据展示结束-->

            <#--分页条-->
            <center>
                <div class="panel-footer" v-if="dataTotal > 0">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li>
                                <a href="#" @click="firstPage" aria-label="Previous">
                                    <span aria-hidden="true">首页</span>
                                </a>
                            </li>
                            <li v-if="currentPage != 1">
                                <a href="#" @click="prePage" aria-label="Previous">
                                    <span aria-hidden="true">上一页</span>
                                </a>
                            </li>
                            <li ><a href="#">第<span style="color: #ff4949">{{currentPage}}</span>页</a></li>
                            <li v-if="currentPage != totalPage">
                                <a href="#" @click="nextPage" aria-label="Next">
                                    <span aria-hidden="true">下一页</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" @click="endPage" aria-label="Previous">
                                    <span aria-hidden="true">尾页</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            <center>
            <#--分页条结束-->

            <#--修改商品分类-->
            <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">修改商品分类名称</h4>
                        </div>
                        <div class="modal-body">
                                <div class="form-group">
                                    <label for="exampleInputId">商品分类编号</label>
                                    <input type="text" class="form-control" name="title" v-model="chooseItemCat.id" id="exampleInputId" placeholder="id" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputTitle">商品分类名称</label>
                                    <input type="text" class="form-control" name="title" v-model="chooseItemCat.name" id="exampleInputTitle" placeholder="title">
                                </div>
                                <button type="submit" class="btn btn-default" @click="updateItemCatInfo">修改</button>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <#--修改商品结束-->

            <#--添加商品分类-->
            <button type="button" class="btn btn-primary btn" data-toggle="modal" data-target="#myModal" >
                添加商品分类
            </button>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">添加商品类目</h4>
                            </div>
                            <div class="modal-body">
                                <form action="/itemCat/addItemCat" method="post" id="ff">
                                    <div class="form-group">
                                        <label for="exampleInputTitle">商品分类名称</label>
                                        <input type="text" class="form-control" name="name" id="exampleInputTitle" placeholder="title" required>
                                    </div>
                                    <button type="submit" class="btn btn-default">添加</button>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            <#--添加商品结束-->

        </div>
    </div>

    <#include '../include/footer_js.ftl'/>
</body>
<#--Vue-->
<script>
    var app = new Vue({
        el: '#main',
        data: {
            itemCatList: [],
            itemCatCondition: {
                name: '',
                pageSize:'',
                pageNum:''
            },
            currentPage:0,
            dataTotal:0,
            totalPage:0,
            chooseItemCat:{
                id:'',
                name:'',
            },
        },
        created: function(){
            this.itemCatCondition.pageNum = 1;
            this.query();
        },
        watch:{
            "itemCatCondition.name": function () {
                this.itemCatCondition.pageNum = 1;
                this.query();
            },
        },
        mounted:function () {},
        computed:{},
        methods: {
            //查询商品分类列表
            query: function () {
                let url = contentPath + '/itemCat/itemCatList';
                this.$http.get(url , {params:this.itemCatCondition}).then(function (response) {
                    this.itemCatList = response.data.data.list;
                    this.currentPage = response.data.data.pageNum;
                    this.dataTotal = response.data.data.total;
                    this.totalPage = response.data.data.pages;
                }, function (error) {
                    toastr.error(error.body.msg, '查询商品分类列表失败！');
                });
            },
            //下一页
            nextPage:function(){
                this.itemCatCondition.pageNum = this.currentPage+1;
                this.query();
            },
            //上一页
            prePage:function(){
                this.itemCatCondition.pageNum = this.currentPage-1;
                this.query();
            },
            //首页
            firstPage:function(){
                this.itemCatCondition.pageNum = 1;
                this.query();
            },
            //尾页
            endPage:function(){
                this.itemCatCondition.pageNum = this.totalPage;
                this.query();
            },
            //删除商品分类
            deleteItemCat:function (id) {
                let url = contentPath + '/itemCat/deleteItemCat/'+id;
                this.$http.post(url,this.itemCatCondition).then(function (response) {
                    this.itemCatCondition.pageNum = response.data.data.pageNum;
                    this.query();
                }, function (error) {
                    toastr.error(error.body.msg, '商品分类删除失败！');
                });
            },
            //修改商品分类信息时数据回显
            toUpdateItemCat:function (itemCat) {
                this.chooseItemCat = itemCat;
            },
            //商品类目名称修改
            updateItemCatInfo:function () {
                let url = contentPath + '/itemCat/updateItemCat';
                this.$http.post(url,this.chooseItemCat).then(function (response) {
                    $("#myModal2").modal('hide');
                    this.query();
                }, function (error) {
                    toastr.error(error.body.msg, '商品类目名修改失败！');
                });
            }
        }
    });
</script>

</html>