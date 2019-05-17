package com.zhongfl.guzhixiong.bean.model.req;

import com.zhongfl.guzhixiong.util.PageVo;
import lombok.Data;

import java.io.Serializable;

/**
 * 商品查询条件
 */
@Data
public class ItemCondition extends PageVo implements Serializable{

    /**
     * 商品编号
     */
    private Integer id;

    /**
     * 商品标题
     */
    private String title;
    /**
     * 商品分类编号
     */
    private Integer cid;
}
