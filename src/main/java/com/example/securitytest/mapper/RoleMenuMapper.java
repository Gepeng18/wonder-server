package com.example.securitytest.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.securitytest.pojo.entity.RoleMenu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author : whz
 * @date : 2022/11/30 10:16
 */
@Mapper
public interface RoleMenuMapper extends BaseMapper<RoleMenu> {
    void insertBatch(List<RoleMenu> list);
}