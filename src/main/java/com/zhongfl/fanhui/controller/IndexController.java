package com.zhongfl.fanhui.controller;

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
        return "index1";
    }

    @GetMapping("/department")
    public String dep(){
        return "department";
    }
}
