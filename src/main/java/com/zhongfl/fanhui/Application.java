package com.zhongfl.fanhui;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * BI系统启动点
 * @author 木叶丸
 */
@SpringBootApplication
@EnableScheduling
@EnableTransactionManagement
@MapperScan({"com.zhongfl.boss.bi.mapper.**"})
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class);
    }

}
