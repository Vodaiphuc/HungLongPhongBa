package com.example.validator;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import com.example.validator.constraint.EndDayDiscountValidator;

@Constraint(validatedBy = EndDayDiscountValidator.class)
@Target({ ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
public @interface EndDayDiscount {
	public String message() default "End date must be greater than start date";

	public Class<?>[] groups() default {};

	public Class<? extends Payload>[] payload() default {};

	public String before();

	public String after();
}