package com.example.securitytest.controller;

import com.example.securitytest.pojo.dto.DeptDto;
import com.example.securitytest.pojo.entity.Dept;
import com.example.securitytest.pojo.query.DeptQuery;
import com.example.securitytest.service.DeptService;
import com.gitee.whzzone.web.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author Create by whz at 2023/7/8
 */

@Api(tags = "部门相关")
@RestController
@RequestMapping("dept")
public class DeptController extends EntityController<Dept, DeptService, DeptDto> {

    @Autowired
    private DeptService deptService;

    @ApiOperation("列表")
    @PostMapping("list")
    public Result<List<DeptDto>> list(@RequestBody DeptQuery query) {
        return Result.ok(deptService.list(query));
    }

    @ApiOperation("树")
    @PostMapping("tree")
    public Result<List<DeptDto>> tree(@RequestBody DeptQuery query) {
        return Result.ok(deptService.tree(query));
    }

    @ApiOperation("改变启用状态")
    @GetMapping("/enabledSwitch/{id}")
    public Result enabledSwitch(@PathVariable Long id) {
        deptService.enabledSwitch(id);
        return Result.ok();
    }

}
