package com.gitee.whzzone.pojo.query.system;

import com.gitee.whzzone.common.base.pojo.quey.EntityQuery;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author :whz
 * @date : 2022/12/18 14:32
 */
@Data
public class UserQuery extends EntityQuery {

    @ApiModelProperty("姓名")
    private String nickname;

    @ApiModelProperty("账号")
    private String username;

    @ApiModelProperty("手机")
    private String phone;

    @ApiModelProperty("部门id")
    private Long deptId;

}