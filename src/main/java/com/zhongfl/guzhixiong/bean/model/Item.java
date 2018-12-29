package com.zhongfl.guzhixiong.bean.model;

import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import java.util.Date;

/**
 * 商品
 */
public class Item implements Serializable {
    /**
     * 商品编号（ID）
     */
    private Integer id;
    /**
     * 商品标题
     */
    private String title;
    /**
     * 商品价格
     */
    private Float price;
    /**
     * 库存数量
     */
    private Integer num;
    /**
     * 商品图片（地址）
     */
    private String image;
    /**
     * 商品所属分类ID
     */
    private Integer cid;
    /**
     * 商品状态（1、上架 2、下架）
     */
    private Integer status;
    /**
     * 创建时间
     */
    private Date created;
    /**
     * 修改时间
     */
    private Date updated;

    /**
     * 商品分类名称
     */
    private String catName;
    /**
     * 商品图片
     */
    private MultipartFile pic;

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

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }

    public MultipartFile getPic() {
        return pic;
    }

    public void setPic(MultipartFile pic) {
        this.pic = pic;
    }
}
