package com.zhongfl.guzhixiong.mapper;

import com.zhongfl.guzhixiong.bean.model.User;

/**
 * 用户Mapper
 */
public interface UserMapper {

    /**
     * 根据用户ID查询用户信息
     * @param id 用户ID
     * @return
     */
    User selectUserById(Integer id);

    /**
     * 根据邮箱查询用户信息
     * @param email 邮箱
     * @return
     */
    User selectUserByEmail(String email);

    /**
     * 添加用户
     * @param user 用户信息
     */
    void insertUser(User user);

    /**
     * 根据邮箱修改用户密码
     */
    void updateUserByEmail(User user);

}
