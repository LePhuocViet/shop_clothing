package shop.clothing.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import shop.clothing.dto.request.OrderRequest;
import shop.clothing.dto.request.OrderUpdateRequest;
import shop.clothing.dto.response.OrderItemResponse;
import shop.clothing.dto.response.OrderResponse;
import shop.clothing.enity.Cart;
import shop.clothing.enity.Order;
import shop.clothing.exception.ApiResponse;
import shop.clothing.service.OrderService;

import java.text.ParseException;
import java.util.List;

@RestController
@RequestMapping("/orders")
public class OrderController {
    @Autowired
    OrderService orderService;

    @PostMapping
    public ApiResponse<Boolean> createOrder(@RequestBody OrderRequest orderRequest) throws ParseException {
        return ApiResponse.<Boolean>builder()
                .code(1000)
                .result(orderService.createOrder(orderRequest))
                .build();

    }

    @GetMapping
    public ApiResponse<List<OrderResponse>> getAllOrder( ) throws ParseException {
        return ApiResponse.<List<OrderResponse>>builder()
                .code(1000)
                .result(orderService.getAllOrder())
                .build();

    }
    @PutMapping
    public ApiResponse<Boolean> updateOrder(@RequestBody OrderUpdateRequest orderUpdateRequest) throws ParseException {
        return ApiResponse.<Boolean>builder()
                .code(1000)
                .result(orderService.updateOrder(orderUpdateRequest))
                .build();

    }
    @DeleteMapping
    public ApiResponse<Boolean> deletedOrder(@RequestBody OrderUpdateRequest orderUpdateRequest) throws ParseException {
        return ApiResponse.<Boolean>builder()
                .code(1000)
                .result(orderService.deletedOrder(orderUpdateRequest))
                .build();

    }

    @GetMapping("/my-order")
    public ApiResponse<List<OrderResponse>> getOrderByUser(@RequestBody OrderRequest orderRequest) throws ParseException {
        return ApiResponse.<List<OrderResponse>>builder()
                .code(1000)
                .result(orderService.findOrderByCustomerId(orderRequest))
                .build();

    }

    @GetMapping("/{id}")
    public ApiResponse<List<OrderItemResponse>> getOrderItem(@PathVariable("id") String id) throws ParseException {
        return ApiResponse.<List<OrderItemResponse>>builder()
                .code(1000)
                .result(orderService.findItemByOrder(id))
                .build();

    }

}
