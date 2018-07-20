package com.zhongfl.fanhui.service;

import com.zhongfl.fanhui.bean.User;

import java.util.List;

public interface UserService {

    void add(User user);

    List<User> findList(User user);

    void delete(Integer id);

    void update(User user);

}
