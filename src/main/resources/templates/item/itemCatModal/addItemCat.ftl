<#--添加商品分类-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加商品类目</h4>
                </div>
                <div class="modal-body">
                    <form @submit.prevent="addItemCatInfo">
                        <div class="form-group">
                            <label for="exampleInputTitle">商品分类名称</label>
                            <input type="text" v-model="addItemCat.name" class="form-control" name="name" id="exampleInputTitle" placeholder="name" required>
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