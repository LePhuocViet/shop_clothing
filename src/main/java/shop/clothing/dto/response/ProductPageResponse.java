package shop.clothing.dto.response;

import jakarta.persistence.Lob;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductPageResponse {

    private String id;

    private String name;

    private double price;

    private String description;
    @Lob
    private byte[] img;

    private Double rate;

}
