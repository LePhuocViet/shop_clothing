package shop.clothing.service.Implement;

import com.nimbusds.jwt.SignedJWT;
import lombok.AllArgsConstructor;
import lombok.Setter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import shop.clothing.dto.request.CustomerRequest;
import shop.clothing.dto.request.IntrospectionRequest;
import shop.clothing.dto.response.CustomerResponse;
import shop.clothing.enity.Account;
import shop.clothing.enity.Customer;
import shop.clothing.enity.Role;
import shop.clothing.enums.ErrorCode;
import shop.clothing.exception.WebException;
import shop.clothing.repository.AccountRepository;
import shop.clothing.repository.CustomerRepository;
import shop.clothing.repository.RoleRepository;
import shop.clothing.service.CustomerService;

import java.text.ParseException;
import java.util.HashSet;
import java.util.Set;

@AllArgsConstructor
@Service
public class CustomerImplement implements CustomerService {

    CustomerRepository customerRepository;

    AccountRepository accountRepository;

    RoleRepository roleRepository;
    @Override
    public boolean createCustomer(CustomerRequest customerRequest) {
        if (accountRepository.existsByUsername(customerRequest.getUsername()))
            throw new WebException(ErrorCode.USERNAME_IS_EXISTS);
        if (!customerRequest.getPassword().equals(customerRequest.getRepassword()))
            throw new WebException(ErrorCode.PASSWORD_NOT_MATCH);
        if (customerRepository.existsByEmail(customerRequest.getEmail()))
            throw new WebException(ErrorCode.EMAIL_IS_EXISTS);
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(10);
        Set<Role> set = new HashSet<Role>();
        set.add(roleRepository.findRoleByName("USER"));
        Account account = Account.builder()
                .username(customerRequest.getName())
                .password(passwordEncoder.encode(customerRequest.getPassword()))
                .roles(set)
                .build();
        accountRepository.save(account);
        Customer customer = Customer.builder()
                .name(customerRequest.getName())
                .account(account)
                .address(customerRequest.getAddress())
                .phone(customerRequest.getPhone())
                .email(customerRequest.getEmail())
                .build();
        customerRepository.save(customer);

        return true;
    }

    @Override
    public boolean updateCustomer(CustomerRequest customerRequest) {
        Customer customer = customerRepository.findCustomerById(customerRequest.getId());
        if (customer == null) throw new WebException(ErrorCode.ACCOUNT_NOT_FOUND);
        customer.setName(customerRequest.getName());
        customer.setAddress(customerRequest.getAddress());
        customer.setPhone(customerRequest.getPhone());
        customerRepository.save(customer);
        return true;
    }

    @Override
    public CustomerResponse getMyinfor(IntrospectionRequest introspectionRequest) throws ParseException {
        SignedJWT signedJWT = SignedJWT.parse(introspectionRequest.getToken());
        Account account = accountRepository.findAccountByUsername(signedJWT.getJWTClaimsSet().getSubject());
        Customer customer = customerRepository.findCustomerByAccountId(account.getId());
        return CustomerResponse.builder()
                .name(customer.getName())
                .phone(customer.getPhone())
                .email(customer.getEmail())
                .address(customer.getAddress())
                .build();
    }
}
