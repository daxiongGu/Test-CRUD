package com.zhongfl.fanhui.mapper;

import com.zhongfl.fanhui.bean.User;

import java.util.List;

public interface UserMapper {

     void insert(User user);

     void deleteById(Integer id);

     void  updateById(User user);

     List<User> select(User user);

}
