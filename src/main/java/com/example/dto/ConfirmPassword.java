package com.example.dto;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class ConfirmPassword {
	
	private String code;

	@NotBlank(message = "{notblank.password}")
	private String password;

	@NotBlank(message = "{notblank.password}")
	private String passwordAgain;
}
