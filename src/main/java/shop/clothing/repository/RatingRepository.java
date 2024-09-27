package shop.clothing.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import shop.clothing.enity.Account;
import shop.clothing.enity.Rating;

public interface RatingRepository extends JpaRepository<Rating,String> {
}
