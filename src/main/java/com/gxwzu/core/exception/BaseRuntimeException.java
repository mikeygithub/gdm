package com.gxwzu.core.exception;

import org.springframework.core.NestedRuntimeException;

public abstract class BaseRuntimeException extends NestedRuntimeException {

	private static final long serialVersionUID = -693646241406754585L;
	public BaseRuntimeException(String msg) {
		super(msg);
		
	}
	public BaseRuntimeException(String msg, Throwable cause) {
		super(msg, cause);
		
	}

	

}
