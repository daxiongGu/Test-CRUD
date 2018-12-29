package com.zhongfl.guzhixiong.service;

import com.github.pagehelper.PageInfo;
import com.zhongfl.guzhixiong.bean.model.Item;
import com.zhongfl.guzhixiong.bean.model.ItemCat;
import com.zhongfl.guzhixiong.bean.model.ItemCondition;

import java.util.List;

/**
 * 商品Service接口
 */
public interface ItemService {

    /**
     * 根据搜索条件查询商品分页信息
     * @param itemCondition
     * @return
     */
    PageInfo<Item> findByPage(ItemCondition itemCondition);

    /**
     * 根据商品编号删除商品
     * @param id
     * @param itemCondition
     * @return
     */
    PageInfo<Item> deleteItemById(Integer id, ItemCondition itemCondition);

    /**
     * 插入商品信息
     * @param item
     * @return
     */
    boolean insertItem(Item item);

    /**
     * 修改商品信息
     * @param item
     * @return
     */
    boolean updateItem(Item item);

}
