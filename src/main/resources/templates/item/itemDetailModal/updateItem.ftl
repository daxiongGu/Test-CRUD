    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改商品信息</h4>
                </div>
                <div class="modal-body">
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
                            <option v-for="c in cats" :value="c.id">{{c.name}}</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="exampleInpputStatus">商品状态</label>
                        <input type="radio" id="up" name="status" value="1" v-model="chooseItem.status">
                        <label for="up">正常</label>
                        <input type="radio" id="down" name="status" value="2" v-model="chooseItem.status">
                        <label for="down">下架</label>
                    </div>
                    <button type="submit" class="btn btn-default" @click="updateItemInfo">修改</button>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>