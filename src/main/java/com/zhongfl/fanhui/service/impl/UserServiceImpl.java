package com.zhongfl.fanhui.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
    public PageInfo<User> findList(User user) {
        PageHelper.startPage(user.getPage(),user.getPageSize());
        List<User> users = userMapper.select(user);
        return new PageInfo<User>(users);
    }

    @Override
    public void delete(Integer id) {
        userMapper.deleteById(id);
    }

    @Override
    public void update(User user) {
        userMapper.updateById(user);
    }

    @Override
    public void deleteSome(String ids) {
        String[] ss = ids.split(",");
        for(String s : ss){
            userMapper.deleteById(Integer.parseInt(s));
        }
    }

}
