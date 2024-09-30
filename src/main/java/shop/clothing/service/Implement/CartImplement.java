package shop.clothing.service.Implement;

import com.nimbusds.jwt.SignedJWT;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import shop.clothing.dto.request.CartRequest;
import shop.clothing.dto.request.CartUpdateRequest;
import shop.clothing.dto.request.IntrospectionRequest;
import shop.clothing.dto.response.CartConfirmResponse;
import shop.clothing.dto.response.CartResponse;
import shop.clothing.enity.Account;
import shop.clothing.enity.Cart;
import shop.clothing.enity.Customer;
import shop.clothing.enums.ErrorCode;
import shop.clothing.exception.WebException;
import shop.clothing.repository.AccountRepository;
import shop.clothing.repository.CartRepository;
import shop.clothing.repository.CustomerRepository;
import shop.clothing.repository.ProductRepository;
import shop.clothing.service.CartService;

import java.text.ParseException;
import java.util.List;

@Service
@AllArgsConstructor
public class CartImplement implements CartService {

    CartRepository cartRepository;

    AccountRepository accountRepository;

    CustomerRepository customerRepository;

    ProductRepository productRepository;

    @Override
    public CartConfirmResponse createCart(CartRequest cartRequest) throws ParseException {
        SignedJWT signedJWT = SignedJWT.parse(cartRequest.getToken());
        Account account = accountRepository.findAccountByUsername(signedJWT.getJWTClaimsSet().getSubject());
        Customer customer = customerRepository.findCustomerByAccountId(account.getId());
        Cart cart = Cart.builder()
                .customer(customer)
                .product(productRepository.findProductById(cartRequest.getIdProduct()))
                .quantity(cartRequest.getQuantity())
                .build();
        cartRepository.save(cart);
        return CartConfirmResponse.builder()
                .valid(true)
                .message("Add cart success")
                .build();
    }

    @Override
    public CartConfirmResponse updateCart(CartUpdateRequest cartUpdateRequest) throws ParseException {
        SignedJWT signedJWT = SignedJWT.parse(cartUpdateRequest.getToken());
        Account account = accountRepository.findAccountByUsername(signedJWT.getJWTClaimsSet().getSubject());
        Customer customer = customerRepository.findCustomerByAccountId(account.getId());
        Cart cart = cartRepository.findCartById(cartUpdateRequest.getIdCart());
        if (cart == null) throw new WebException(ErrorCode.CART_NOT_FOUND);
        cart.setQuantity(cartUpdateRequest.getQuantity());
        if (!customer.getId().equals(cart.getCustomer().getId()))
            throw new WebException(ErrorCode.WRONG_CART_CUSTOMER);
        cartRepository.save(cart);
        return CartConfirmResponse.builder()
                .valid(true)
                .message("Update cart success")
                .build();

    }

    @Override
    public Boolean deletedCart(CartUpdateRequest cartUpdateRequest) throws ParseException {
        SignedJWT signedJWT = SignedJWT.parse(cartUpdateRequest.getToken());
        Account account = accountRepository.findAccountByUsername(signedJWT.getJWTClaimsSet().getSubject());
        Customer customer = customerRepository.findCustomerByAccountId(account.getId());
        Cart cart = cartRepository.findCartById(cartUpdateRequest.getIdCart());
        if (!customer.getId().equals(cart.getCustomer().getId()))
            throw new WebException(ErrorCode.WRONG_CART_CUSTOMER);
        if (cart == null) throw new WebException(ErrorCode.CART_NOT_FOUND);
        cartRepository.delete(cart);
        return true;
    }

    @Override
    public List<CartResponse> getAllCartByCustomer(IntrospectionRequest introspectionRequest) throws ParseException {
        SignedJWT signedJWT = SignedJWT.parse(introspectionRequest.getToken());
        Account account = accountRepository.findAccountByUsername(signedJWT.getJWTClaimsSet().getSubject());
        Customer customer = customerRepository.findCustomerByAccountId(account.getId());
        List<CartResponse> cartResponses = cartRepository.findCartByCustomerId(customer.getId());
        if (cartResponses == null) throw new WebException(ErrorCode.CART_NOT_FOUND);
        return cartResponses;
    }


}
