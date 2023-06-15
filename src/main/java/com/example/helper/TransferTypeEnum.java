package com.example.helper;

public enum TransferTypeEnum {
	FORWARD("forward:"), 
	REDIRECT("redirect:");

	public final String type;

	private TransferTypeEnum(String type) {
		this.type = type;
	}
}