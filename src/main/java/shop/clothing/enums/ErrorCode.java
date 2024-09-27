package shop.clothing.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum ErrorCode {
    //400 Error Input
    //401 Unauthorized
    //403 Forbidden
    //404 Not Found
    ;


    private int code;
    private String message;


}
