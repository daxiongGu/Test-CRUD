package com.zhongfl.guzhixiong.mapper;

import com.zhongfl.guzhixiong.bean.model.Item;
import com.zhongfl.guzhixiong.bean.model.ItemCondition;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ItemMapper {

     Item selectItemById(Integer id);

     List<Item> selectItemList(ItemCondition itemCondition);

     int deleteItemById(Integer id);

     int insertItem(Item item);

     int updateItemById(Item item);

     int deleteItemByCid(Integer cid);
}
