package com.example.helper;

public enum MailTypeEnum {
	LOGIN("login account"), 
	CREATE("create account"), 
	FORGOT("forgot password account");

	public final String type;

	private MailTypeEnum(String type) {
		this.type = type;
	}
}
