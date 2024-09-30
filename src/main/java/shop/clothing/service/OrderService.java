package shop.clothing.service;

import shop.clothing.dto.request.OrderRequest;
import shop.clothing.dto.request.OrderUpdateRequest;
import shop.clothing.dto.response.OrderItemResponse;
import shop.clothing.dto.response.OrderResponse;
import shop.clothing.enity.Order;

import java.text.ParseException;
import java.util.List;

public interface OrderService {
    boolean createOrder(OrderRequest orderRequest) throws ParseException;

    List<OrderResponse> getAllOrder();

    boolean deletedOrder(OrderUpdateRequest orderUpdateRequest) throws ParseException;

    boolean updateOrder(OrderUpdateRequest orderUpdateRequest);


    List<OrderResponse> findOrderByCustomerId(OrderRequest orderRequest) throws ParseException;


    List<OrderItemResponse> findItemByOrder(String id);

}
