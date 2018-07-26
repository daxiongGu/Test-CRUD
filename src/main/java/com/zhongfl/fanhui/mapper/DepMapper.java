package com.zhongfl.fanhui.mapper;

import com.zhongfl.fanhui.bean.Department;

import java.util.List;

public interface DepMapper {

    List<Department> list(Department department);

    void update(Department department);

    void delete(Integer id);
}
