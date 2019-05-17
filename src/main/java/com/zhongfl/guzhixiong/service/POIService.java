package com.zhongfl.guzhixiong.service;

import com.zhongfl.guzhixiong.bean.model.User;

import java.io.IOException;
import java.util.List;

public interface POIService {

    /**
     * 统计所有用户信息到Excel中
     * @return 用户列表
     */
    List<User> createAllUserXls() throws IOException;
}
