package com.example.helper;

public enum MailSubjectTypeEnum {
	THANK("Thank you"),
	VERIFICATION("Verification");

	public final String type;

	private MailSubjectTypeEnum(String type) {
		this.type = type;
	}
}
