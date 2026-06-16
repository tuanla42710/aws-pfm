package org.example.payload.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public class BaseRequest {

    String requestId;
    String customerId;
    String fromDate;
    String endDate;
    String period;

}
