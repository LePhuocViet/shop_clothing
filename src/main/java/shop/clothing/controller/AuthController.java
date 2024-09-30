package shop.clothing.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import shop.clothing.dto.request.AuthenticationRequest;
import shop.clothing.dto.request.IntrospectionRequest;
import shop.clothing.dto.response.AuthenticationResponse;
import shop.clothing.exception.ApiResponse;
import shop.clothing.service.AuthService;

@RestController
@RequestMapping("/auth")
public class AuthController {
    @Autowired
    AuthService authService;

    @PostMapping("/login")
    ApiResponse<AuthenticationResponse> login(@RequestBody AuthenticationRequest authenticationRequest){
        return ApiResponse.<AuthenticationResponse>builder()
                .code(1000)
                .result(authService.authentication(authenticationRequest))
                .build();
    }
    @PostMapping("/introspect")
    ApiResponse<Boolean> login(@RequestBody IntrospectionRequest introspectionRequest){
        return ApiResponse.<Boolean>builder()
                .code(1000)
                .result(authService.Introspection(introspectionRequest))
                .build();
    }


}
