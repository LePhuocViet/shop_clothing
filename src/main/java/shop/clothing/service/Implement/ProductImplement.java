package shop.clothing.service.Implement;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import shop.clothing.dto.request.ProductPageRequest;
import shop.clothing.dto.response.ProductPageResponse;
import shop.clothing.enity.Product;
import shop.clothing.repository.ProductRepository;
import shop.clothing.service.ProductService;

import java.util.List;

@Service
@AllArgsConstructor
public class ProductImplement implements ProductService {
    ProductRepository productRepository;

    @Override
    public List<ProductPageResponse> findAllProduct(ProductPageRequest productPageRequest) {
        return productRepository.findProductByProductPageRequest(
                productPageRequest.getCategory(),
                productPageRequest.getStyle(),
                productPageRequest.getColor(),
                productPageRequest.getSize(),
                productPageRequest.getPricemin(),
                productPageRequest.getPricemax());
    }
}
