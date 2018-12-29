package com.zhongfl.guzhixiong.mapper;

import com.zhongfl.guzhixiong.bean.model.Item;
import com.zhongfl.guzhixiong.bean.model.ItemCondition;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 商品Mapper
 */
public interface ItemMapper {

     /**
      * 根据商品编号查询商品信息
      * @param id
      * @return
      */
     Item selectItemById(Integer id);

     /**
      * 根据条件搜索商品列表
      * @param itemCondition
      * @return
      */
     List<Item> selectItemList(ItemCondition itemCondition);

     /**
      * 根据商品编号删除商品信息
      * @param id
      * @return
      */
     int deleteItemById(Integer id);

     /**
      * 插入商品信息
      * @param item
      * @return
      */
     int insertItem(Item item);

     /**
      * 修改商品信息
      * @param item
      * @return
      */
     int updateItemById(Item item);

     /**
      * 根据商品分类ID删除对应商品信息
      * @param cid
      * @return
      */
     int deleteItemByCid(Integer cid);
}
