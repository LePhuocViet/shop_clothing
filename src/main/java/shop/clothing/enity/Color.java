package shop.clothing.enity;


import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Table(name = "color")
public class Color {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    private String name;



}
