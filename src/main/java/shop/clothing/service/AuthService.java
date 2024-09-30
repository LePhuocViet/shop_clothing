package shop.clothing.service;

import shop.clothing.dto.request.AuthenticationRequest;
import shop.clothing.dto.request.IntrospectionRequest;
import shop.clothing.dto.response.AuthenticationResponse;

public interface AuthService {

    AuthenticationResponse authentication(AuthenticationRequest authenticationRequest);

    boolean Introspection(IntrospectionRequest introspectionRequest);

}
