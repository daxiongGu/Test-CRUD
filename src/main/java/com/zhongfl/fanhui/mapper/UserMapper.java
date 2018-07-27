package com.zhongfl.fanhui.mapper;

import com.zhongfl.fanhui.bean.Department;
import com.zhongfl.fanhui.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

     void insert(User user);

     void deleteById(Integer id);

     void  updateById(User user);

     void updateDept(@Param("oldId") Integer oldId, @Param("newId") Integer newId);

     List<User> select(User user);

     List<Department> findDep();

}
