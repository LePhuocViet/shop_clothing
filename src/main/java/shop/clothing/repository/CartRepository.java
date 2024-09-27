package shop.clothing.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import shop.clothing.enity.Account;
import shop.clothing.enity.Cart;

public interface CartRepository extends JpaRepository<Cart,String> {
}
