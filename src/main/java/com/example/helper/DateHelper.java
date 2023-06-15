package com.example.helper;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class DateHelper {
	private static final Calendar cal = Calendar.getInstance();

	public static Date dateNow() {
		return cal.getTime();
	}

	public static Date addMINUTE(int minute) {
		cal.add(Calendar.MINUTE, minute);
		return cal.getTime();
	}

	public static boolean checkTime15P(Date min, Date max) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
			cal.setTime(min);
			if (max.getMinutes() - cal.get(Calendar.MINUTE) >= 15)
				return false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	public static int getMonth() {
		return cal.get(Calendar.MONTH) + 1;
	}
	
	public static int getYear() {
		return cal.get(Calendar.YEAR);
	}

}
