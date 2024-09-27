package shop.clothing.exception;

import shop.clothing.enums.ErrorCode;

public class WebException extends RuntimeException{
    private ErrorCode errorCode;

    public WebException(ErrorCode errorCode) {
        this.errorCode = errorCode;
    }

    public ErrorCode getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(ErrorCode errorCode) {
        this.errorCode = errorCode;
    }
}
