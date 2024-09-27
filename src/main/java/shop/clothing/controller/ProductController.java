package shop.clothing.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import shop.clothing.dto.request.ProductRequest;
import shop.clothing.dto.request.ProductPageRequest;
import shop.clothing.dto.response.ProductItemResponse;
import shop.clothing.dto.response.ProductPageResponse;
import shop.clothing.exception.ApiResponse;
import shop.clothing.service.ProductService;

import java.io.IOException;
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

    @PostMapping
    ApiResponse<ProductPageResponse> createProduct(@ModelAttribute ProductRequest productRequest) throws IOException {
        return ApiResponse.<ProductPageResponse>builder()
                .code(1000)
                .result(productService.createProduct(productRequest))
                .build();
    }
    @GetMapping("/{id}")
    ApiResponse<ProductItemResponse> getProductById(@PathVariable("id") String id ){
        return ApiResponse.<ProductItemResponse>builder()
                .code(1000)
                .result(productService.findProductById(id))
                .build();
    }
    @PutMapping
    ApiResponse<ProductPageResponse> updateProduct(@ModelAttribute ProductRequest productRequest) throws IOException {
        return ApiResponse.<ProductPageResponse>builder()
                .code(1000)
                .result(productService.updateProduct(productRequest))
                .build();
    }

    @DeleteMapping("/{id}")
    ApiResponse<Boolean> deletedProductById(@PathVariable("id") String id) throws IOException {
        return ApiResponse.<Boolean>builder()
                .code(1000)
                .result(productService.deletedProduct(id))
                .build();
    }

}
