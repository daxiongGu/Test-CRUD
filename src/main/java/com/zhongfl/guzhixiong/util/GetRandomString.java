package com.zhongfl.guzhixiong.util;

import java.util.Random;

/**
 * 随机生成指定长度的字符串的工具类
 */
public class GetRandomString {

    public static String getString(int length){
        String str="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        Random random=new Random();
        StringBuffer sb=new StringBuffer();
        for(int i=0;i<length;i++){
            int number=random.nextInt(62);
            sb.append(str.charAt(number));
        }
        return sb.toString();
    }
}
