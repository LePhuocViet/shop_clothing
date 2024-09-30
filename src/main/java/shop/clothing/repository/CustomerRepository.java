package shop.clothing.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import shop.clothing.enity.Account;
import shop.clothing.enity.Customer;

public interface CustomerRepository extends JpaRepository<Customer,String> {

    Customer findCustomerByAccountId(String id);

    boolean existsByEmail(String email);

    Customer findCustomerById(String id);
}
