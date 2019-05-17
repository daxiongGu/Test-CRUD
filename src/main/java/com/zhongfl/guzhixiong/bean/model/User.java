package com.zhongfl.guzhixiong.bean.model;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户实体类
 */
@Data
public class User implements Serializable {
    /**
     * 用户ID
     */
    private Integer id;
    /**
     * 用户姓名
     */
    private String name;
    /**
     * 用户密码
     */
    private String password;
    /**
     * 用户把手机号
     */
    private String phone;
    /**
     * 用户邮箱
     */
    private String email;
    /**
     * 用户类型 1、普通用户 2、管理员
     */
    private Integer type;
    /**
     * 用户创建时间
     */
    private Date createTime;
    /**
     * 用户更新时间
     */
    private Date updateTime;
}
