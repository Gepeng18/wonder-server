package com.gitee.whzzone.service;

import com.gitee.whzzone.common.base.service.EntityService;
import com.gitee.whzzone.pojo.dto.DataScopeDto;
import com.gitee.whzzone.pojo.entity.DataScope;

/**
 * @author Create by whz at 2023/7/13
 */
public interface DataScopeService extends EntityService<DataScope, DataScopeDto> {

    DataScope findByName(String name);

}