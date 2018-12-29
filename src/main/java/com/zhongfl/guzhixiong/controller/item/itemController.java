package com.zhongfl.guzhixiong.controller.item;

import com.github.pagehelper.PageInfo;
import com.zhongfl.guzhixiong.bean.enums.RestResultEnum;
import com.zhongfl.guzhixiong.bean.model.Item;
import com.zhongfl.guzhixiong.bean.model.ItemCat;
import com.zhongfl.guzhixiong.bean.model.ItemCondition;
import com.zhongfl.guzhixiong.bean.result.ResponseResult;
import com.zhongfl.guzhixiong.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * 商品信息Controller
 */
@Controller
@RequestMapping("/item")
public class itemController {

    @Autowired
    private ItemService itemService;

    /**
     * 获取商品分页信息
     * @param itemCondition
     * @return
     */
    @GetMapping("/itemList")
    @ResponseBody
    public ResponseResult<PageInfo<Item>> findByPage(ItemCondition itemCondition){
        if(itemCondition == null){
            itemCondition = new ItemCondition();
        }
        PageInfo<Item> page = itemService.findByPage(itemCondition);
        return new ResponseResult<PageInfo<Item>>(page);
    }

    /**
     * 根据商品id删除商品信息
     * @param id
     * @param itemCondition
     * @return
     */
    @PostMapping("/deleteItem/{id}")
    @ResponseBody
    public ResponseResult<PageInfo<Item>> deleteItem(@PathVariable Integer id,@RequestBody ItemCondition itemCondition){
        System.out.println(itemCondition.getId()+","+itemCondition.getTitle()+","+itemCondition.getPageNum()+","+itemCondition.getPageSize());
        PageInfo<Item> page = itemService.deleteItemById(id,itemCondition);
        return new ResponseResult<PageInfo<Item>>(page);
    }

    /**
     * 添加商品
     * @param item
     * @return
     */
    @PostMapping("/addItem")
    public String insertItem(Item item){
        System.out.println("add:"+item+","+item.getStatus()+","+item.getTitle());
        itemService.insertItem(item);
        return "redirect:/index";
    }

    /**
     * 根据商品id修改商品
     * @param item
     * @return
     */
    @PostMapping("/updateItem")
    @ResponseBody
    public ResponseResult updateItem(@RequestBody Item item){
        System.out.println("update:"+item.getId());
        itemService.updateItem(item);
        return new ResponseResult();
    }
}
