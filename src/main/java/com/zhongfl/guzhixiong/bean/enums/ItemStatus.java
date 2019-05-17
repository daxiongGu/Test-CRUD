package com.zhongfl.guzhixiong.bean.enums;

import lombok.Getter;

/**
 * @author daxiong
 * @date 2019/4/13
 */
public enum ItemStatus {

    UP(1,"正常"),
    DOWN(2,"删除");

    @Getter
    private Integer key;
    @Getter
    private String desc;

    ItemStatus(Integer key,String desc){
        this.key = key;
        this.desc = desc;
    }
}
