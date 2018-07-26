package com.zhongfl.fanhui.service;

import com.zhongfl.fanhui.bean.Department;

import java.util.List;

public interface DepService {

    List<Department> list(Department department);

    void update(Department department);

    void delete(Integer id);
}
