package com.zhongfl.guzhixiong.service;

import com.zhongfl.guzhixiong.bean.model.User;
import com.zhongfl.guzhixiong.bean.result.ResponseResult;

import javax.servlet.http.HttpServletRequest;

/**
 * 用户Service层接口
 */
public interface UserService {
    /**
     * 根据用户ID查询用户信息
     * @param id 用户ID
     * @return
     */
    User selectUserById(Integer id);

    /**
     * 添加用户信息
     * @param user 用户信息
     * @return
     */
    boolean insertUser(User user);

    /**
     * 用户登录校验
     */
    ResponseResult userLogin(User user, HttpServletRequest request);

    /**
     * 发送邮件
     * @param title 邮件标题
     * @param email 邮件地址
     * @param content 邮件内容
     * @return
     */
    boolean sendMail(String title, String email, String content);

    /**
     * 发送重置密码链接
     * @param email 邮箱账号
     * @return
     */
    ResponseResult findPwd(String email);

    /**
     * 密码重置链接校验
     * @param key 校验码
     * @return
     */
    String resetPwdCheck(String key);

    /**
     * 修改密码
     * @param user 用户信息
     * @return
     */
    boolean updatePwd(User user);
}
