package com.vn.mimi.services.impl;

import java.util.List;

import com.vn.mimi.entities.Token;
import com.vn.mimi.entities.User;

public interface ITokenService {

    List<Token> findByUser(User user);

    Token addToken(User user, String token);

    Token refreshToken(String refreshToken, User user) throws Exception;

    void deleteToken(Token token);

}