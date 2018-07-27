package com.zhongfl.fanhui.api;

import com.github.pagehelper.PageInfo;
import com.zhongfl.fanhui.bean.Department;
import com.zhongfl.fanhui.bean.User;
import com.zhongfl.fanhui.bean.result.ResponseResult;
import com.zhongfl.fanhui.service.UserService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("api/user")
public class UserApiController {

    @Resource
    private UserService userService;

    @PostMapping("/list")
    public ResponseResult list(@RequestBody User user){
        PageInfo<User> list = userService.findList(user);
        return new ResponseResult<>(list);
    }

    @PostMapping("/update")
    public ResponseResult update(@RequestBody User user){
        userService.update(user);
        return new ResponseResult();
    }

    @PostMapping("/insert")
    public ResponseResult insert(@RequestBody User user){
        userService.add(user);
        return new ResponseResult();
    }

    @GetMapping("/delete")
    public ResponseResult delete(Integer id){
        userService.delete(id);
        return new ResponseResult();
    }

    @PostMapping("/deleteSome")
    public ResponseResult deleteSome(String ids){
        userService.deleteSome(ids);
        return new ResponseResult();
    }

    @PostMapping("/findDep")
    public ResponseResult findDep(/*@RequestBody Department department*/){
        List<Department> dep = userService.findDep();
        return new ResponseResult<>(dep);
    }
}
