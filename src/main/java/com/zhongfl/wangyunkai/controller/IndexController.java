package com.zhongfl.wangyunkai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.sql.SQLOutput;


/**
 * 首页路由
 * @author fengqiang
 */
@Controller
public class IndexController {
    @GetMapping("/index")
    public String index(){
        return "user/list";
    }

    @GetMapping("/exampleForVue")
    public String exampleForVue(){
        return "exampleForVue";
    }
}
