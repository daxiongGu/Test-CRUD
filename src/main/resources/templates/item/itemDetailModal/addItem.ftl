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
                            <option v-for="c in cats" :value="c.id">{{c.name}}</option>
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