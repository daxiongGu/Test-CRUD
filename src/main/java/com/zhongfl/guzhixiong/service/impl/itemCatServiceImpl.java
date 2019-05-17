package com.zhongfl.guzhixiong.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhongfl.guzhixiong.bean.model.ItemCat;
import com.zhongfl.guzhixiong.bean.model.req.ItemCatCondition;
import com.zhongfl.guzhixiong.mapper.ItemCatMapper;
import com.zhongfl.guzhixiong.mapper.ItemMapper;
import com.zhongfl.guzhixiong.service.ItemCatService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 商品分类Service实现
 */
@Service
@Slf4j
public class itemCatServiceImpl implements ItemCatService {

    @Resource
    ItemCatMapper itemCatMapper;

    @Resource
    ItemMapper itemMapper;

    /**
     * 获取商品类目分页列表
     * @param itemCatCondition 商品类目查询条件
     * @return 商品类目信息
     */
    @Override
    public PageInfo<ItemCat> getItemCatList(ItemCatCondition itemCatCondition) {
        log.info("查询条件为：{}",itemCatCondition);
        PageHelper.startPage(itemCatCondition.getPageNum(),itemCatCondition.getPageSize());
        List<ItemCat> itemCatList = itemCatMapper.selectItemCatList(itemCatCondition);
        return new PageInfo<ItemCat>(itemCatList);
    }

    /**
     * 插入商品类目
     * @param itemCat 商品分类信息
     */
    @Override
    @Transactional
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
    @Transactional
    public void deleteItemCatById(Integer id) {
        log.info("删除的分类ID：{}",id);
        itemCatMapper.deleteItemCat(id);
        //删除商品分类时同时删除商品表对应分类的商品
        itemMapper.deleteItemByCid(id);
    }

    /**
     * 获取所有商品类目
     * @return 商品分类列表
     */
    @Override
    public List<ItemCat> selectAllItemCat() {
        List<ItemCat> cats = itemCatMapper.selectAllItemCat();
        log.info("查询到所有商品分类：{}",cats);
        return cats;
    }

    /**
     * 修改商品类目
     * @param itemCat 商品分类信息
     */
    @Override
    @Transactional
    public void updateItemCatById(ItemCat itemCat) {
        itemCat.setUpdated(new Date());
        log.info("更新的商品分类信息：{}",itemCat);
        itemCatMapper.updateItemCatById(itemCat);
    }
}
