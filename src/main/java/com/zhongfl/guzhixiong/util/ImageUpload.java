package com.zhongfl.guzhixiong.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.time.Instant;

/**
 * 图片上传工具类
 */
public class ImageUpload {

    /**
     * 文件上传
     * @param file 上传的图片
     * @param filePath 上传的父路径
     * @return  图片对应的查询地址
     */
    public static String getImgPath(MultipartFile file, String filePath){
            File newFile = null;
            String path = "";
            if(!file.isEmpty()){
                try {
                    String orPath = Instant.now().getEpochSecond()+"/"+ file.getOriginalFilename();
                    //上传位置：文件所在路径+ 以秒为单位时间戳 +文件原始名
                    newFile = new File(filePath + "/"+ orPath);
                    if(!newFile.exists()){
                        newFile.getParentFile().mkdirs();
                        newFile.createNewFile();
                    }
                    file.transferTo(newFile);
                    path = orPath;
                }catch (Exception e){
                    throw  new IllegalArgumentException(e);
                }
            }
            return path;
    }

}
