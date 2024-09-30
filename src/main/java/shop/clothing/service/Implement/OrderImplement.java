package shop.clothing.service.Implement;

import com.nimbusds.jwt.SignedJWT;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import shop.clothing.dto.request.OrderRequest;
import shop.clothing.dto.request.OrderUpdateRequest;
import shop.clothing.dto.response.CartResponse;
import shop.clothing.dto.response.OrderItemResponse;
import shop.clothing.dto.response.OrderResponse;
import shop.clothing.enity.*;
import shop.clothing.enums.ErrorCode;
import shop.clothing.exception.WebException;
import shop.clothing.repository.*;
import shop.clothing.service.OrderService;

import java.text.ParseException;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;

@Service
@AllArgsConstructor
public class OrderImplement implements OrderService {
    OrderRepository orderRepository;

    OrderItemRepository orderItemRepository;

    CartRepository cartRepository;

    CustomerRepository customerRepository;

    AccountRepository accountRepository;

    ProductRepository productRepository;



    @Override
    public boolean createOrder(OrderRequest orderRequest) throws ParseException {
        SignedJWT signedJWT = SignedJWT.parse(orderRequest.getToken());
        Account account = accountRepository.findAccountByUsername(signedJWT.getJWTClaimsSet().getSubject());
        Customer customer = customerRepository.findCustomerByAccountId(account.getId());
        List<CartResponse> cart = cartRepository.findCartByCustomerId(customer.getId());
        if (cart.isEmpty()) throw new WebException(ErrorCode.CART_NOT_FOUND);
        Order order = Order.builder()
                .customer(customer)
                .datecreate(new Date())
                .datecome(new Date(
                        Instant.now().plus(3, ChronoUnit.DAYS).toEpochMilli()
                ))
                .payment_method(orderRequest.getPayment())
                .address(customer.getAddress())
                .build();
        orderRepository.save(order);
        int quantity = 0;
        double total = 0;
        for (int i = 0; i < cart.size();i++){
            Product product = productRepository.findProductById(cart.get(i).getIdProduct());
            quantity += cart.get(i).getQuantity();
            total += product.getPrice()*cart.get(i).getQuantity();
            OrderItem orderItem = OrderItem.builder()
                    .order(order)
                    .product(product)
                    .quantity(cart.get(i).getQuantity())
                    .price(product.getPrice()*cart.get(i).getQuantity())
                    .build();
            cartRepository.deleteById(cart.get(i).getId());
            orderItemRepository.save(orderItem);
        }
        order.setQuantity(quantity);
        order.setTotal(total);
        orderRepository.save(order);
        return true;
    }

    @Override
    public  List<OrderResponse> getAllOrder() {
        List<OrderResponse> list = orderRepository.findAllOrder();
        if (list.isEmpty()) throw new WebException(ErrorCode.ORDER_NOT_FOUND);

        return orderRepository.findAllOrder();
    }

    @Override
    public boolean deletedOrder(OrderUpdateRequest orderUpdateRequest) throws ParseException {
        if(!orderRepository.existsById(orderUpdateRequest.getIdOrder())){
            throw new WebException(ErrorCode.ORDER_NOT_FOUND);
        }

        orderItemRepository.deleteByOrderId(orderUpdateRequest.getIdOrder());
        orderRepository.deleteById(orderUpdateRequest.getIdOrder());
        return true;
    }

    @Override
    public boolean updateOrder(OrderUpdateRequest orderUpdateRequest) {
        if(!orderRepository.existsById(orderUpdateRequest.getIdOrder())){
            throw new WebException(ErrorCode.ORDER_NOT_FOUND);
        }
        Order order = orderRepository.findOrderById(orderUpdateRequest.getIdOrder());
        order.setDatecome(orderUpdateRequest.getTimeCome());
        orderRepository.save(order);
        return true;
    }

    @Override
    public List<OrderResponse> findOrderByCustomerId(OrderRequest orderRequest) throws ParseException {
        SignedJWT signedJWT = SignedJWT.parse(orderRequest.getToken());
        Account account = accountRepository.findAccountByUsername(signedJWT.getJWTClaimsSet().getSubject());
        Customer customer = customerRepository.findCustomerByAccountId(account.getId());
        List<OrderResponse> list = orderRepository.findAllOrderByCustomerId(customer.getId());
        if (list.isEmpty()) throw new WebException(ErrorCode.ORDER_NOT_FOUND);
        return list;
    }

    @Override
    public List<OrderItemResponse> findItemByOrder( String id) {
        return orderItemRepository.findItemByOrder(id);
    }
}
