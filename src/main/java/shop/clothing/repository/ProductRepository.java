package shop.clothing.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import shop.clothing.dto.response.ProductPageResponse;
import shop.clothing.enity.Account;
import shop.clothing.enity.Product;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product,String> {

    @Query("SELECT NEW shop.clothing.dto.response.ProductPageResponse(" +
            " p.id, p.name, p.price, p.description, p.img, AVG(r.rating) AS rate) " +
            "FROM " +
            "Product p JOIN p.category c " +
            "LEFT JOIN p.style s " +
            "LEFT JOIN p.colors col " +
            "LEFT JOIN p.sizes sz " +
            "LEFT JOIN p.ratings r " +
            "WHERE (:category IS NULL OR c.name = :category OR :category = '') " +
            "AND (:style IS NULL OR s.name = :style OR :style  = '') " +
            "AND (:color IS NULL OR col.name = :color OR :color = '') " +
            "AND (:size IS NULL OR sz.name = :size OR :size = '') " +
            "AND (p.price > :pricemin) " +
            "AND (p.price < :pricemax) " +
            "GROUP BY p.id, p.name, p.price, p.description, p.img")
    List<ProductPageResponse> findProductByProductPageRequest(@Param("category") String category,
                                                              @Param("style") String style,
                                                              @Param("color") String color,
                                                              @Param("size") String size,
                                                              @Param("pricemin") double pricemin,
                                                              @Param("pricemax") double pricemax);

}
