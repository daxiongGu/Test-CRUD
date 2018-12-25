package com.zhongfl.kangkai.bean.result;

import com.zhongfl.kangkai.bean.enums.RestResultEnum;

import java.io.Serializable;

public class ResponseResult<T> implements Serializable {
    private int retcode; // 返回的码值
    private String msg;
    private T data;

    public ResponseResult() {
        this.retcode = RestResultEnum.SUCCESS.getKey();
    }

    public ResponseResult(int code, String message) {
        this.retcode = code;
        this.msg = message;
    }

    public ResponseResult(RestResultEnum restResultInfoEnum) {
        this.retcode = restResultInfoEnum.getKey();
        this.msg = restResultInfoEnum.getMessage();
    }

    public ResponseResult(RestResultEnum restResultInfoEnum, T data) {
        this.retcode = restResultInfoEnum.getKey();
        this.msg = restResultInfoEnum.getMessage();
        this.data = data;
    }

    public ResponseResult(T data) {
        this.retcode = RestResultEnum.SUCCESS.getKey();
        this.data = data;  // 直接返回data数据
    }

    public int getRetcode() {
        return this.retcode;
    }

    public void setRetcode(int retcode) {
        this.retcode = retcode;
    }

    public String getMsg() {
        return this.msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return this.data;
    }

    public void setData(T data) {
        this.data = data;
    }

}
