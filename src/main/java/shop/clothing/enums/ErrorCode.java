package shop.clothing.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum ErrorCode {
    //400 Error Input
    STYLE_NOT_FOUND(400,"Style not found"),
    CATEGORY_NOT_FOUND(400,"Category not found"),
    COLOR_NOT_FOUND(400,"Color not found"),
    SIZE_NOT_FOUND(400,"Size not found"),
    COLOR_IS_EXISTS(400,"Color is exists"),
    SIZE_IS_EXISTS(400,"Size is exists"),
    CATEGORY_IS_EXISTS(400,"Category is exists"),
    STYLE_IS_EXISTS(400,"Style is exists"),
    PRODUCT_HAS_COLOR(400,"Product has this color please change before deleted"),
    PRODUCT_HAS_SIZE(400,"Product has this size please change before deleted"),
    USERNAME_NOT_FOUND(400,"Username not found"),
    PASSWORD_NOT_RIGHT(400,"Password not right"),
    WRONG_CART_CUSTOMER(400,"Wrong cart for customer"),
    USERNAME_IS_EXISTS(400,"Username is exists"),
    PASSWORD_NOT_MATCH(400,"Password not match"),
    EMAIL_IS_EXISTS(400,"Email is exists"),
    ACCOUNT_NOT_FOUND(400,"Account not found"),

    //401 Unauthorized
    UNAUTHORIZED(400,"Unauthorized"),
    //403 Forbidden
    //404 Not Found
    PRODUCT_NOT_FOUND(404,"Product not found"),
    CART_NOT_FOUND(404,"Cart not found"),
    ORDER_NOT_FOUND(404,"Order not found")

    ;


    private int code;
    private String message;


}
