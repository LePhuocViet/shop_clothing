package shop.clothing.dto.response;

import jakarta.persistence.Lob;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import shop.clothing.enity.Color;
import shop.clothing.enity.Size;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductItemResponse {
    private String id;

    private String name;

    private double price;

    private String description;
    @Lob
    private byte[] img;

    private Double rate;

    private List<Size> sizes;

    private List<Color> colors;
}
