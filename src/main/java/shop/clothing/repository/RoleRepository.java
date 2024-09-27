package shop.clothing.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import shop.clothing.enity.Account;
import shop.clothing.enity.Role;

public interface RoleRepository extends JpaRepository<Role,String> {
}
