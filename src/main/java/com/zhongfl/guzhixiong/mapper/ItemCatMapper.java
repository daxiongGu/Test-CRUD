package com.zhongfl.guzhixiong.mapper;

import com.zhongfl.guzhixiong.bean.model.ItemCat;
import com.zhongfl.guzhixiong.bean.model.ItemCatCondition;

import java.util.List;

public interface ItemCatMapper {

    ItemCat selectItemCatById(Integer id);

    List<ItemCat> selectItemCatList(ItemCatCondition itemCatCondition);

    int insertItemCat(ItemCat itemCat);

    int deleteItemCat(Integer id);

    List<ItemCat> selectAllItemCat();

    void updateItemCatById(ItemCat itemCat);
}
