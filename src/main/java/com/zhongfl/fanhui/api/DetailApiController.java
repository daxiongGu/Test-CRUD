package com.zhongfl.fanhui.api;

import com.zhongfl.fanhui.bean.Detail;
import com.zhongfl.fanhui.bean.result.ResponseResult;
import com.zhongfl.fanhui.service.DetailService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("/api/detail")
public class DetailApiController {

    @Resource
    private DetailService detailService;

    @GetMapping("/select")
    public ResponseResult select(Integer id){
        Detail detail = detailService.select(id);
        return new ResponseResult<>(detail);
    }

    @PostMapping("/update")
    public ResponseResult update(@RequestBody Detail detail){
        detailService.update(detail);
        return new ResponseResult();
    }
}
