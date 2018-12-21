/**
 * @author 木叶丸
 * @date 2018/12/10 13:17
 */
package com.zhongfl.wangyunkai.mapper;

import com.zhongfl.wangyunkai.bean.User;

import java.util.List;

public interface UserMapper{

    // 查询所有的用户
    List<User> selectAll();
    void addUser(User user);

    User findUserById(Integer value);
    void updateUser(User user);

    void deleteUser(Integer value);

}