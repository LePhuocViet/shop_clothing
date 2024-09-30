package shop.clothing.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import shop.clothing.enity.Account;

public interface AccountRepository extends JpaRepository<Account,String> {

    boolean existsByUsername(String username);

    Account findAccountByUsername(String username);

}
