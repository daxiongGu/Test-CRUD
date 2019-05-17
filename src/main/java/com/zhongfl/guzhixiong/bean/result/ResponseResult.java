package com.zhongfl.guzhixiong.bean.result;

import com.zhongfl.guzhixiong.bean.enums.RestResultEnum;

import java.io.Serializable;

public class ResponseResult<T> implements Serializable {
    private int retcode;
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
        this.data = data;
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
