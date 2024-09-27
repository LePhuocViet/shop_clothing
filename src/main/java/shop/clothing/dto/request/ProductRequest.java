package shop.clothing.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductRequest {
    private String id;

    private String name;

    private double price;

    private String description;

    private MultipartFile img;

    private String color;

    private String size;

    private String category;

    private String style;

}
