package shop.clothing.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import shop.clothing.dto.request.AttributeRequest;
import shop.clothing.enity.Color;
import shop.clothing.exception.ApiResponse;
import shop.clothing.service.ColorService;

import java.util.List;

@RestController
@RequestMapping("/colors")
public class ColorController {
    @Autowired
    ColorService colorService;
    @GetMapping
    ApiResponse<List<Color>> getAllColor(){
        return ApiResponse.<List<Color>>builder()
                .code(1000)
                .result(colorService.getAllColor())
                .build();
    }

    @PostMapping
    ApiResponse<Boolean> createColor(@RequestBody AttributeRequest attributeRequest){
        return ApiResponse.<Boolean>builder()
                .code(1000)
                .result(colorService.createColor(attributeRequest))
                .build();
    }

    @DeleteMapping
    ApiResponse<Boolean> deletedColor(@RequestBody AttributeRequest attributeRequest){
        return ApiResponse.<Boolean>builder()
                .code(1000)
                .result(colorService.deletedColor(attributeRequest))
                .build();
    }
}
