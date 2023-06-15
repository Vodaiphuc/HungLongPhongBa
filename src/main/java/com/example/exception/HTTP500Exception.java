package com.example.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ResponseStatus(value = HttpStatus.NOT_FOUND, reason = "Not Found")
public class HTTP500Exception extends RuntimeException {

	private static final long serialVersionUID = 1L;

	private String errorMessage;

	private String errorCode;
}
