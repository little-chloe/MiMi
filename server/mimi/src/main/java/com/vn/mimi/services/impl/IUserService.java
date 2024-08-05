package com.vn.mimi.services.impl;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.vn.mimi.dtos.UpdatePasswordDTO;
import com.vn.mimi.dtos.UserDTO;
import com.vn.mimi.entities.User;

public interface IUserService {

    User createUser(UserDTO userDTO) throws Exception;

    String loginUser(String phoneNumber, String password) throws Exception;

    User getUserDetailsFromToken(String token) throws Exception;

    User getUserDetailsFromRefreshToken(String refreshToken) throws Exception;

    User updateMe(UpdatePasswordDTO updatePasswordDTO, String token) throws Exception;

    Page<User> findAll(String keyword, Pageable pageable) throws Exception;

    public void blockOrEnable(String userId, boolean active) throws Exception;

}
