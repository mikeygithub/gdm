package com.gxwzu.core.util.tools;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.lang.StringUtils;

/**
 * ת������
 * @version $ ConvertUtils.java 2015-7-14 ����09:16:33
 */
public class ConvertUtils {

	static {
		registerDateConverter();
	}

	/**
	 * ��ȡ�����еĶ��������(ͨ��getter����), ��ϳ�List.
	 * 
	 * @param collection ��Դ����.
	 * @param propertyName Ҫ��ȡ��������.
	 */
	@SuppressWarnings("unchecked")
	public static List convertElementPropertyToList(final Collection collection, final String propertyName) {
		List list = new ArrayList();

		try {
			for (Object obj : collection) {
				list.add(PropertyUtils.getProperty(obj, propertyName));
			}
		} catch (Exception e) {
			throw ReflectionUtils.convertReflectionExceptionToUnchecked(e);
		}

		return list;
	}

	/**
	 * ��ȡ�����еĶ��������(ͨ��getter����), ��ϳ��ɷָ��ָ����ַ�.
	 * 
	 * @param collection ��Դ����.
	 * @param propertyName Ҫ��ȡ��������.
	 * @param separator �ָ���.
	 */
	@SuppressWarnings("unchecked")
	public static String convertElementPropertyToString(final Collection collection, final String propertyName,
			final String separator) {
		List list = convertElementPropertyToList(collection, propertyName);
		return StringUtils.join(list, separator);
	}

	/**
	 * ת���ַ���Ӧ����.
	 * 
	 * @param value ��ת�����ַ�.
	 * @param toType ת��Ŀ������.
	 */
	public static Object convertStringToObject(String value, Class<?> toType) {
	    if(StringUtils.isBlank(value)){
	        return null;
	    }
		try {
			return org.apache.commons.beanutils.ConvertUtils.convert(value, toType);
		} catch (Exception e) {
			throw ReflectionUtils.convertReflectionExceptionToUnchecked(e);
		}
	}

	/**
	 * ��������Converter�ĸ�ʽ: yyyy-MM-dd �� yyyy-MM-dd HH:mm:ss
	 */
	private static void registerDateConverter() {
		DateConverter dc = new DateConverter();
		dc.setUseLocaleFormat(true);
		dc.setPatterns(new String[] { "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss" });
		org.apache.commons.beanutils.ConvertUtils.register(dc, Date.class);
	}
}
