package com.example.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Login {
	@Email(message = "{email.email}")
	@NotBlank(message = "{notblank.email}")
	private String email;

	@NotBlank(message = "{notblank.password}")
	private String password;
}
