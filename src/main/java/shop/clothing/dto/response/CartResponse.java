package shop.clothing.dto.response;

import jakarta.persistence.Lob;
import jakarta.persistence.ManyToMany;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import shop.clothing.enity.Color;
import shop.clothing.enity.Product;
import shop.clothing.enity.Size;

import java.util.List;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CartResponse {
    private String id;

    private int quantity;

    private String idProduct;

    private String name;

    private double price;

    private String description;

    private byte[] img;

    private String colors;

    private String sizes;


}
