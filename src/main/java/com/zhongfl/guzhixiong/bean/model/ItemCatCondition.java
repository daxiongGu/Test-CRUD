package com.zhongfl.guzhixiong.bean.model;

import java.io.Serializable;

/**
 * 商品分类查询条件
 */
public class ItemCatCondition extends PageVo implements Serializable {
    /**
     * 类目名称
     */
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
