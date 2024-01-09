package com.gitee.whzzone.admin.common.mybatis.strategy;

import com.gitee.whzzone.admin.system.pojo.dto.RuleDto;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.StringValue;
import net.sf.jsqlparser.expression.operators.conditional.AndExpression;
import net.sf.jsqlparser.expression.operators.conditional.OrExpression;
import net.sf.jsqlparser.expression.operators.relational.MinorThanEquals;
import net.sf.jsqlparser.schema.Column;
import org.springframework.stereotype.Service;

/**
 * @author Create by whz at 2023/8/18
 */
@Service("LE")
public class LeStrategyImpl implements ExpressStrategy{

    @Override
    public Expression apply(RuleDto rule, Expression where) {
        boolean or = isOr(rule.getSpliceType());
        Column column = getColumn(rule);
        Object value = getValue(rule);
        StringValue valueExpression = new StringValue((String) value);
        MinorThanEquals minorThanEquals = new MinorThanEquals();
        minorThanEquals.setLeftExpression(column);
        minorThanEquals.setRightExpression(valueExpression);
        if (or) {
            where = where == null ? minorThanEquals : new OrExpression(where, minorThanEquals);
        } else {
            where = where == null ? minorThanEquals : new AndExpression(where, minorThanEquals);
        }
        return where;
    }
}
