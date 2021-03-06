package com.zhongfl.guzhixiong.controller.item;

import com.github.pagehelper.PageInfo;
import com.zhongfl.guzhixiong.bean.model.ItemCat;
import com.zhongfl.guzhixiong.bean.model.req.ItemCatCondition;
import com.zhongfl.guzhixiong.bean.result.ResponseResult;
import com.zhongfl.guzhixiong.service.ItemCatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 商品分类Controller
 */
@Controller
@RequestMapping("/itemCat")
public class ItemCatController {

    @Autowired
    private ItemCatService itemCatService;

    /**
     * 获取商品分页列表
     * @param itemCatCondition
     * @return
     */
    @ResponseBody
    @GetMapping("/itemCatList")
    public ResponseResult<PageInfo<ItemCat>> getItemCatList(ItemCatCondition itemCatCondition){
        PageInfo<ItemCat> itemCatPage = itemCatService.getItemCatList(itemCatCondition);
        return new ResponseResult<>(itemCatPage);
    }

    /**
     * 新增商品分类
     * @param itemCat
     * @return
     */
    @PostMapping("/addItemCat")
    @ResponseBody
    public ResponseResult insertItem(@RequestBody ItemCat itemCat){
        itemCatService.insertItemCat(itemCat);
        return new ResponseResult();
    }

    /**
     * 根据商品分类id删除类目
     * @param id
     * @param itemCatCondition
     * @return
     */
    @PostMapping("/deleteItemCat/{id}")
    @ResponseBody
    public ResponseResult deleteItem(@PathVariable Integer id,@RequestBody ItemCatCondition itemCatCondition){
        itemCatService.deleteItemCatById(id);
        return new ResponseResult(itemCatCondition);
    }

    /**
     * 获取所有商品类目
     * @return
     */
    @GetMapping("/itemCatAll")
    @ResponseBody
    public ResponseResult<List<ItemCat>> getIAlltemCat(){
        List<ItemCat> itemCats = itemCatService.selectAllItemCat();
        return new ResponseResult<>(itemCats);
    }

    /**
     * 修改商品类目
     * @param itemCat
     * @return
     */
    @PostMapping("/updateItemCat")
    @ResponseBody
    public ResponseResult updateItemCat(@RequestBody ItemCat itemCat){
        itemCatService.updateItemCatById(itemCat);
        return new ResponseResult();
    }
}
