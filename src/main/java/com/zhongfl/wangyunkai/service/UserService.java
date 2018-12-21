/**
 * @author 木叶丸
 * @date 2018/12/10 13:17
 */
package com.zhongfl.wangyunkai.service;

import com.zhongfl.wangyunkai.bean.User;

import java.util.List;

public interface UserService{
    List<User> findAll();

    void addUser(User user);

    User findUserById(Integer value);
    void updateUser(User user);

    void deleteUser(Integer value);
}