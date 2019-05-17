package com.zhongfl.guzhixiong.api;

import com.zhongfl.guzhixiong.bean.result.ResponseResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author daxiong
 * @date 2019/3/20
 */
@RestController
@RequestMapping("/api/task/time")
public class TaskTimeController {

    @RequestMapping("/list/{orderNo}")
    public ResponseResult getTaskTimeListByOrder(@PathVariable("orderNo") String orderNo){

        return new ResponseResult();
    }

}
