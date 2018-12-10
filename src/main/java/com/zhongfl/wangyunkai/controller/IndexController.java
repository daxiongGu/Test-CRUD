package com.zhongfl.wangyunkai.controller;

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

}
