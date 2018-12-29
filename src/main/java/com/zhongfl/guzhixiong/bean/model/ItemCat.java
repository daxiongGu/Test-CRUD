package com.zhongfl.guzhixiong.bean.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 商品分类表
 */
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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }
}
