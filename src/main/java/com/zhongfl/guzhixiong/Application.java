package com.zhongfl.guzhixiong;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author guzhixiong
 */
@SpringBootApplication
@EnableTransactionManagement
@MapperScan({"com.zhongfl.guzhixiong.mapper.**"})
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class);
    }

}
