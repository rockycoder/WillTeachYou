package com.app.persistance;

import java.util.List;

import org.springframework.util.StringUtils;


public class PersistanceUtils {

    public static String createQuery(String className, List<Filter> filters, List<Object> values) {
        int count = 0;
        StringBuilder query = new StringBuilder();
        query.append("from " + className);

        if (filters != null && values != null) {
            if (filters.size() != values.size()) {
                return "size mismatch";
            } else {
                for (Filter filter : filters) {

                    if (null != filter && !StringUtils.isEmpty(filter.getFilterValue())) {
                        if (count == 0) {
                            query.append(" where ");
                        }
                        if (count > 0) {
                            query.append(" and ");
                        }

                        query.append(filter.getFilterValue() + "=:value" + count);

                    }

                    count++;

                }

            }

        }

        return query.toString();
    }
}