package shop.clothing.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import shop.clothing.enity.Account;
import shop.clothing.enity.Category;
import shop.clothing.enity.Color;

public interface CategoryRepository extends JpaRepository<Category,String> {

    Category findCategoryByName(String name);
    boolean existsByName(String name);

}
