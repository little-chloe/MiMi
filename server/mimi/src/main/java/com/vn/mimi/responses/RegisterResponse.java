package com.vn.mimi.responses;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class RegisterResponse {

    @JsonProperty("message")
    private String message;

    @JsonProperty("user")
    private UserResponse user;
    
}
