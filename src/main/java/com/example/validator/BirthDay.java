package com.example.validator;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import com.example.validator.constraint.BirthDayValidator;

@Constraint(validatedBy = BirthDayValidator.class)
@Target({ ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
public @interface BirthDay {
	public String message() default "Tuổi của bạn phải hơn 14 năm";

	public Class<?>[] groups() default {};

	public Class<? extends Payload>[] payload() default {};
}