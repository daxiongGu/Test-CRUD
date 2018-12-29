package com.zhongfl.guzhixiong.bean.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.time.Instant;
import java.util.List;

/**
 * 图片上传工具类
 */
public class ImageUpload {

    public static String getImgPath(MultipartFile file, String filePath){

            File newFile = null;
            String path = "";
            if(!file.isEmpty()){
                try {
                    String orPath = Instant.now().getEpochSecond()+"/"+ file.getOriginalFilename();
                    //文件所在路径+ 以秒为单位时间戳 +文件原始名
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
