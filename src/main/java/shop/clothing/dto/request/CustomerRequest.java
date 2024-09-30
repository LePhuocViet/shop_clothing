package shop.clothing.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CustomerRequest {
    private String id;

    private String name;

    private String address;

    private String phone;

    private String email;

    private String username;

    private String password;

    private String repassword;
}
