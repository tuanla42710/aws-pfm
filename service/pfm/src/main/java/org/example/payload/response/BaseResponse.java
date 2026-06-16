package org.example.payload.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;


@AllArgsConstructor
@NoArgsConstructor
@Getter
public class BaseResponse <T> {
    private String requestId;
    private int errorCode;
    private String message;
    private List<T> data;
}
