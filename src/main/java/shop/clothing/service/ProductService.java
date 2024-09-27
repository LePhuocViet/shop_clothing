package shop.clothing.service;

import shop.clothing.dto.request.ProductRequest;
import shop.clothing.dto.request.ProductPageRequest;
import shop.clothing.dto.response.ProductItemResponse;
import shop.clothing.dto.response.ProductPageResponse;

import java.io.IOException;
import java.util.List;

public interface ProductService {
    List<ProductPageResponse> findAllProduct(ProductPageRequest productPageRequest);

    ProductPageResponse createProduct(ProductRequest productRequest) throws IOException;

    ProductItemResponse findProductById(String id);

    ProductPageResponse updateProduct(ProductRequest productRequest) throws IOException;

    boolean deletedProduct(String id);

}
