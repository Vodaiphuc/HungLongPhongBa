package com.example.validator.constraint;

import java.lang.reflect.Field;
import java.util.Date;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import com.example.validator.EndDayDiscount;

public class EndDayDiscountValidator implements ConstraintValidator<EndDayDiscount, Object> {

	private String beforeFieldName;
	private String afterFieldName;

	@Override
	public void initialize(final EndDayDiscount constraintAnnotation) {
		beforeFieldName = constraintAnnotation.before();
		afterFieldName = constraintAnnotation.after();
	}

	@Override
	public boolean isValid(final Object value, final ConstraintValidatorContext context) {
		try {
			if (value == null)
				return false;
			
			final Field beforeDateField = value.getClass().getDeclaredField(beforeFieldName);
			beforeDateField.setAccessible(true);

			final Field afterDateField = value.getClass().getDeclaredField(afterFieldName);
			afterDateField.setAccessible(true);
			
			System.out.println(beforeDateField + "-" + afterDateField);

			final Date beforeDate = (Date) beforeDateField.get(value);
			final Date afterDate = (Date) afterDateField.get(value);

			return beforeDate == null && afterDate == null || beforeDate != null && beforeDate.before(afterDate);
		} catch (final Exception e) {
			e.printStackTrace();

			return false;
		}
	}

}