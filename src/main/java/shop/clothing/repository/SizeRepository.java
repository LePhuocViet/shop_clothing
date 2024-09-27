package shop.clothing.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import shop.clothing.enity.Account;
import shop.clothing.enity.Color;
import shop.clothing.enity.Size;

public interface SizeRepository extends JpaRepository<Size,String> {
    Size findSizeByName(String name);
}
