package com.zhongfl.fanhui.bean.enums;

import lombok.Getter;

@Getter
public enum Education {

    ZHUAN_KE(1,"专科"),
    BEN_KE(2, "本科"),
    SHUO_SHI(3,"硕士"),
    BO_SHI(4, "博士"),
    OTHER(5,"其他");

    private  int value;

    private String education;

    private  Education(int value, String education){
        this.value = value;
        this.education = education;
    }
}
