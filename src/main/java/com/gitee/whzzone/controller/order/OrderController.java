package com.gitee.whzzone.controller.order;

import com.gitee.whzzone.common.base.controller.EntityController;
import com.gitee.whzzone.pojo.dto.order.OrderDto;
import com.gitee.whzzone.pojo.entity.order.Order;
import com.gitee.whzzone.pojo.query.order.OrderQuery;
import com.gitee.whzzone.service.order.OrderService;
import com.gitee.whzzone.web.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author Create by whz at 2023/8/4
 */
@Api(tags = "订单相关")
@RestController("order")
public class OrderController extends EntityController<Order, OrderService, OrderDto> {

    @Autowired
    private OrderService orderService;

    @ApiOperation("列表")
    @PostMapping("list")
    public Result<List<OrderDto>> list(@RequestBody OrderQuery query){
        return Result.ok("操作成功", orderService.list(query));
    }
}
