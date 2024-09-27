package shop.clothing.service;

import shop.clothing.dto.request.ProductPageRequest;
import shop.clothing.dto.response.ProductPageResponse;
import shop.clothing.enity.Product;

import java.util.List;

public interface ProductService {
    List<ProductPageResponse> findAllProduct(ProductPageRequest productPageRequest);

}
