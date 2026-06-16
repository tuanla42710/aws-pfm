package org.example.utils;

import java.util.List;

public class QueryFormater {

    public static String format(String query, List<?> params) {
        if (query == null) {
            throw new IllegalArgumentException("Query cannot be null");
        }

        String result = query;

        for (Object param : params) {
            String value;

            if (param == null) {
                value = "NULL";
            } else if (param instanceof Number || param instanceof Boolean) {
                value = param.toString();
            } else {
                value = "'" + param.toString().replace("'", "''") + "'";
            }

            result = result.replaceFirst("\\?", value);
        }

        return result;
    }
}
