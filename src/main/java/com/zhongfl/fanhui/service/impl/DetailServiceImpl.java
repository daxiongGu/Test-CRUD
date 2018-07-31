package com.zhongfl.fanhui.service.impl;

import com.zhongfl.fanhui.bean.Detail;
import com.zhongfl.fanhui.bean.User;
import com.zhongfl.fanhui.mapper.DepMapper;
import com.zhongfl.fanhui.mapper.DetailMapper;
import com.zhongfl.fanhui.mapper.UserMapper;
import com.zhongfl.fanhui.service.DetailService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DetailServiceImpl implements DetailService {

    @Resource
    private DetailMapper detailMapper;

    @Resource
    private DepMapper depMapper;

    @Resource
    private UserMapper userMapper;

    @Override
    public void update(Detail detail) {
        detailMapper.update(detail);
        userMapper.updateDetail(detail);
    }

    @Override
    public Detail select(Integer id) {
        Detail detail = detailMapper.select(id);
        return detail;
    }
}
