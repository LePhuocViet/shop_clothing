package shop.clothing.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import shop.clothing.enity.Account;
import shop.clothing.enity.OrderItem;

public interface OrderItemRepository extends JpaRepository<OrderItem,String> {
}
