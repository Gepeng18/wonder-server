package com.example.securitytest.pojo.dto;

import com.example.securitytest.common.LongSerializer;
import com.example.securitytest.common.validation.group.CreateGroup;
import com.example.securitytest.common.validation.group.UpdateGroup;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;

/**
 * @author Create by whz at 2023/7/8
 */

@Data
public class DeptDto extends BaseDto<DeptDto> {

    @NotNull(message = "id不能为空", groups = {UpdateGroup.class})
    @JsonSerialize(using = LongSerializer.class)
    @ApiModelProperty("id")
    private Long id;

    @NotNull(message = "父级id不能为空", groups = {CreateGroup.class, UpdateGroup.class})
    @JsonSerialize(using = LongSerializer.class)
    @ApiModelProperty("父级id")
    private Long parentId;

    @ApiModelProperty("父级名称")
    private String parentName;

    @NotBlank(message = "名称不能为空", groups = {CreateGroup.class, UpdateGroup.class})
    @ApiModelProperty("名称")
    private String name;

    @NotNull(message = "是否启用不能为空", groups = {CreateGroup.class, UpdateGroup.class})
    @ApiModelProperty("是否启用")
    private Boolean enabled;

    @ApiModelProperty("父级id")
    private Integer sort;

    @ApiModelProperty("存在下级部门")
    private Boolean hasChildren;

    @ApiModelProperty("下级部门")
    private List<DeptDto> children;

    @ApiModelProperty("更新时间")
    private Date updateTime;

}
