package com.zhongfl.guzhixiong.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhongfl.guzhixiong.bean.model.Item;
import com.zhongfl.guzhixiong.bean.model.ItemCat;
import com.zhongfl.guzhixiong.bean.model.ItemCondition;
import com.zhongfl.guzhixiong.bean.util.ImageUpload;
import com.zhongfl.guzhixiong.mapper.ItemCatMapper;
import com.zhongfl.guzhixiong.mapper.ItemMapper;
import com.zhongfl.guzhixiong.service.ItemService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class ItemServiceImpl implements ItemService {

    @Resource
    private ItemMapper itemMapper;

    @Resource
    private ItemCatMapper itemCatMapper;

    @Value("${file.image-path}")
    private String imagePath;

    @Value("${file.image-prefix}")
    private String imgPrefix;

    /**
     * 获取商品分页信息
     * @param itemCondition
     * @return
     */
    @Override
    public PageInfo<Item> findByPage(ItemCondition itemCondition) {
        PageHelper.startPage(itemCondition.getPageNum(),itemCondition.getPageSize());
        List<Item> itemList = itemMapper.selectItemList(itemCondition);
        if (itemList.size()>0) {
            itemList.forEach(item ->{
                //根据类目id设置商品的分类名称
                item.setCatName(itemCatMapper.selectItemCatById(item.getCid()).getName());
            });
        }
        return new PageInfo<Item>(itemList);
    }

    /**
     * 删除商品信息
     * @param id
     * @param itemCondition
     * @return
     */
    @Override
    public PageInfo<Item> deleteItemById(Integer id,ItemCondition itemCondition) {
        itemMapper.deleteItemById(id);
        return findByPage(itemCondition);
    }

    /**
     * 插入商品信息
     * @param item
     * @return
     */
    @Override
    public boolean insertItem(Item item) {
        item.setCreated(new Date());
        item.setUpdated(new Date());
        //上传图片到本地文件夹
        String p = ImageUpload.getImgPath(item.getPic(),imagePath);
        //数据库里存储图片的访问地址
        item.setImage(imgPrefix+"/"+p);
        int row = itemMapper.insertItem(item);
        if (row > 0){
            return true;
        }
        return  false;
    }

    /**
     * 修改商品信息
     * @param item
     * @return
     */
    @Override
    public boolean updateItem(Item item) {
        item.setUpdated(new Date());
        //item.setImage(ImageUpload.getImgPath(item.getPic(),imagePath));
        int f = itemMapper.updateItemById(item);
        if (f>0){
            return true;
        }
        return false;
    }
}
