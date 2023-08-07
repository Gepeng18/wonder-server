package com.gitee.whzzone.common.annotation;

import java.lang.annotation.*;

/**
 * @author Create by whz at 2023/8/7
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface RequestLogger {

    /**
     * 接口描述，为空取@ApiOperation的值，如果@ApiOperation存在的话
     */
    String value() default "";

}
