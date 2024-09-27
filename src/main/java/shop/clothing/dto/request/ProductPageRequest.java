package shop.clothing.dto.request;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductPageRequest {
    private int page;
    private int sizepage = 12;

    private String category;

    private String style;

    private String color;

    private String size;

    private double pricemin;

    private double pricemax;


}
