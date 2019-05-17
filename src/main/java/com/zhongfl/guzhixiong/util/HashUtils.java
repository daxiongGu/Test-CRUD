package com.zhongfl.guzhixiong.util;

import com.google.common.hash.HashCode;
import com.google.common.hash.HashFunction;
import com.google.common.hash.Hashing;

import java.nio.charset.Charset;

/**
 * 给密码加密的工具类
 */
public class HashUtils {
    private static final HashFunction FUNCTION = Hashing.md5();

    //根据业务加盐
    private static final String SALT = "com.zhongfl.guzhixiong";

    //加盐加密的作用：如果直接使用Md5加密，密码过于简单时很容易被暴力破解
    public static String encryPassword(String password){
        HashCode hashCode = FUNCTION.hashString(password+SALT, Charset.forName("UTF-8"));
        return hashCode.toString();
    }
}
