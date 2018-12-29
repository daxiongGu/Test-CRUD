package com.zhongfl.guzhixiong.mapper;

import com.zhongfl.guzhixiong.bean.model.ItemCat;
import com.zhongfl.guzhixiong.bean.model.ItemCatCondition;

import java.util.List;

/**
 * 商品分类Mapper
 */
public interface ItemCatMapper {

    /**
     * 根据分类ID查询分类信息
     * @param id
     * @return
     */
    ItemCat selectItemCatById(Integer id);

    /**
     * 根据搜索条件查询分类列表
     * @param itemCatCondition
     * @return
     */
    List<ItemCat> selectItemCatList(ItemCatCondition itemCatCondition);

    /**
     * 插入商品分类
     * @param itemCat
     * @return
     */
    int insertItemCat(ItemCat itemCat);

    /**
     * 根据分类ID删除商品分类
     * @param id
     * @return
     */
    int deleteItemCat(Integer id);

    /**
     * 查询所有商品分类
     * @return
     */
    List<ItemCat> selectAllItemCat();

    /**
     * 根据分类ID修改分类信息
     * @param itemCat
     */
    void updateItemCatById(ItemCat itemCat);
}
