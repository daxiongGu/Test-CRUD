/**
 * @author 木叶丸
 * @date 2018/12/10 13:17
 */
package com.zhongfl.wangyunkai.service.impl;

import com.zhongfl.wangyunkai.bean.User;
import com.zhongfl.wangyunkai.mapper.UserMapper;
import com.zhongfl.wangyunkai.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import javax.annotation.Resource;
import java.util.List;
import java.util.regex.Pattern;

@Service
@Slf4j
public class UserServiceImpl implements UserService{

    @Resource
    private UserMapper userMapper;

    @Override
    public List<User> findAll() {
            List<User> users = userMapper.selectAll();
        return users;
    }

    @Override
    public void addUser(User user) {  // 需要使用正则表达式进行校验
        userMapper.addUser(user);
    }

    @Override
    public User findUserById(Integer value) {
        User user = userMapper.findUserById(value);
        return user;
    }

    @Override
    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    @Override
    public void deleteUser(Integer value) {
        userMapper.deleteUser(value);
    }
}
