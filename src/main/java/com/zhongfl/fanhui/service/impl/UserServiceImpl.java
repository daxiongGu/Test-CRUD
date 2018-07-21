package com.zhongfl.fanhui.service.impl;

import com.zhongfl.fanhui.bean.User;
import com.zhongfl.fanhui.mapper.UserMapper;
import com.zhongfl.fanhui.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl  implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public void add(User user) {
        userMapper.insert(user);
    }

    @Override
    public List<User> findList(User user) {
        List<User> users = userMapper.select(user);
        return users;
    }

    @Override
    public void delete(Integer id) {
        userMapper.deleteById(id);
    }

    @Override
    public void update(User user) {
        userMapper.updateById(user);
    }


}
