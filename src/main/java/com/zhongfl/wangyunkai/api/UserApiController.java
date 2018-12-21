/**
 * @author 木叶丸
 * @date 2018/12/10 13:17
 */
package com.zhongfl.wangyunkai.api;

import com.sun.corba.se.impl.orbutil.concurrent.Sync;
import com.zhongfl.wangyunkai.bean.User;
import com.zhongfl.wangyunkai.bean.result.ResponseResult;
import com.zhongfl.wangyunkai.service.UserService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/api")
public class UserApiController {

    @Resource
    private UserService userService;

    @GetMapping("/userList") // 获取用户的订单列表
    public ResponseResult<List<User>> findAll(){
        List<User> users = userService.findAll();
        return new ResponseResult<List<User>>(users); // 相当于直接返回了一个list<User>的类型
    }
    @PostMapping("/userAdd")  // 需要使用postMapping方法
    public ResponseResult addUser(@RequestBody User user){
        userService.addUser(user);  //传进来一个id是没有关系的，我们底层是没有用到id的
        return new ResponseResult("添加用户成功");
    }
    @PostMapping("/findUserById")
    public ResponseResult<User> findUserById(@RequestBody User user){
        System.out.println(user);
        User userFindById = userService.findUserById(user.getId());
        return new ResponseResult(userFindById);
    }

    @PostMapping("/deleteOneUser")
    public ResponseResult deleteUser(@RequestBody User user){
        userService.deleteUser(user.getId());
        return new ResponseResult("成功了");
    }

    @PostMapping("deleteManyUser")
    public ResponseResult deleteManyUser(@RequestBody Integer[] a){
        for (Integer userId : a){
            userService.deleteUser(userId);
        }
        return new ResponseResult("删除多个用户成功");
    }

    @PostMapping("/updateUser")
    public ResponseResult updateUser(@RequestBody User user){
        userService.updateUser(user);
        return new ResponseResult("更新成功");
    }
}