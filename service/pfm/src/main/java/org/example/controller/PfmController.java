package org.example.controller;


import org.example.model.StatisticOverview;
import org.example.payload.request.BaseRequest;
import org.example.payload.response.BaseResponse;
import org.example.service.PfmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
@RequestMapping("/")
public class PfmController {

    @Autowired
    PfmService service;

    @PostMapping("/api/overview")
    public BaseResponse<StatisticOverview> getOverview(@RequestBody BaseRequest request){
        try {
            return new BaseResponse<>(
                    request.getRequestId(),
                    0,
                    "Success",
                    service.statisticOverviewService(
                            request.getCustomerId(),
                            request.getFromDate(),
                            request.getEndDate()
                    )
            );
        } catch (Exception e){
            return new BaseResponse<>(request.getCustomerId(),
                    1,
                    e.getMessage(),
                    new ArrayList<>()) ;
        }
    }

}
