package com.zhongfl.guzhixiong.bean.model;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import java.util.Date;

/**
 * @author guzhixiong
 *
 * 商品实体类
 */
@Data
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
     * 商品所属分类ID
     */
    private Integer cid;
    /**
     * 商品状态（1、上架 2、下架）
     */
    private Integer status;


    /**
     * 商品图片（地址）
     */
    private String image;
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

}
