package shop.clothing.service.Implement;

import com.nimbusds.jose.*;
import com.nimbusds.jose.crypto.MACSigner;
import com.nimbusds.jose.crypto.MACVerifier;
import com.nimbusds.jose.crypto.PasswordBasedDecrypter;
import com.nimbusds.jose.crypto.PasswordBasedEncrypter;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import shop.clothing.dto.request.AuthenticationRequest;
import shop.clothing.dto.request.IntrospectionRequest;
import shop.clothing.dto.response.AuthenticationResponse;
import shop.clothing.enity.Account;
import shop.clothing.enums.ErrorCode;
import shop.clothing.exception.WebException;
import shop.clothing.repository.AccountRepository;
import shop.clothing.service.AuthService;

import java.text.ParseException;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Collections;
import java.util.Date;
import java.util.StringJoiner;
import java.util.UUID;

@Service
public class AuthImplement implements AuthService {
    @Autowired
    AccountRepository accountRepository;

    @Value("${security.jwt.singerKey}")
    private String SINGER_KEY;

    @Override
    public AuthenticationResponse authentication(AuthenticationRequest authenticationRequest) {
        if (!accountRepository.existsByUsername(authenticationRequest.getUsername()))
            throw new WebException(ErrorCode.USERNAME_NOT_FOUND);
        Account account = accountRepository.findAccountByUsername(authenticationRequest.getUsername());
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(10);
        if (!passwordEncoder.matches(authenticationRequest.getPassword(),account.getPassword()))
            throw new WebException(ErrorCode.PASSWORD_NOT_RIGHT);
        return AuthenticationResponse.builder()
                .authentication(true)
                .token(createToken(account))
                .build();
    }

    @Override
    public boolean Introspection(IntrospectionRequest introspectionRequest) {
        boolean valid = true;
        try {
            verifyToken(introspectionRequest.getToken());
        } catch (ParseException e) {
            valid = false;
            throw new RuntimeException(e);
        } catch (JOSEException e) {
            valid = false;
            throw new RuntimeException(e);
        }
        return valid;
    }

    SignedJWT verifyToken(String token) throws ParseException, JOSEException {
        JWSVerifier jwsVerifier = new MACVerifier(SINGER_KEY.getBytes());
        SignedJWT signedJWT = SignedJWT.parse(token);
        Date timeexp = signedJWT.getJWTClaimsSet().getExpirationTime();
        var verify = signedJWT.verify(jwsVerifier);
        if (!(verify && timeexp.after(new Date()))){
            throw new WebException(ErrorCode.UNAUTHORIZED);
        }
        return signedJWT;
    }


    String createToken(Account account){
        JWSHeader jwsHeader = new JWSHeader(JWSAlgorithm.HS256);
        JWTClaimsSet jwtClaimsSet = new JWTClaimsSet.Builder()
                .subject(account.getUsername())
                .issuer("Shop")
                .jwtID(UUID.randomUUID().toString())
                .issueTime(new Date())
                .claim("scope",buildScope(account))
                .expirationTime(new Date(
                        Instant.now().plus(30, ChronoUnit.MINUTES).toEpochMilli()
                ))
                .build();

        Payload payload = new Payload(jwtClaimsSet.toJSONObject());
        JWSObject jwsObject = new JWSObject(jwsHeader,payload);
        try {
            jwsObject.sign(new MACSigner(SINGER_KEY.getBytes()));
            return jwsObject.serialize();
        } catch (JOSEException e) {
            throw new RuntimeException(e);
        }
    }

    String buildScope(Account account){
        StringJoiner stringJoiner = new StringJoiner(" ");
        if (!CollectionUtils.isEmpty(account.getRoles())){
            account.getRoles().forEach(role -> {
                stringJoiner.add(role.getName());
            });
        }
        return stringJoiner.toString();
    }

}
