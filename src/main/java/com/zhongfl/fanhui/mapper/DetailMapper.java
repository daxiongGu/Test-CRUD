package com.zhongfl.fanhui.mapper;

import com.zhongfl.fanhui.bean.Detail;

import java.util.List;

public interface DetailMapper {

    Detail select(Integer id);

    void update(Detail detail);
}
