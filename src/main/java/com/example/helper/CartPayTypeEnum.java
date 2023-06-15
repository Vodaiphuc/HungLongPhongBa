package com.example.helper;

public enum CartPayTypeEnum {
	PAYPAL("paypal"),
	CHECK("check payments");

	public final String type;

	private CartPayTypeEnum(String type) {
		this.type = type;
	}
}
