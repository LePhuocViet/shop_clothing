package shop.clothing.repository;

import jakarta.persistence.Lob;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import shop.clothing.dto.response.OrderItemResponse;
import shop.clothing.enity.OrderItem;

import java.util.List;

public interface OrderItemRepository extends JpaRepository<OrderItem,String> {
    @Transactional
    void deleteByOrderId(String orderId);

    @Query("SELECT NEW shop.clothing.dto.response.OrderItemResponse( oi.id, oi.quantity, oi.price, p.id, p.name, p.price, " +
            "p.description, p.img, c.name, s.name ) " +
            "FROM OrderItem oi " +
            "LEFT JOIN oi.order o " +
            "LEFT JOIN oi.product p " +
            "LEFT JOIN p.colors c " +
            "LEFT JOIN p.sizes s " +
            "WHERE o.id = :id")
    List<OrderItemResponse> findItemByOrder(@Param("id") String id);



}
