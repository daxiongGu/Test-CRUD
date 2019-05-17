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
                        <input type="text" class="form-control" name="title" v-model="chooseItemCat.name" id="exampleInputTitle" placeholder="title" required>
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