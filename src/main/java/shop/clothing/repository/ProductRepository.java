package shop.clothing.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import shop.clothing.enity.Account;
import shop.clothing.enity.Product;

public interface ProductRepository extends JpaRepository<Product,String> {
}
