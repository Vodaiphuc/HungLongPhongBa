package com.example.validator.constraint;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import com.example.validator.ZipCode;

public class ZipCodeValidator implements ConstraintValidator<ZipCode, String> {

	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		try {
			Integer.parseInt(value);
			if (value.length() != 6) {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
		return true;
	}

}