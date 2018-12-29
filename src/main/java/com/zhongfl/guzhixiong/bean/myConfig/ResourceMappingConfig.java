package com.zhongfl.guzhixiong.bean.myConfig;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class ResourceMappingConfig extends WebMvcConfigurerAdapter {

    /**
     * 本地图片展示地址映射的配置
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/image/**").addResourceLocations("file:/D:/images/item/");
        super.addResourceHandlers(registry);
    }
}
