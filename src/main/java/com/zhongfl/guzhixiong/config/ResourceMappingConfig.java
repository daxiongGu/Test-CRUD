package com.zhongfl.guzhixiong.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import javax.annotation.Resource;

@Configuration
public class ResourceMappingConfig extends WebMvcConfigurerAdapter {

    @Resource
    LoginInterceptor loginInterceptor;

    /**
     * 本地图片展示地址映射配置
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/image/**").addResourceLocations("file:/D:/images/item/");
        super.addResourceHandlers(registry);
    }

    /**
     * 登录拦截器注册
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(loginInterceptor)
                .addPathPatterns("/")
                .addPathPatterns("/index")
                .addPathPatterns("/itemList")
                .addPathPatterns("/itemCat");
        super.addInterceptors(registry);
    }
}
