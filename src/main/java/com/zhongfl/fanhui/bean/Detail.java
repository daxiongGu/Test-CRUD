package com.zhongfl.fanhui.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.zhongfl.fanhui.bean.enums.Education;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Detail implements Serializable {

    private Integer staffId;

    private String  realName;

    private Integer age;

    private String mobile;

    private Integer gender;

    private String nickName;

    private Integer deptId;

    private String deptName;

    private Integer deleted;

    private String createdBy;

    private Date createdTime;

    private Integer page;

    private Integer pageSize;

    private Integer id;

    private String email;

    private String address;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date birthday;

    private Education education;

    private String educationName;

    private String university;

    private String major;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date enrollTime;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date educutTime;

    public String getEducationName() {
        if(education != null){
            return education.getEducation();
        }
        return "";
    }
}
