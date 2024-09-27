package shop.clothing.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import shop.clothing.enity.Account;
import shop.clothing.enity.Style;

public interface StyleRepository extends JpaRepository<Style,String> {
}
