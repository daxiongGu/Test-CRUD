package com.zhongfl.guzhixiong.bean.model;

import java.io.Serializable;

/**
 * 商品查询条件
 */
public class ItemCondition extends PageVo implements Serializable{

    /**
     * 商品编号
     */
    private Integer id;

    /**
     * 商品标题
     */
    private String title;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

}
