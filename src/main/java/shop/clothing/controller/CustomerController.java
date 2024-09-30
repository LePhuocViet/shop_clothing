package shop.clothing.controller;

import org.apache.catalina.util.Introspection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import shop.clothing.dto.request.CustomerRequest;
import shop.clothing.dto.request.IntrospectionRequest;
import shop.clothing.dto.request.OrderUpdateRequest;
import shop.clothing.dto.response.CustomerResponse;
import shop.clothing.enity.Customer;
import shop.clothing.exception.ApiResponse;
import shop.clothing.service.CustomerService;

import java.text.ParseException;

@RestController
@RequestMapping("/customers")
public class CustomerController {
    @Autowired
    CustomerService customerService;

    @PostMapping
    public ApiResponse<Boolean> createAccount(@RequestBody CustomerRequest customerRequest) throws ParseException {
        return ApiResponse.<Boolean>builder()
                .code(1000)
                .result(customerService.createCustomer(customerRequest))
                .build();

    }
    @PutMapping
    public ApiResponse<Boolean> UpdateAccount(@RequestBody CustomerRequest customerRequest) throws ParseException {
        return ApiResponse.<Boolean>builder()
                .code(1000)
                .result(customerService.updateCustomer(customerRequest))
                .build();

    }

    @GetMapping("/my-infor")
    public ApiResponse<CustomerResponse> getMyInfor(@RequestBody IntrospectionRequest introspectionRequest) throws ParseException {
        return ApiResponse.<CustomerResponse>builder()
                .code(1000)
                .result(customerService.getMyinfor(introspectionRequest))
                .build();

    }
}
