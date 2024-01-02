package com.gitee.whzzone.admin.system.pojo.dto;

import com.gitee.whzzone.web.pojo.dto.EntityDto;
import lombok.Data;

/**
 * @author : whz
 * @date : 2023/5/23 10:03
 */
@Data
public class RoleMenuDto extends EntityDto {

    private Integer roleId;

    private Integer menuId;

}