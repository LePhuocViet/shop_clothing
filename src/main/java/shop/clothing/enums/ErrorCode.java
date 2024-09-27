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

    //401 Unauthorized
    //403 Forbidden
    //404 Not Found
    PRODUCT_NOT_FOUND(404,"Product not found")
    ;


    private int code;
    private String message;


}
