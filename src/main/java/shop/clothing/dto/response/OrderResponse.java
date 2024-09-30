package shop.clothing.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderResponse {
    private String id;
    private int quantity;
    private double total;
    private String address;
    private String payment_method;
    private Date datecreate;
    private Date datecome;
    private String name;
}
