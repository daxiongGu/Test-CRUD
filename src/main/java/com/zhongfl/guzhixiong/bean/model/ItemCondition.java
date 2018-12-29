package com.zhongfl.guzhixiong.bean.model;

import java.io.Serializable;

/**
 * 商品查询条件类
 */
public class ItemCondition extends PageVo implements Serializable{

    private Integer id;

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
