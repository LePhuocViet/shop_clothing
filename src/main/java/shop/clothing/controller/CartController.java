package shop.clothing.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import shop.clothing.dto.request.AuthenticationRequest;
import shop.clothing.dto.request.CartRequest;
import shop.clothing.dto.request.CartUpdateRequest;
import shop.clothing.dto.request.IntrospectionRequest;
import shop.clothing.dto.response.AuthenticationResponse;
import shop.clothing.dto.response.CartConfirmResponse;
import shop.clothing.dto.response.CartResponse;
import shop.clothing.exception.ApiResponse;
import shop.clothing.service.AuthService;
import shop.clothing.service.CartService;

import java.text.ParseException;
import java.util.List;

@RestController
@RequestMapping("/carts")
public class CartController {
    @Autowired
    CartService cartService;


    @PostMapping
    public ApiResponse<CartConfirmResponse> createCart(@RequestBody CartRequest cartRequest) throws ParseException {
        return ApiResponse.<CartConfirmResponse>builder()
                .code(1000)
                .result(cartService.createCart(cartRequest))
                .build();

    }

    @GetMapping
    public ApiResponse<List<CartResponse>> getCarts(@RequestBody IntrospectionRequest introspectionRequest) throws ParseException {
        return ApiResponse.<List<CartResponse>>builder()
                .code(1000)
                .result(cartService.getAllCartByCustomer(introspectionRequest))
                .build();

    }

    @PutMapping
    public ApiResponse<CartConfirmResponse> updateCart(@RequestBody CartUpdateRequest cartUpdateRequest) throws ParseException {
        return ApiResponse.<CartConfirmResponse>builder()
                .code(1000)
                .result(cartService.updateCart(cartUpdateRequest))
                .build();

    }

    @DeleteMapping
    public ApiResponse<Boolean> deletedCart(@RequestBody CartUpdateRequest cartUpdateRequest) throws ParseException {
        return ApiResponse.<Boolean>builder()
                .code(1000)
                .result(cartService.deletedCart(cartUpdateRequest))
                .build();

    }

}
