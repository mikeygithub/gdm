package com.gxwzu.core.exception;
/**
 * base service RuntimeException
 * @author <a href=mailto:amu_1115@126.com> amu </a>
 * @version $ ServiceException.java 2015-7-8 ����11:30:41
 */
public class ServiceException extends BaseRuntimeException {

	private static final long serialVersionUID = -6507789621489718179L;
	public ServiceException(String msg) {
		super(msg);
		
	}
	  public ServiceException(String msg, Throwable cause) {
	        super(msg, cause);
	    }

}
