package com.zhongfl.guzhixiong.service.impl;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.google.common.cache.RemovalListener;
import com.google.common.cache.RemovalNotification;
import com.zhongfl.guzhixiong.bean.model.User;
import com.zhongfl.guzhixiong.bean.result.ResponseResult;
import com.zhongfl.guzhixiong.mapper.UserMapper;
import com.zhongfl.guzhixiong.service.POIService;
import com.zhongfl.guzhixiong.service.UserService;
import com.zhongfl.guzhixiong.util.GetRandomString;
import com.zhongfl.guzhixiong.util.HashUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.concurrent.TimeUnit;

/**
 * 用户service层实现类
 */
@Service
@Slf4j
public class UserServiceImpl implements UserService {

    public static final String USER_ATTRIBUTE = "loginUser";

    @Resource
    private UserMapper userMapper;

    @Resource
    private JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String from;

    @Value("${emailContent.base.url}")
    private String baseUrl;

    @Resource
    private POIService poiService;

    //定义一个缓存对象
    private Cache<String,String> mailCache = CacheBuilder.newBuilder()
            .concurrencyLevel(10)  //设置并发级别
            .expireAfterWrite(5, TimeUnit.MINUTES)  //设置写缓存5分钟后过期
            .initialCapacity(20)  //设置缓存容器的初始容量
            .maximumSize(100)   //设置缓存最大容量
            .removalListener(new RemovalListener<String, String>() {    //缓存移除通知
                @Override
                public void onRemoval(RemovalNotification<String, String> notification) {
                    log.info("{} was removed, cause is {}",notification.getKey(),notification.getCause());
                }
            })
            .build();

    /**
     * 根据ID查询用户信息
     * @param id 用户ID
     * @return
     */
    @Override
    public User selectUserById(Integer id) {
        return userMapper.selectUserById(id);
    }

    /**
     * 插入用户信息
     * @param user 用户信息
     * @return
     */
    @Override
    @Transactional
    public boolean insertUser(User user) {
        //查询此邮箱是否已经注册
        User user2 = userMapper.selectUserByEmail(user.getEmail());
        //如果该邮箱没有被注册才能插入该用户信息
        if(user2 == null){
            //将密码进行md5加盐加密
            user.setPassword(HashUtils.encryPassword(user.getPassword()));
            //补全注册信息
            user.setCreateTime(new Date());
            user.setUpdateTime(new Date());
            user.setType(1);

            log.info("注册的用户信息为：{}",user);
            userMapper.insertUser(user);
            String content = "您好，"+user.getName()+"，您已成功注册到商品管理系统！";
            sendMail("注册成功",user.getEmail(),content);
            return true;
        }
        return false;
    }

    /**
     * 用户登录校验
     * @param user 登录用户信息
     * @return
     */
    @Override
    public ResponseResult userLogin(User user, HttpServletRequest request) {
        //根据邮箱查询用户信息
        User userLogin = userMapper.selectUserByEmail(user.getEmail());
        //只有当该用户存在并且密码正确才能登录成功
        if(null != userLogin){
            if(userLogin.getPassword().equals(HashUtils.encryPassword(user.getPassword()))){
                //登陆成功，保存用户ID
                request.getSession(true).setAttribute(USER_ATTRIBUTE,userLogin);
                return new ResponseResult();
            }
            return new ResponseResult(777777,"邮箱或密码输入有误");
        }
        return new ResponseResult(888888,"该邮箱尚未注册！");
    }

    /**
     * 发送邮件
     * @param title 邮件标题
     * @param email 邮件地址
     * @param content 邮件内容
     * @return
     */
    @Override
    public boolean sendMail(String title, String email, String content) {
        log.info("发送邮件 邮箱标题：{}，邮箱：{}，邮件内容：{}",title,email,content);
        SimpleMailMessage message = new SimpleMailMessage();
        message.setSubject(title);
        message.setFrom(from);
        message.setTo(email);
        message.setText(content);
        try {
            mailSender.send(message);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    /**
     * 邮箱找回密码
     * @param email 邮箱
     * @return
     */
    @Override
    public ResponseResult findPwd(String email){
        log.info("找回密码的邮箱为：{}",email);
        //查看此邮箱是否已经注册到该系统
        if(userMapper.selectUserByEmail(email) == null){
            return new ResponseResult(111111,"该邮箱尚未注册！");
        }
        //随机生成一个10位的字符串
        String randomKey = GetRandomString.getString(10);

        log.info("生成的随机密钥：{}",randomKey);

        //缓存该随机生成的Key和email
        mailCache.put(randomKey,email);
        String content =  "点击此链接重置密码："+baseUrl+"/user/resetPwdSubmit?key="+randomKey;
        boolean b = sendMail("密码重置",email,content);
        if (b) {
            return new ResponseResult(222222, "重置密码邮件已发送，请登录邮箱修改密码！");
        }
        return new ResponseResult(4444444,"邮件发送失败，请重试！");
    }

    /**
     * 密码重置链接的验证
     * @param key 验证码
     * @return
     */
    @Override
    public String resetPwdCheck(String key) {
        String email = mailCache.getIfPresent(key);
        if(email==null || "".equals(email)){
            return null;
        }
        //点击重置后清空该缓存
        mailCache.invalidate(key);
        return email;
    }

    /**
     * 重置用户密码
     * @param user 用户信息
     * @return
     */
    @Override
    @Transactional
    public boolean updatePwd(User user) {
        log.info("用户重置密码 用户邮箱：{}，新密码：{}",user.getEmail(),user.getPassword());
        //给密码加密
        user.setPassword(HashUtils.encryPassword(user.getPassword()));
        //设置修改时间
        user.setUpdateTime(new Date());
        userMapper.updateUserByEmail(user);
        //修改完密码，清空session，重新登录
        return true;
    }

    /**
     * 清除用户登录session
     */
    @Override
    public void clearLoginUser(HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        if (null != session.getAttribute(USER_ATTRIBUTE)) {
            log.info("清空用户缓存：{}", session.getAttribute(USER_ATTRIBUTE));
            session.removeAttribute(USER_ATTRIBUTE);
        }
    }

}
