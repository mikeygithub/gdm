package com.gxwzu.sysVO;

import java.awt.image.BufferedImage;

/**
 * 打印二维码信息类
 * @author Amu_1115
 * @version 1.0
 */
public class QcodeModel {
	
	private String qcode;//二维码内容
	private String qcodeName;//二维码标题
	private String qcodeUrl;//二维码对应的URL
	private BufferedImage qcodeImg;//二维码对应的流
	
	public BufferedImage getQcodeImg() {
		return qcodeImg;
	}

	public void setQcodeImg(BufferedImage qcodeImg) {
		this.qcodeImg = qcodeImg;
	}

	public QcodeModel(){
		super();
	}
	
	public String getQcode() {
		return qcode;
	}

	public void setQcode(String qcode) {
		this.qcode = qcode;
	}

	public String getQcodeUrl() {
		return qcodeUrl;
	}

	public void setQcodeUrl(String qcodeUrl) {
		this.qcodeUrl = qcodeUrl;
	}

	public String getQcodeName() {
		return qcodeName;
	}

	public void setQcodeName(String qcodeName) {
		this.qcodeName = qcodeName;
	}

}
