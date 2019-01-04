package com.zhongfl.guzhixiong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


/**
 * 首页路由
 * @author fengqiang
 */
@Controller
public class IndexController {

    @GetMapping("/index")
    public String index(){
        return "index";
    }

    @GetMapping("/")
    public String index2(){
        return "index";
    }

    @GetMapping("/itemCat")
    public String index3(){ return "item/itemCatManage";
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
}
