package shop.clothing.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import shop.clothing.enity.Account;
import shop.clothing.enity.Category;

public interface CategoryRepository extends JpaRepository<Category,String> {
}
