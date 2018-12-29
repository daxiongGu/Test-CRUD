package com.zhongfl.guzhixiong.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhongfl.guzhixiong.bean.model.ItemCat;
import com.zhongfl.guzhixiong.bean.model.ItemCatCondition;
import com.zhongfl.guzhixiong.mapper.ItemCatMapper;
import com.zhongfl.guzhixiong.mapper.ItemMapper;
import com.zhongfl.guzhixiong.service.ItemCatService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class itemCatServiceImpl implements ItemCatService {

    @Resource
    ItemCatMapper itemCatMapper;

    @Resource
    ItemMapper itemMapper;

    /**
     * 获取商品类目分页列表
     * @param itemCatCondition
     * @return
     */
    @Override
    public PageInfo<ItemCat> getItemCatList(ItemCatCondition itemCatCondition) {
        PageHelper.startPage(itemCatCondition.getPageNum(),itemCatCondition.getPageSize());
        List<ItemCat> itemCatList = itemCatMapper.selectItemCatList(itemCatCondition);
        return new PageInfo<ItemCat>(itemCatList);
    }

    /**
     * 插入商品类目
     * @param itemCat
     */
    @Override
    public void insertItemCat(ItemCat itemCat) {
        Date date = new Date();
        //插入时设置创建时间和修改时间为当前系统时间
        itemCat.setCreated(date);
        itemCat.setUpdated(date);
        System.out.println(itemCat.getName());
        itemCatMapper.insertItemCat(itemCat);
    }

    /**
     * 删除商品类目
     * @param id
     */
    @Override
    public void deleteItemCatById(Integer id) {
        itemCatMapper.deleteItemCat(id);
        //删除商品分类时同时删除商品表对应分类的商品
        itemMapper.deleteItemByCid(id);
    }

    /**
     * 获取所有商品类目
     * @return
     */
    @Override
    public List<ItemCat> selectAllItemCat() {
        return itemCatMapper.selectAllItemCat();
    }

    /**
     * 修改商品类目
     * @param itemCat
     */
    @Override
    public void updateItemCatById(ItemCat itemCat) {
        //更新修改时间
        itemCat.setUpdated(new Date());
        itemCatMapper.updateItemCatById(itemCat);
    }
}
