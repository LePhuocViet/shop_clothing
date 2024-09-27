package shop.clothing.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import shop.clothing.dto.request.ProductPageRequest;
import shop.clothing.dto.response.ProductPageResponse;
import shop.clothing.enity.Product;
import shop.clothing.exception.ApiResponse;
import shop.clothing.service.ProductService;

import java.util.List;

@RestController
@RequestMapping("/products")
public class ProductController {

    @Autowired
    ProductService productService;
    @GetMapping
    ApiResponse<List<ProductPageResponse>> getAllProduct(@RequestBody ProductPageRequest productPageRequest){
        return ApiResponse.<List<ProductPageResponse>>builder()
                .code(1000)
                .result(productService.findAllProduct(productPageRequest))
                .build();
    }

}
