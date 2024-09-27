package shop.clothing.service.Implement;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import shop.clothing.dto.request.ProductRequest;
import shop.clothing.dto.request.ProductPageRequest;
import shop.clothing.dto.response.ProductItemResponse;
import shop.clothing.dto.response.ProductPageResponse;
import shop.clothing.enity.*;
import shop.clothing.enums.ErrorCode;
import shop.clothing.exception.WebException;
import shop.clothing.repository.*;
import shop.clothing.service.ProductService;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
@AllArgsConstructor
public class ProductImplement implements ProductService {
    ProductRepository productRepository;

    StyleRepository styleRepository;

    ColorRepository colorRepository;

    SizeRepository sizeRepository;

    CategoryRepository categoryRepository;

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

    @Override
    public ProductPageResponse createProduct(ProductRequest productRequest) throws IOException {
        Style style = styleRepository.findStyleByName(productRequest.getStyle());
        Category category = categoryRepository.findCategoryByName(productRequest.getCategory());
        Color color = colorRepository.findColorByName(productRequest.getColor());
        Size size = sizeRepository.findSizeByName(productRequest.getSize());
        if (style == null ) throw new WebException(ErrorCode.STYLE_NOT_FOUND);
        if (category == null ) throw new WebException(ErrorCode.CATEGORY_NOT_FOUND);
        if (color == null ) throw new WebException(ErrorCode.COLOR_NOT_FOUND);
        if (size == null ) throw new WebException(ErrorCode.SIZE_NOT_FOUND);
        Set<Size> sizeSet = new HashSet<>();
        sizeSet.add(size);
        Set<Color> colorSet = new HashSet<>();
        colorSet.add(color);
        Product product = Product.builder()
                .name(productRequest.getName())
                .img(productRequest.getImg().getBytes())
                .description(productRequest.getDescription())
                .price(productRequest.getPrice())
                .style(style)
                .category(category)
                .colors(colorSet)
                .sizes(sizeSet)
                .build();

        productRepository.save(product);
        return ProductPageResponse.builder()
                .id(product.getId())
                .description(product.getDescription())
                .name(product.getName())
                .img(product.getImg())
                .price(product.getPrice())
                .build();
    }

    @Override
    public ProductItemResponse findProductById(String id) {
        ProductPageResponse productPageResponse = productRepository.findProductPageResponseById(id);
        if (productPageResponse == null) throw new WebException(ErrorCode.PRODUCT_NOT_FOUND);
        List<Color> colors = productRepository.findColorByIdProduct(id);
        List<Size> sizes = productRepository.findSizeByIdProduct(id);


        return ProductItemResponse.builder()
                .id(productPageResponse.getId())
                .rate(productPageResponse.getRate())
                .colors(colors)
                .description(productPageResponse.getDescription())
                .img(productPageResponse.getImg())
                .name(productPageResponse.getName())
                .price(productPageResponse.getPrice())
                .sizes(sizes)
                .build();
    }

    @Override
    public ProductPageResponse updateProduct(ProductRequest productRequest) throws IOException {
        Style style = styleRepository.findStyleByName(productRequest.getStyle());
        Category category = categoryRepository.findCategoryByName(productRequest.getCategory());
        Color color = colorRepository.findColorByName(productRequest.getColor());
        Size size = sizeRepository.findSizeByName(productRequest.getSize());
        if (style == null ) throw new WebException(ErrorCode.STYLE_NOT_FOUND);
        if (category == null ) throw new WebException(ErrorCode.CATEGORY_NOT_FOUND);
        if (color == null ) throw new WebException(ErrorCode.COLOR_NOT_FOUND);
        if (size == null ) throw new WebException(ErrorCode.SIZE_NOT_FOUND);
        Set<Size> sizeSet = new HashSet<>();
        sizeSet.add(size);
        Set<Color> colorSet = new HashSet<>();
        colorSet.add(color);
        Product product = productRepository.findProductById(productRequest.getId());
        if (product == null) throw new WebException(ErrorCode.PRODUCT_NOT_FOUND);
        product.setName(productRequest.getName());
        product.setImg(productRequest.getImg().getBytes());
        product.setDescription(productRequest.getDescription());
        product.setPrice(productRequest.getPrice());
        product.setStyle(style);
        product.setCategory(category);
        product.setColors(colorSet);
        product.setSizes(sizeSet);

        productRepository.save(product);
        return ProductPageResponse.builder()
                .id(product.getId())
                .description(product.getDescription())
                .name(product.getName())
                .img(product.getImg())
                .price(product.getPrice())
                .build();
    }

    @Override
    public boolean deletedProduct(String id) {
        Product product = productRepository.findProductById(id);
        if (product == null) throw new WebException(ErrorCode.PRODUCT_NOT_FOUND);
        productRepository.delete(product);
        return true;
    }


}
