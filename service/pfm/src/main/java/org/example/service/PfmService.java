package org.example.service;


import org.example.model.StatisticOverview;
import org.example.repository.StatisticOverviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PfmService {

    @Autowired
    StatisticOverviewRepository repository;

    public List<StatisticOverview> statisticOverviewService(String customerId, String fromDate, String endDate ){

        return repository.calculateStatisticOverview(customerId, fromDate,endDate, "M");

    }
}
