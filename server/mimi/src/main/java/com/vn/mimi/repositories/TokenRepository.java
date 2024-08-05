package com.vn.mimi.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import org.springframework.stereotype.Repository;

import com.vn.mimi.entities.Token;
import com.vn.mimi.entities.User;

@Repository
public interface TokenRepository extends JpaRepository<Token, String> {

    List<Token> findByUser(User user);

    Token findByToken(String token);
    
    Token findByRefreshToken(String token);

}
