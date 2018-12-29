package com.zhongfl.guzhixiong.service;

import com.github.pagehelper.PageInfo;
import com.zhongfl.guzhixiong.bean.model.ItemCat;
import com.zhongfl.guzhixiong.bean.model.ItemCatCondition;

import java.util.List;

/**
 * 商品分类Service接口
 */
public interface ItemCatService {

    /**
     * 根据搜索条件获取商品类目分页列表
     * @param itemCatCondition
     * @return
     */
    PageInfo<ItemCat> getItemCatList(ItemCatCondition itemCatCondition);

    /**
     * 插入商品分类
     * @param itemCat
     */
    void insertItemCat(ItemCat itemCat);

    /**
     * 根据分类ID删除商品分类
     * @param id
     */
    void deleteItemCatById(Integer id);

    /**
     * 查询所有商品分类
     * @return
     */
    List<ItemCat> selectAllItemCat();

    /**
     * 根据分类ID修改商品分类信息
     * @param itemCat
     */
    void updateItemCatById(ItemCat itemCat);
}
