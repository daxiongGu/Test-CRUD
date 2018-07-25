package com.zhongfl.fanhui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


/**
 * 首页路由
 * @author fengqiang
 */
@Controller
public class IndexController {

    @GetMapping("/")
    public String root(){
        return "index1";
    }

    @GetMapping("/index")
    public String index(){
        return "index1";
    }
}
