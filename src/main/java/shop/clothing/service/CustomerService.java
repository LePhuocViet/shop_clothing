package shop.clothing.service;

import shop.clothing.dto.request.CustomerRequest;
import shop.clothing.dto.request.IntrospectionRequest;
import shop.clothing.dto.response.CustomerResponse;
import shop.clothing.enity.Customer;

import java.text.ParseException;

public interface CustomerService {

    boolean createCustomer(CustomerRequest customerRequest);

    boolean updateCustomer(CustomerRequest customerRequest);

    CustomerResponse getMyinfor(IntrospectionRequest introspectionRequest) throws ParseException;
}
