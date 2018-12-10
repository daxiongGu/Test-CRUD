package com.zhongfl.wangyunkai;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author 木叶丸
 */
@SpringBootApplication
@EnableTransactionManagement
@MapperScan({"com.zhongfl.wangyunkai.mapper.**"})
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class);
    }

}
