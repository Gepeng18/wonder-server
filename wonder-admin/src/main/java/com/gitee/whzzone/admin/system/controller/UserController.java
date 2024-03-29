package com.gitee.whzzone.admin.system.controller;

import com.gitee.whzzone.admin.system.entity.User;
import com.gitee.whzzone.admin.system.pojo.dto.ResetPWDDTO;
import com.gitee.whzzone.admin.system.pojo.dto.UserDTO;
import com.gitee.whzzone.admin.system.pojo.query.UserQuery;
import com.gitee.whzzone.admin.system.service.UserService;
import com.gitee.whzzone.web.controller.EntityController;
import com.gitee.whzzone.web.pojo.other.PageData;
import com.gitee.whzzone.web.pojo.other.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * @author : whz
 * @date : 2023/5/16 19:34
 */

@Api(tags = "用户相关")
@RestController
@RequestMapping("user")
public class UserController extends EntityController<User, UserService, UserDTO, UserQuery> {

    @Autowired
    private UserService userService;

    @ApiOperation("分页")
    @GetMapping("page")
    public Result<PageData<UserDTO>> page(UserQuery query){
        return Result.ok(userService.page(query));
    }

    @ApiOperation("改变启用状态")
    @PutMapping("/enabledSwitch/{id}")
    public Result enabledSwitch(@PathVariable Integer id) {
        userService.enabledSwitch(id);
        return Result.ok();
    }

    @ApiOperation("重置密码")
    @PutMapping("resetPWD")
    public Result resetPWD(@Validated @RequestBody ResetPWDDTO dto){
        userService.resetPWD(dto);
        return Result.ok();
    }

}
