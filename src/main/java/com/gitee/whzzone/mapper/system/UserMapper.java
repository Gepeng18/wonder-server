package com.gitee.whzzone.mapper.system;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.gitee.whzzone.pojo.entity.system.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author : whz
 * @date : 2023/5/16 19:33
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {
}