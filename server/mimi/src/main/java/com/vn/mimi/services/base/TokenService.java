package com.vn.mimi.services.base;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.vn.mimi.components.JwtTokenUtil;
import com.vn.mimi.entities.Token;
import com.vn.mimi.entities.User;
import com.vn.mimi.exceptions.DataNotFoundException;
import com.vn.mimi.exceptions.ExpiredTokenException;
import com.vn.mimi.repositories.TokenRepository;
import com.vn.mimi.services.impl.ITokenService;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class TokenService implements ITokenService {

    @Value("${jwt.expiration}")
    private int expiration; // save to an environment variable

    @Value("${jwt.expiration-refresh-token}")
    private int expirationRefreshToken;

    private final TokenRepository tokenRepository;
    private final JwtTokenUtil jwtTokenUtil;

    @Transactional
    @Override
    public Token refreshToken(String refreshToken, User user) throws Exception {
        Token existingToken = tokenRepository.findByRefreshToken(refreshToken);
        if (existingToken == null) {
            throw new DataNotFoundException("Refresh token does not exist");
        }
        if (existingToken.getRefreshExpirationDate().compareTo(new Date()) < 0) {
            tokenRepository.delete(existingToken);
            throw new ExpiredTokenException("Refresh token is expired");
        }
        String token = jwtTokenUtil.generateToken(user);
        Date expirationDateTime = addSecondsToDate(new Date(), expiration);
        existingToken.setExpirationDate(expirationDateTime);
        existingToken.setToken(token);
        existingToken.setRefreshToken(UUID.randomUUID().toString());
        existingToken.setRefreshExpirationDate(addSecondsToDate(new Date(), expirationRefreshToken));
        return existingToken;
    }

    @Transactional
    @Override
    public Token addToken(User user,String token) {
        int expirationInSeconds = expiration;

        Date expirationDateTime = addSecondsToDate(new Date(), expirationInSeconds);
        // Make new token for user
        Token newToken = Token.builder()
                .user(user)
                .token(token)
                .revoked(false)
                .expired(false)
                .tokenType("Bearer")
                .expirationDate(expirationDateTime)
                .build();

        newToken.setRefreshToken(UUID.randomUUID().toString());
        newToken.setRefreshExpirationDate(addSecondsToDate(new Date(), expirationRefreshToken));
        tokenRepository.save(newToken);
        return newToken;
    }

    private static Date addSecondsToDate(Date date, int secondsToAdd) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.SECOND, secondsToAdd);
        return calendar.getTime();
    }

    @Override
    public List<Token> findByUser(User user) {
        return tokenRepository.findByUser(user);
    }

    @Override
    public void deleteToken(Token token) {
        token.setRevoked(true);
    }
    
}
