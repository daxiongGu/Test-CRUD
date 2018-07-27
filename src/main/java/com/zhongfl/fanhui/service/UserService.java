package com.zhongfl.fanhui.service;

import com.github.pagehelper.PageInfo;
import com.zhongfl.fanhui.bean.Department;
import com.zhongfl.fanhui.bean.User;

import java.util.List;

public interface UserService {

    void add(User user);

    PageInfo<User> findList(User user);

    void delete(Integer id);

    void update(User user);

    void deleteSome(String ids);

    List<Department> findDep();
}
