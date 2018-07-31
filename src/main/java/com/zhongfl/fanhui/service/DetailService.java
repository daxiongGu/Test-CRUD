package com.zhongfl.fanhui.service;

import com.zhongfl.fanhui.bean.Detail;

public interface DetailService {

    Detail select(Integer id);

    void update(Detail detail);
}
