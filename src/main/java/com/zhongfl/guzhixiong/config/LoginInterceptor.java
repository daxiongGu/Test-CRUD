package com.zhongfl.guzhixiong.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 用户登录拦截器
 */
@Component
@Slf4j
public class LoginInterceptor implements HandlerInterceptor {


    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        //获取session
        HttpSession session = httpServletRequest.getSession(true);
        httpServletRequest.getHeader("Authorization");
        //判断用户ID是否存在，不存在就跳转到登录页面
        if (session.getAttribute("loginUser") == null){
            log.info("未登录，跳转到登录页面...");
            httpServletResponse.sendRedirect("/sign");
            return false;
        }
        httpServletResponse.setHeader("Pragma", "no-cache");
        httpServletResponse.setDateHeader("Expires", -1L);
        httpServletResponse.addHeader("Cache-Control", "no-cache");
        httpServletResponse.addHeader("Cache-Control", "no-store");
        httpServletResponse.addHeader("Cache-Control", "must-revalidate");
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
