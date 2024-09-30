package shop.clothing.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import shop.clothing.dto.response.CartResponse;
import shop.clothing.enity.Account;
import shop.clothing.enity.Cart;

import java.util.List;

public interface CartRepository extends JpaRepository<Cart,String> {

    Cart findCartById(String id);

    @Query("SELECT NEW shop.clothing.dto.response.CartResponse( c.id, c.quantity, p.id AS idProduct, p.name, p.price, p.description, p.img, co.name, s.name ) " +
            "FROM Cart c " +
            "LEFT JOIN c.product p " +
            "LEFT JOIN c.customer cu " +
            "LEFT JOIN p.sizes s " +
            "LEFT JOIN p.colors co " +
            "WHERE cu.id = :id")
    List<CartResponse> findCartByCustomerId(@Param("id") String id);

}
