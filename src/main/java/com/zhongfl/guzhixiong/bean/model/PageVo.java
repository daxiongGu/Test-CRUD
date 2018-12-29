package com.zhongfl.guzhixiong.bean.model;

/**
 * 分页辅助类
 */
public class PageVo {

    /**
     * 当前页
     */
    private Integer pageNum;

    /**
     * 每页大小
     */
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
