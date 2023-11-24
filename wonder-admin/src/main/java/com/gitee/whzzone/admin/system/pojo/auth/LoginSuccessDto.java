package com.gitee.whzzone.admin.system.pojo.auth;

import com.gitee.whzzone.admin.system.pojo.dto.UserDto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author : whz
 * @date : 2023/5/18 10:56
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginSuccessDto {

    private String token;

    private Long expire;

    private UserDto userinfo;

}