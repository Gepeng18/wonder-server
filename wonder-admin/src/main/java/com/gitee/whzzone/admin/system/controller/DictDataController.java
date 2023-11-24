package com.gitee.whzzone.admin.system.controller;

import com.gitee.whzzone.common.base.controller.EntityController;
import com.gitee.whzzone.admin.system.entity.DictData;
import com.gitee.whzzone.admin.system.pojo.other.DictData.DictDataDto;
import com.gitee.whzzone.admin.system.pojo.other.DictData.DictDataQuery;
import com.gitee.whzzone.admin.system.service.DictDataService;
import com.gitee.whzzone.common.annotation.RequestLogger;
import com.gitee.whzzone.web.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
* 系统字典数据 控制器
* @author Create by generator at 2023/8/8
*/
@Api(tags = "系统字典数据")
@RestController
@RequestMapping("/dictData")
public class DictDataController extends EntityController<DictData, DictDataService, DictDataDto, DictDataQuery> {

    @Autowired
    private DictDataService dictDataService;

    @RequestLogger
    @ApiOperation("根据dictCode查询字典数据")
    @GetMapping("/dictCode/{dictCode}")
    public Result<List<DictDataDto>> findByDictCode(@PathVariable String dictCode) {
        return Result.ok(dictDataService.findByDictCode(dictCode));
    }

}