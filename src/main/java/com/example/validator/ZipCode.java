package com.example.validator;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import com.example.validator.constraint.ZipCodeValidator;

@Constraint(validatedBy = ZipCodeValidator.class)
@Target({ ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
public @interface ZipCode {
	public String message() default "Zip code of 6 digits";

	public Class<?>[] groups() default {};

	public Class<? extends Payload>[] payload() default {};
}