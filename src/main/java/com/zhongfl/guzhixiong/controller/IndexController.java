package com.zhongfl.guzhixiong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * 首页路由
 * @author fengqiang
 */
@Controller
public class IndexController {

    @GetMapping("/")
    public String index2(){
        return "index";
    }

    @GetMapping("/itemCat")
    public String itemCat(){
        return "item/itemCatManage";
    }

    @GetMapping("/itemList")
    public String itemList(){
        return "item/index";
    }

    @GetMapping("/sign")
    public String sign(){
        return "user/sign";
    }

    @GetMapping("/register")
    public String register(){
        return "user/register";
    }

    @GetMapping("/resetError")
    public String resetError(){
        return "user/resetError";
    }

    @GetMapping("/reset")
    public String reset(){
        return "user/reset";
    }

    @GetMapping("/index")
    public String index(HttpServletResponse response) throws IOException {
        return "index";
    }

    @GetMapping("/updateTime")
    public String updateTime(){
        return "/updateTime/update";
    }
}
