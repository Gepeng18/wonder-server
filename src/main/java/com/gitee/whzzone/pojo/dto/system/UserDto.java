package com.gitee.whzzone.pojo.dto.system;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.gitee.whzzone.common.base.pojo.dto.EntityDto;
import com.gitee.whzzone.common.serializer.ListLongSerializer;
import com.gitee.whzzone.common.validation.group.CreateGroup;
import com.gitee.whzzone.common.validation.group.UpdateGroup;
import com.gitee.whzzone.pojo.entity.system.Dept;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.*;
import java.util.List;

@Data
public class UserDto extends EntityDto {

    @NotBlank(message = "username不能为空", groups = {CreateGroup.class, UpdateGroup.class})
    @Pattern(regexp = "^[a-zA-Z][a-zA-Z0-9]{7,15}$", message = "8-16位字母+数字组合，必须英文开始")
    private String username;

    @NotBlank(message = "phone不能为空", groups = {CreateGroup.class, UpdateGroup.class})
    @Pattern(regexp = "^[1-9]\\d{10}$", message = "手机号码格式有误")
    private String phone;

    @NotBlank(message = "nickname不能为空", groups = {CreateGroup.class, UpdateGroup.class})
    @Size(min = 1, max = 10, message = "昵称长度：1-10")
    private String nickname;

    @Email
    private String email;

    @JsonIgnore
    private String password;

    @JsonIgnore
    private String openId;

    @JsonIgnore
    private String unionId;

    private Boolean enabled;

    @NotEmpty(message = "部门ids不能为空", groups = {CreateGroup.class, UpdateGroup.class})
    @JsonSerialize(using = ListLongSerializer.class)
    @ApiModelProperty("部门id")
    private List<Long> deptIdList;

    @ApiModelProperty("部门List")
    private List<Dept> deptList;

    @NotEmpty(message = "角色ids不能为空", groups = {CreateGroup.class, UpdateGroup.class})
    @JsonSerialize(using = ListLongSerializer.class)
    @ApiModelProperty("角色ids")
    private List<Long> roleIdList;

}