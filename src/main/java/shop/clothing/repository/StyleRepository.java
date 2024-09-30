package shop.clothing.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import shop.clothing.enity.Account;
import shop.clothing.enity.Size;
import shop.clothing.enity.Style;

public interface StyleRepository extends JpaRepository<Style,String> {

    Style findStyleByName(String name);

    boolean existsByName(String name);
}
