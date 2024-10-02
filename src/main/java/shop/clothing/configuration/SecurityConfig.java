package shop.clothing.configuration;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.oauth2.server.resource.authentication.*;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfig {
    @Autowired
    CustomDecoder customDecoder;

    String[] PUBLIC_ENDPOINT_GET = {"/products/**","/orders/**"};
    String[] PUBLIC_ENDPOINT_POST = {"/auth/login","/auth/introspect"};
    String[] PUBLIC_ENDPOINT_PUT = {};
    String[] USER_ENDPOINT_GET = {"/carts","/orders/my-order","/customers/my-infor"};
    String[] USER_ENDPOINT_POST = {"/carts","/orders","/customers"};
    String[] USER_ENDPOINT_PUT = {"/carts","/customers"};
    String[] USER_ENDPOINT_DELETE = {"/carts"};


    String[] ADMIN_ENDPOINT_GET  = {"/colors","/sizes","/orders"};
    String[] ADMIN_ENDPOINT_POST  = {"/products","/colors","/sizes"};
    String[] ADMIN_ENDPOINT_PUT  = {"/products","/orders"};
    String[] ADMIN_ENDPOINT_DELETE  = {"/products","/colors","/sizes","/orders"};
    @Bean
    SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
            httpSecurity.authorizeHttpRequests(request ->
                    request.requestMatchers(HttpMethod.GET,PUBLIC_ENDPOINT_GET).permitAll()
                            .requestMatchers(HttpMethod.POST,PUBLIC_ENDPOINT_POST).permitAll()
                            .requestMatchers(HttpMethod.PUT,PUBLIC_ENDPOINT_PUT).permitAll()
                            .requestMatchers(HttpMethod.GET,USER_ENDPOINT_GET).hasRole("USER")
                            .requestMatchers(HttpMethod.POST,USER_ENDPOINT_POST).hasRole("USER")
                            .requestMatchers(HttpMethod.PUT,USER_ENDPOINT_PUT).hasRole("USER")
                            .requestMatchers(HttpMethod.DELETE,USER_ENDPOINT_DELETE).hasRole("USER")
                            .requestMatchers(HttpMethod.GET,ADMIN_ENDPOINT_GET).hasRole("ADMIN")
                            .requestMatchers(HttpMethod.POST,ADMIN_ENDPOINT_POST).hasRole("ADMIN")
                            .requestMatchers(HttpMethod.PUT,ADMIN_ENDPOINT_PUT).hasRole("ADMIN")
                            .requestMatchers(HttpMethod.DELETE,ADMIN_ENDPOINT_DELETE).hasRole("ADMIN")
                            .anyRequest().authenticated());
            httpSecurity.oauth2ResourceServer(oauth ->
                    oauth.jwt(jwtConfigurer ->
                            jwtConfigurer.decoder(customDecoder)
                                    .jwtAuthenticationConverter(jwtAuthenticationConverter())
                            )
                    );
            httpSecurity.csrf(httpSecurityCsrfConfigurer -> httpSecurityCsrfConfigurer.disable());


           return httpSecurity.build();
    }

    JwtAuthenticationConverter jwtAuthenticationConverter(){
        JwtGrantedAuthoritiesConverter jwtGrantedAuthoritiesConverter = new JwtGrantedAuthoritiesConverter();
        jwtGrantedAuthoritiesConverter.setAuthorityPrefix("ROLE_");
        JwtAuthenticationConverter jwtAuthenticationConverter = new JwtAuthenticationConverter();
        jwtAuthenticationConverter.setJwtGrantedAuthoritiesConverter(jwtGrantedAuthoritiesConverter);
        return jwtAuthenticationConverter;
    }

}
