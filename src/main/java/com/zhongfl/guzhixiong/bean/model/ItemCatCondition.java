package com.zhongfl.guzhixiong.bean.model;

import java.io.Serializable;

/**
 * 商品分类查询条件类
 */
public class ItemCatCondition extends PageVo implements Serializable {

    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
