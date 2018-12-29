<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <link rel="shortcut icon" href="#" />
    <meta charset="utf-8">
    <title>Shop_Management_Item</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <#include 'include/baselink.ftl'>
</head>
<body class="admin-modals-page sb-l-o sb-r-c onload-check">


    <div id="main">

        <div class="container" style="padding:5px;margin-left: 3px;">
            <ul class="nav nav-pills">
                <li class="active"><a href="#">商品信息管理</a></li>
                <li><a href="/itemCat">商品分类管理</a></li>
            </ul>
        </div>

        <div class="panel" style="margin-left: 4px;">
            <#--搜索框-->
            <div class="panel">
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
                    </form>

                </div>
            </div>
            <#--搜索框结束-->

            <#--数据展示-->
            <div class="table-responsive">
                <table class="table table-bitemed table-hover table-condensed">
                    <thead>
                    <tr>
                        <th>商品编号</th>
                        <th>商品标题</th>
                        <th>商品价格(元)</th>
                        <th>库存数量</th>
                        <th>所属类目</th>
                        <th>商品状态</th>
                        <th>商品图片</th>
                        <th>创建时间</th>
                        <th>修改时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="item in itemList">
                        <td>{{item.id}}</td>
                        <td>{{item.title}}</td>
                        <td>{{item.price}}</td>
                        <td>{{item.num}}</td>
                        <td>{{item.catName}}</td>
                        <td v-if="item.status ==1">正常</td>
                        <td v-if="item.status ==2" style="color: #ff4949">下架</td>
                        <td><img :src="'http://localhost:8080'+item.image" alt="" width="40px" height="40px" class="img-thumbnail"></td>
                        <td>{{item.created}}</td>
                        <td>{{item.updated}}</td>
                        <td>
                            <button class="label label-info" data-toggle="modal" data-target="#myModal2" @click="toUpdateItem(item)">
                                修改</button>
                            <button class="label label-success" @click="deleteItem(item.id)">删除</button>
                        </td>
                        <td>
                            <a :href="'<@s.url "/item/detail?id="/>'+item.id" class="btn btn-sm btn-link">
                                查看该商品详情
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="20" v-if="itemList.length == 0" class="text-center">暂无数据!</td>
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

            <#--修改商品-->
            <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">修改商品信息</h4>
                        </div>
                        <div class="modal-body">
                            <#--<form>-->
                                <div class="form-group">
                                    <label for="exampleInputId">商品编号</label>
                                    <input type="text" class="form-control" name="title" v-model="chooseItem.id" id="exampleInputId" placeholder="id" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputTitle">商品标题</label>
                                    <input type="text" class="form-control" name="title" v-model="chooseItem.title" id="exampleInputTitle" placeholder="title">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPrice">商品价格(元)</label>
                                    <input type="text" class="form-control" name="price" v-model="chooseItem.price" id="exampleInputPrice" placeholder="price">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputNum">商品数量</label>
                                    <input type="text" class="form-control" name="num" v-model="chooseItem.num" id="exampleInputNum" placeholder="num">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputCat">商品所属类目</label>
                                    <select v-model="chooseItem.cid" name="cid" id="exampleInputCat" class="form-control">
                                        <option value="">选择类目</option>
                                        <template v-for="c in cats">
                                            <option :value="c.id">{{c.name}}</option>
                                        </template>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInpputStatus">商品状态</label>
                                    <input type="radio" id="up" name="status" value="1" v-model="chooseItem.status">
                                    <label for="up">正常</label>
                                    <input type="radio" id="down" name="status" value="2" v-model="chooseItem.status">
                                    <label for="down">下架</label>
                                </div>
                                <#--<div class="form-group">
                                    <label for="exampleInputImage">商品图片</label>
                                    <input type="file" id="exampleInputImage" name="image" >
                                </div>-->
                                <button type="submit" class="btn btn-default" @click="updateItemInfo">修改</button>
                            <#--</form>-->
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <#--修改商品结束-->

            <#--添加商品框-->
            <button type="button" @click="addItemBtn" class="btn btn-primary btn" data-toggle="modal" data-target="#myModal" >
                添加商品
            </button>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">添加商品</h4>
                            </div>
                            <div class="modal-body">
                                <form action="/item/addItem" method="post" enctype="multipart/form-data" id="ff">
                                    <div class="form-group">
                                        <label for="exampleInputTitle">商品标题</label>
                                        <input type="text" class="form-control" name="title" id="exampleInputTitle" placeholder="title" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPrice">商品价格(元)</label>
                                        <input type="text" class="form-control" name="price" id="exampleInputPrice" placeholder="price" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputNum">商品数量</label>
                                        <input type="text" class="form-control" name="num" id="exampleInputNum" placeholder="num" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputCat">商品所属类目</label>
                                        <select v-model="selectCid" name="cid" id="exampleInputCat" class="form-control" required>
                                            <option value="">选择类目</option>
                                            <template v-for="c in cats">
                                                <option :value="c.id">{{c.name}}</option>
                                            </template>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInpputStatus">商品状态</label>
                                        <input type="radio" id="up" name="status" value="1" v-model="selectStatus">
                                        <label for="up">正常</label>
                                        <input type="radio" id="down" name="status" value="2" v-model="selectStatus">
                                        <label for="down">下架</label>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputImage">商品图片</label>
                                        <input type="file" id="exampleInputImage" name="pic" multiple="true" accept="image/jpeg,jpg/png" required>
                                    </div>
                                    <button type="submit" class="btn btn-default" <#--@click="addItemInfo"-->>添加</button>
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

    <#include 'include/footer_js.ftl'/>
</body>
<#--Vue-->
<script>
    var app = new Vue({
        el: '#main',
        data: {
            itemList: [],
            itemCondition: {
                id: '',
                title: '',
                pageSize:'',
                pageNum:''
            },
            currentPage:0,
            dataTotal:0,
            totalPage:0,
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
            },
        },
        created: function(){
            this.query();
        },
        watch:{
            "itemCondition.id": function () {
                this.itemCondition.pageNum = 1;
                this.query();
            },
            "itemCondition.title": function () {
                this.itemCondition.pageNum = 1;
                this.query();
            },
        },
        mounted:function () {},
        computed:{},
        methods: {
            //查询商品列表
            query: function () {
                let url = contentPath + '/item/itemList';
                this.$http.get(url, {params:this.itemCondition}).then(function (response) {
                    this.itemList = response.data.data.list;
                    this.currentPage = response.data.data.pageNum
                    this.dataTotal = response.data.data.total
                    this.totalPage = response.data.data.pages
                }, function (error) {
                    toastr.error(error.body.msg, '查询商品列表失败！');
                });
            },
            //下一页
            nextPage:function(){
                this.itemCondition.pageNum = this.currentPage+1;
                this.query();
            },
            //上一页
            prePage:function(){
                this.itemCondition.pageNum = this.currentPage-1;
                this.query();
            },
            //首页
            firstPage:function(){
                this.itemCondition.pageNum = 1;
                this.query();
            },
            //尾页
            endPage:function(){
                this.itemCondition.pageNum = this.totalPage;
                this.query();
            },
            //删除商品信息
            deleteItem:function (id) {
                let url = contentPath + '/item/deleteItem/'+id;
                this.$http.post(url,this.itemCondition).then(function (response) {
                    this.itemList = response.data.data.list;
                    this.currentPage = response.data.data.pageNum
                    this.dataTotal = response.data.data.total
                    this.totalPage = response.data.data.pages
                }, function (error) {
                    toastr.error(error.body.msg, '商品删除失败！');
                });
            },
            //查询商品分类信息
            addItemBtn:function () {
                let url = contentPath + '/itemCat/itemCatAll';
                this.$http.get(url).then(function (response) {
                    this.cats = response.data.data;
                    this.selectCid = '';
                    this.selectStatus = 1;
                }, function (error) {
                    toastr.error(error.body.msg, '查询商品分类列表失败！');
                });
            },
            //修改商品信息时数据回显
            toUpdateItem:function (item) {
                this.addItemBtn();
                this.chooseItem = item;
            },
            //修改商品
            updateItemInfo:function () {
                let url = contentPath + '/item/updateItem';
                this.$http.post(url,this.chooseItem).then(function (response) {
                    $("#myModal2").modal('hide');
                    this.query();
                }, function (error) {
                    toastr.error(error.body.msg, '商品修改失败！');
                });
            }
        }
    });
</script>

</html>