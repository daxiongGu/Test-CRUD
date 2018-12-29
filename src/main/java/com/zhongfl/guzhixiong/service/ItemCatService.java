package com.zhongfl.guzhixiong.service;

import com.github.pagehelper.PageInfo;
import com.zhongfl.guzhixiong.bean.model.ItemCat;
import com.zhongfl.guzhixiong.bean.model.ItemCatCondition;

import java.util.List;

public interface ItemCatService {

    PageInfo<ItemCat> getItemCatList(ItemCatCondition itemCatCondition);

    void insertItemCat(ItemCat itemCat);

    void deleteItemCatById(Integer id);

    List<ItemCat> selectAllItemCat();

    void updateItemCatById(ItemCat itemCat);
}
