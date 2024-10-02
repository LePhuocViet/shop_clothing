package shop.clothing.configuration;

import com.nimbusds.jose.JOSEException;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.oauth2.jose.jws.MacAlgorithm;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.security.oauth2.jwt.JwtException;
import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;
import org.springframework.stereotype.Component;
import shop.clothing.dto.request.IntrospectionRequest;
import shop.clothing.enums.ErrorCode;
import shop.clothing.exception.WebException;
import shop.clothing.service.AuthService;

import javax.crypto.spec.SecretKeySpec;
import java.text.ParseException;
import java.util.Objects;

@Component
public class CustomDecoder implements JwtDecoder {

    @Autowired
    AuthService authService;
    @Value("${security.jwt.singerKey}")
    private String SINGER_KEY;

    NimbusJwtDecoder nimbusJwtDecoder = null;

    @Override
    public Jwt decode(String token) throws JwtException {
        try {
            var introspect = authService.Introspection(new IntrospectionRequest(token));
            if (!introspect){
                throw new WebException(ErrorCode.FORBIDDEN);
            }

        }catch (Exception e){
            e.getMessage();
        }


        if (Objects.isNull(nimbusJwtDecoder)){
            SecretKeySpec secretKeySpec = new SecretKeySpec(SINGER_KEY.getBytes(),"HS256");
            nimbusJwtDecoder = NimbusJwtDecoder.withSecretKey(secretKeySpec).macAlgorithm(MacAlgorithm.HS256).build();
        }

        return nimbusJwtDecoder.decode(token);
    }
}
