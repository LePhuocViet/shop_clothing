package shop.clothing.enity;


import jakarta.persistence.*;
import lombok.*;


import java.util.List;
import java.util.Set;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Table(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    private String name;

    private String price;

    private String description;

    private byte[] img;

    @ManyToMany
    Set<Color> colors;

    @ManyToMany
    Set<Size> sizes;

    @OneToOne
    @JoinColumn(name = "category_id")
    private Category category;

    @OneToOne
    @JoinColumn(name = "style_id")
    private Style style;

    @OneToMany(mappedBy = "product")
    private List<Rating> ratings;

    @OneToMany(mappedBy = "product")
    private List<Cart> carts;

}
