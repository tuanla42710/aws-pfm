package org.example.repository;

import org.example.model.StatisticOverview;
import org.example.utils.QueryFormater;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.util.Arrays;
import java.util.List;

@Repository
public class StatisticOverviewRepository {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public List<StatisticOverview> calculateStatisticOverview(String customerId, String fromDate, String endDate, String period){
        String query = """
                select customer_id, category, sum(amount) amount from pfm.customer_transaction_t_1\s
                where customer_id = ? and trans_date >= ?\s
                and trans_date <= ? group by customer_id, category""";


        Object[] params = {
                customerId,
                fromDate,
                endDate
        };

        return jdbcTemplate.query(
                query,
                params,
                (ResultSet rs, int rowNum) ->
                        new StatisticOverview(
                                rs.getString("customer_id"),
                                rs.getString("category"),
                                rs.getBigDecimal("amount")
                        )
        );

    }
}
