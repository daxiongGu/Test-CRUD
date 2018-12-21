package com.zhongfl.wangyunkai.bean;

import lombok.Data;
import lombok.ToString;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

@Data
@ToString
public class User {
    /**
     * 学生id 自增长的
     */
    private Integer id;
    /**
     *学生姓名
     */
    private String name;
    /**
     * 学生性别
     */
    private String sex;
    /**
     * 学生班级
     */
    private Integer uclass;
    /**
     * 学生数学成绩
     */
    private Integer math;
    /**
     * 学生英语成绩
     */
    private Integer english;
    /**
     * 学生语文成绩
     */
    private Integer chinese;
}
