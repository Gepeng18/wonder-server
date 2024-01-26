package com.gitee.whzzone.admin.common.mybatis.strategy;

import com.gitee.whzzone.admin.system.pojo.dto.RuleDTO;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.StringValue;
import net.sf.jsqlparser.expression.operators.relational.EqualsTo;
import net.sf.jsqlparser.schema.Column;
import org.springframework.stereotype.Service;

/**
 * @author Create by whz at 2023/8/18
 */
@Service("EQ")
public class EqStrategyImpl implements ExpressStrategy{

    @Override
    public Expression apply(RuleDTO rule, Expression where) {
        Column column = getColumn(rule);
        Object value = getValue(rule);
        StringValue valueExpression = new StringValue((String) value);
        EqualsTo equalsTo = new EqualsTo(column, valueExpression);
        return assemble(rule.getSpliceType(), where, equalsTo);
    }
}
