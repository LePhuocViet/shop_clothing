package shop.clothing.service;

import shop.clothing.dto.request.CartRequest;
import shop.clothing.dto.request.CartUpdateRequest;
import shop.clothing.dto.request.IntrospectionRequest;
import shop.clothing.dto.response.CartConfirmResponse;
import shop.clothing.dto.response.CartResponse;

import java.text.ParseException;
import java.util.List;

public interface CartService {
    CartConfirmResponse createCart(CartRequest cartRequest) throws ParseException;

    CartConfirmResponse updateCart(CartUpdateRequest cartUpdateRequest) throws ParseException;


    Boolean deletedCart(CartUpdateRequest cartUpdateRequest) throws ParseException;

    List<CartResponse> getAllCartByCustomer(IntrospectionRequest introspectionRequest) throws ParseException;
}
