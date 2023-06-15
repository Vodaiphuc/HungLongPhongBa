package com.example.validator.constraint;

import java.util.Date;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import com.example.validator.BirthDay;

public class BirthDayValidator implements ConstraintValidator<BirthDay, Date> {

	@Override
	public boolean isValid(Date value, ConstraintValidatorContext context) {
		if (value == null)
			return false;
		int start = value.getYear();
		int yearNow = (new Date()).getYear();
		if (yearNow - start < 18 || yearNow - start > 30)
			return false;
		return true;
	}

}