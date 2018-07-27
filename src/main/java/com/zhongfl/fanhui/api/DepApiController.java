package com.zhongfl.fanhui.api;

import com.zhongfl.fanhui.bean.Department;
import com.zhongfl.fanhui.bean.result.ResponseResult;
import com.zhongfl.fanhui.service.DepService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("api/dep")
public class DepApiController {

    @Resource
    private DepService depService;

    @PostMapping("/list")
    public ResponseResult list(@RequestBody Department department){
        List<Department> list = depService.list(department);
        return new ResponseResult<>(list);
    }

    @PostMapping("/update")
    public ResponseResult update(@RequestBody Department department){
        depService.update(department);
        return new ResponseResult();
    }

    @GetMapping("/delete")
    public ResponseResult delete(@Valid Integer oldId, @Valid Integer newId){
        depService.delete(oldId,newId);
        return new ResponseResult();
    }

    @PostMapping("/insert")
    public ResponseResult insert(@RequestBody Department department){
        depService.insert(department);
        return new ResponseResult();
    }
}
