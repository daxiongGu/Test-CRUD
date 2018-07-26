package com.zhongfl.fanhui.bean;

import lombok.Data;

import java.io.Serializable;

@Data
public class Department implements Serializable {

    private Integer id;

    private String name;

    private String detail;

    private Integer deleted;
}
