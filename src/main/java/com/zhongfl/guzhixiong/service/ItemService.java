package com.zhongfl.guzhixiong.service;

import com.github.pagehelper.PageInfo;
import com.zhongfl.guzhixiong.bean.model.Item;
import com.zhongfl.guzhixiong.bean.model.ItemCat;
import com.zhongfl.guzhixiong.bean.model.ItemCondition;

import java.util.List;

public interface ItemService {

    PageInfo<Item> findByPage(ItemCondition itemCondition);

    PageInfo<Item> deleteItemById(Integer id, ItemCondition itemCondition);

    boolean insertItem(Item item);

    boolean updateItem(Item item);

}
