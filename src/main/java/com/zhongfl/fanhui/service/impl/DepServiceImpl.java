package com.zhongfl.fanhui.service.impl;

import com.zhongfl.fanhui.bean.Department;
import com.zhongfl.fanhui.mapper.DepMapper;
import com.zhongfl.fanhui.mapper.UserMapper;
import com.zhongfl.fanhui.service.DepService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DepServiceImpl implements DepService {

    @Resource
    private DepMapper depMapper;

    @Resource
    private UserMapper userMapper;

    @Override
    public List<Department> list(Department department) {
        List<Department> list = depMapper.list(department);
        return list;
    }

    @Override
    public void delete(Integer oldId, Integer newId) {
        depMapper.delete(oldId);
        userMapper.updateDept(oldId, newId);
    }



    @Override
    public void insert(Department department) {
        depMapper.insert(department);
    }

    @Override
    public void update(Department department) {
        depMapper.update(department);
    }
}
