package com.SitWith.User;

public class UserEmailDuplicateException extends RuntimeException{
	public UserEmailDuplicateException(String message) {
		super(message);
	}
}
