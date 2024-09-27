package shop.clothing.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import shop.clothing.enity.Account;
import shop.clothing.enity.OrderList;

public interface OrderListRepository extends JpaRepository<OrderList,String> {
}
