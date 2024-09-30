package shop.clothing.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import shop.clothing.dto.request.AttributeRequest;
import shop.clothing.enity.Color;
import shop.clothing.enity.Size;
import shop.clothing.exception.ApiResponse;
import shop.clothing.service.SizeService;

import java.util.List;

@RestController
@RequestMapping("/sizes")
public class SizeController {
    @Autowired
    SizeService sizeService;

    @GetMapping
    ApiResponse<List<Size>> getAllSize(){
        return ApiResponse.<List<Size>>builder()
                .code(1000)
                .result(sizeService.getAllSize())
                .build();
    }

    @PostMapping
    ApiResponse<Boolean> createSize(@RequestBody AttributeRequest attributeRequest){
        return ApiResponse.<Boolean>builder()
                .code(1000)
                .result(sizeService.createSize(attributeRequest))
                .build();
    }

    @DeleteMapping
    ApiResponse<Boolean> deletedSize(@RequestBody AttributeRequest attributeRequest){
        return ApiResponse.<Boolean>builder()
                .code(1000)
                .result(sizeService.deletedSize(attributeRequest))
                .build();
    }

}
