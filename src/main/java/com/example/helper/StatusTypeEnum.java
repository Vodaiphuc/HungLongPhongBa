package com.example.helper;

public enum StatusTypeEnum {
	ERROR("error"), 
	MESSAGE("message");

	public final String type;

	private StatusTypeEnum(String type) {
		this.type = type;
	}
}
