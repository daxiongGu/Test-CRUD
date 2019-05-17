package com.zhongfl.guzhixiong.controller.item;

import com.github.pagehelper.PageInfo;
import com.zhongfl.guzhixiong.bean.model.Item;
import com.zhongfl.guzhixiong.bean.model.req.ItemCondition;
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
        return new ResponseResult<>(page);
    }

    /**
     * 根据商品id删除商品信息
     * @param id
     * @param itemCondition
     * @return
     */
    @PostMapping("/deleteItem/{id}")
    @ResponseBody
    public ResponseResult deleteItem(@PathVariable Integer id,@RequestBody ItemCondition itemCondition){
        int flag = itemService.deleteItemById(id,itemCondition);
        if (flag>0)
            return new ResponseResult();
        else
            return new ResponseResult(66666,"删除商品失败");
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
        return "redirect:/itemList";
    }

    /**
     * 根据商品id修改商品
     * @param item
     * @return
     */
    @PostMapping("/updateItem")
    @ResponseBody
    public ResponseResult updateItem(@RequestBody Item item){
        itemService.updateItem(item);
        return new ResponseResult();
    }
}
