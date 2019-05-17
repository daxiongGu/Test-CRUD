package com.zhongfl.guzhixiong.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhongfl.guzhixiong.bean.model.Item;
import com.zhongfl.guzhixiong.bean.model.req.ItemCondition;
import com.zhongfl.guzhixiong.util.ImageUpload;
import com.zhongfl.guzhixiong.mapper.ItemCatMapper;
import com.zhongfl.guzhixiong.mapper.ItemMapper;
import com.zhongfl.guzhixiong.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 商品Service实现
 */
@Service
@Slf4j
public class ItemServiceImpl implements ItemService {

    @Resource
    private ItemMapper itemMapper;

    @Resource
    private ItemCatMapper itemCatMapper;

    /**
     * 商品图片上传绝对路径
     */
    @Value("${file.image-path}")
    private String imagePath;

    /**
     * 图片展示对应路径
     */
    @Value("${file.image-prefix}")
    private String imgPrefix;

    /**
     * 获取商品分页信息
     * @param itemCondition 商品搜索条件
     * @return 商品分页信息
     */
    @Override
    public PageInfo<Item> findByPage(ItemCondition itemCondition) {
        log.info("查询商品列表条件：{}",itemCondition);
        PageHelper.startPage(itemCondition.getPageNum(),itemCondition.getPageSize());
        List<Item> itemList = itemMapper.selectItemList(itemCondition);
        if (itemList.size()>0) {
            itemList.forEach(item ->{
                //根据类目id设置商品的分类名称
                item.setCatName(itemCatMapper.selectItemCatById(item.getCid()).getName());
            });
        }
        return new PageInfo<>(itemList);
    }

    /**
     * 删除商品信息
     * @param id 商品编号
     * @param itemCondition 商品分页条件
     * @return 商品分页列表
     */
    @Override
    @Transactional
    public int deleteItemById(Integer id,ItemCondition itemCondition) {
        return itemMapper.deleteItemById(id);
    }

    /**
     * 插入商品信息
     * @param item 商品信息
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean insertItem(Item item) {
        item.setCreated(new Date());
        item.setUpdated(new Date());
        //上传图片到本地文件夹
        String p = ImageUpload.getImgPath(item.getPic(),imagePath);
        //数据库里存储图片的访问地址
        item.setImage(imgPrefix+"/"+p);
        log.info("插入的商品信息：{}",item);

        int row = itemMapper.insertItem(item);
        if (row > 0){
            return true;
        }
        return  false;
    }

    /**
     * 修改商品信息
     * @param item 商品信息
     * @return
     */
    @Override
    @Transactional
    public boolean updateItem(Item item) {
        log.info("修改后商品信息：{}",item);
        item.setUpdated(new Date());
        int f = itemMapper.updateItemById(item);
        if (f>0){
            return true;
        }
        return false;
    }
}
