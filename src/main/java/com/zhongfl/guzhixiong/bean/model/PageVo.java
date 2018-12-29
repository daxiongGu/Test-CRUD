package com.zhongfl.guzhixiong.bean.model;

/**
 * 分页辅助类
 */
public class PageVo {

    private Integer pageNum;

    private Integer pageSize;

    public Integer getPageNum() {
        if(this.pageNum == null)
            pageNum = 1;
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        if(this.pageSize == null)
            pageSize = 6;
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
}
