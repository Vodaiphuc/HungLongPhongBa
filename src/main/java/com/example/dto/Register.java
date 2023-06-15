package com.example.dto;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.example.validator.BirthDay;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Register {
	@Size(min = 5, message = "{size.fullName}")
	@NotBlank(message = "{notblank.fullName}")
	private String fullName;

	@Email(message = "{email.email}")
	@NotBlank(message = "{notblank.email}")
	private String email;

	@NotBlank(message = "{notblank.password}")
	private String password;

	@NotBlank(message = "{notblank.password}")
	private String passwordAgain;

	@BirthDay
	@DateTimeFormat(iso = ISO.DATE)
	private Date birthDay;
}
