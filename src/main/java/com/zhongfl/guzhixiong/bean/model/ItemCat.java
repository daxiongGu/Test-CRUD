package com.zhongfl.guzhixiong.bean.model;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 商品分类
 */
@Data
public class ItemCat implements Serializable {
    /**
     * 商品分类ID
     */
    private Integer id;
    /**
     * 商品分类名
     */
    private String name;
    /**
     * 创建时间
     */
    private Date created;
    /**
     * 修改时间
     */
    private Date updated;
}
