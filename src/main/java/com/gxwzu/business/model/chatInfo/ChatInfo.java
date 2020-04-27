package com.gxwzu.business.model.chatInfo;

import java.sql.Timestamp;

/**
 * ChatInfo entity. @author MyEclipse Persistence Tools
 */

public class ChatInfo implements java.io.Serializable {

	// Fields

	private Integer chatId;
	private Integer senderId;
	private String senderName;
	private String senderContent;
	private Integer answerId;
	private String answerName;
	private String readType;
	private Integer year;
	private Timestamp sendTime;
	private String chatType;
	private String contType;

	// Constructors

	/** default constructor */
	public ChatInfo() {
	}

	/** full constructor */
	public ChatInfo(Integer senderId, String senderName, String senderContent,Integer answerId, String answerName, String readType, Integer year,Timestamp sendTime, String chatType, String contType) {
		this.senderId = senderId;
		this.senderName = senderName;
		this.senderContent = senderContent;
		this.answerId = answerId;
		this.answerName = answerName;
		this.readType = readType;
		this.year = year;
		this.sendTime = sendTime;
		this.chatType = chatType;
		this.contType = contType;
	}

	// Property accessors

	public Integer getChatId() {
		return this.chatId;
	}

	public void setChatId(Integer chatId) {
		this.chatId = chatId;
	}

	public Integer getSenderId() {
		return this.senderId;
	}

	public void setSenderId(Integer senderId) {
		this.senderId = senderId;
	}

	public String getSenderName() {
		return this.senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public String getSenderContent() {
		return this.senderContent;
	}

	public void setSenderContent(String senderContent) {
		this.senderContent = senderContent;
	}

	public Integer getAnswerId() {
		return this.answerId;
	}

	public void setAnswerId(Integer answerId) {
		this.answerId = answerId;
	}

	public String getAnswerName() {
		return this.answerName;
	}

	public void setAnswerName(String answerName) {
		this.answerName = answerName;
	}

	public String getReadType() {
		return this.readType;
	}

	public void setReadType(String readType) {
		this.readType = readType;
	}

	public Integer getYear() {
		return this.year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Timestamp getSendTime() {
		return this.sendTime;
	}

	public void setSendTime(Timestamp sendTime) {
		this.sendTime = sendTime;
	}

	public String getChatType() {
		return this.chatType;
	}

	public void setChatType(String chatType) {
		this.chatType = chatType;
	}

	public String getContType() {
		return this.contType;
	}

	public void setContType(String contType) {
		this.contType = contType;
	}

}