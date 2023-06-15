package com.example.helper;

public enum CartStatusTypeEnum {
	DELIVERED("delivered"), 
	BEING_TRANSPORTED("being transported"), 
	WAITING("waiting");

	public final String type;

	private CartStatusTypeEnum(String type) {
		this.type = type;
	}
}
