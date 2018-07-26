package com.zhongfl.fanhui.bean;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class User implements Serializable {

    private Integer id;

    private String  realName;

    private Integer age;

    private String mobile;

    private Integer gender;

    private String nickName;

    private  String department;

    private Integer deleted;

    private String createdBy;

    private Date createdTime;

    private Integer page;

    private Integer pageSize;
}
