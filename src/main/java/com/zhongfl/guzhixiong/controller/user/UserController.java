package com.zhongfl.guzhixiong.controller.user;

import com.zhongfl.guzhixiong.bean.model.User;
import com.zhongfl.guzhixiong.bean.result.ResponseResult;
import com.zhongfl.guzhixiong.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 用户Controller
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 用户登录校验
     * @param user 用户信息
     * @return
     */
    @PostMapping("/sign")
    @ResponseBody
    public ResponseResult userLogin(@RequestBody User user, HttpServletRequest request, HttpServletResponse response){
        ResponseResult result = userService.userLogin(user,request);
        return result;
    }

    /**
     * 用户注册
     * @param user 用户信息
     * @return
     */
    @PostMapping("/register")
    @ResponseBody
    public ResponseResult userAdd(@RequestBody User user){
        boolean flag = userService.insertUser(user);
        if(flag){
            return new ResponseResult();
        }
        return new ResponseResult(5000000,"该邮箱已经被注册了");
    }

    /**
     * 用户忘记密码
     * @param email 用户邮箱
     * @return
     */
    @ResponseBody
    @GetMapping("/findPwd/{email:.+}")
    public ResponseResult findPwd(@PathVariable("email") String email){
        return userService.findPwd(email);
    }

    /**
     * 根据邮箱修改用户密码
     * @param user 修改的用户信息
     * @return
     */
    @ResponseBody
    @PostMapping("/updatePwd")
    public ResponseResult updatePwd(@RequestBody User user,HttpServletRequest request){
        userService.updatePwd(user);
        //重新设置密码清空session，重新登录
        userService.clearLoginUser(request);
        return new ResponseResult();
    }

    /**
     * 重置密码链接
     * @param key 密码重置链接的确认码
     * @return
     */
    @GetMapping("/resetPwdSubmit")
    public String resetPwdSubmit(String key){
        String email = userService.resetPwdCheck(key);
        if (email == null){
            //链接已经失效
            return "redirect:/resetError";
        }
        return "redirect:/reset?email="+email;
    }

    /**
     * 用户退出
     * @return
     */
    @GetMapping("/logout")
    public String logout(HttpServletRequest request){
        userService.clearLoginUser(request);
        return "redirect:/sign";
    }
}
