package com.zhongfl.guzhixiong.bean.model.req;

import com.zhongfl.guzhixiong.util.PageVo;
import lombok.Data;

import java.io.Serializable;

/**
 * 商品分类查询条件
 */
@Data
public class ItemCatCondition extends PageVo implements Serializable {
    /**
     * 类目名称
     */
    private String name;
}
