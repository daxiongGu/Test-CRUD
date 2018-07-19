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
        return "index";
    }

    @GetMapping("/index")
    public String index(){
        return "index";
    }

    @GetMapping("/error_404")
    public String notFoundError(){
        return "404";
    }

    @GetMapping("/error_500")
    public String serverError(){
        return "500";
    }

    @GetMapping("/error_403")
    public String forbiddenError(){
        return "403";
    }

}
