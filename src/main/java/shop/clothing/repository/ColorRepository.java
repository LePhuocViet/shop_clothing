package shop.clothing.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import shop.clothing.enity.Account;
import shop.clothing.enity.Category;
import shop.clothing.enity.Color;

import java.util.List;

public interface ColorRepository extends JpaRepository<Color,String> {
    Color findColorByName(String name);

    boolean existsByName(String name);
}
