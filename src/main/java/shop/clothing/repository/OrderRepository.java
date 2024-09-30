package shop.clothing.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import shop.clothing.dto.response.OrderResponse;
import shop.clothing.enity.Order;

import java.util.Date;
import java.util.List;

public interface OrderRepository extends JpaRepository<Order,String> {

    Order findOrderById(String id);

    boolean existsById(String id);

    @Query("SELECT NEW shop.clothing.dto.response.OrderResponse( o.id, o.quantity, o.total, o.address, o.payment_method, o.datecreate, o.datecome, c.name) " +
            "FROM Order o " +
            "LEFT JOIN o.customer c ")
    List<OrderResponse> findAllOrder();

    @Query("SELECT NEW shop.clothing.dto.response.OrderResponse( o.id, o.quantity, o.total, o.address, o.payment_method, o.datecreate, o.datecome, c.name) " +
            "FROM Order o " +
            "LEFT JOIN o.customer c " +
            "Where c.id = :id")
    List<OrderResponse> findAllOrderByCustomerId(@Param("id") String id);
}
