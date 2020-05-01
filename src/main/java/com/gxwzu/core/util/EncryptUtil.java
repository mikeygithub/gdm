package com.gxwzu.core.util;


import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

//import it.sauronsoftware.base64.Base64;
/**
 * EncryptUtil Utility Class This is used to encode passwords programmatically
 * @version  1.0
 * @since 2014
 * <br> create time:2014-10-25
 */
public class EncryptUtil {


	/**
	 * EncryptUtil
	 *
	 * @param inputText
	 * @return
	 */
	public static String e(String inputText) {
		return md5(inputText);
	}

	/**
	 *
	 *
	 * @param inputText
	 * @return
	 */
//	public static String d(String inputText) {
//		return base64Decode(inputText, "UTF-8");
//	}

	/**
	 *
	 *
	 * @param inputText
	 * @param charset
	 *
	 * @return
	 */
//	public static String base64Encode(String inputText, String... charset) {
//		if (charset.length == 1) {
//			return Base64.encode(inputText, charset[0]);
//		} else {
//			return Base64.encode(inputText);
//		}
//	}

	/**
	 * Base64
	 *
	 * @param inputText
	 * @param charset
	 *
	 * @return
	 */
//	public static String base64Decode(String inputText, String... charset) {
//		if (charset.length == 1) {
//			return Base64.decode(inputText, charset[0]);
//		} else {
//			return Base64.decode(inputText);
//		}
//	}

	/**
	 *
	 *
	 * @param inputText
	 * @return
	 */
	public static String md5AndSha(String inputText) {
		return sha(md5(inputText));
	}

	public static String md5(String inputText) {
		return encrypt(inputText, "md5");
	}

	public static String sha(String inputText) {
		return encrypt(inputText, "sha-1");
	}

	private static String encrypt(String inputText, String algorithmName) {
		if (inputText == null || "".equals(inputText.trim())) {
			throw new IllegalArgumentException("参数不合法");
		}
		if (algorithmName == null || "".equals(algorithmName.trim())) {
			algorithmName = "md5";
		}
		String encryptText = null;
		try {
			MessageDigest m = MessageDigest.getInstance(algorithmName);
			m.update(inputText.getBytes("UTF8"));
			byte s[] = m.digest();
			// m.digest(inputText.getBytes("UTF8"));
			return hex(s);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return encryptText;
	}

	private static String hex(byte[] arr) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < arr.length; ++i) {
			sb.append(Integer.toHexString((arr[i] & 0xFF) | 0x100).substring(1, 3));
		}
		return sb.toString();
	}


}
