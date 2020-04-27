package com.gxwzu.sysVO;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.gxwzu.business.model.chatInfo.ChatFile;

/**
 * ChatInfo entity. @author MyEclipse Persistence Tools
 */

public class ListChatInfo implements java.io.Serializable {

	// Fields

	private Integer chatId;
	private Integer senderId;
	private String senderName;
	private String senderContent;
	private Integer answerId;
	private String answerName;
	private String readType;
	private Integer year;
	private String sendTime;
	private String chatType;
	private String contType;
	
	List<ChatFile> chatFileList = new ArrayList<ChatFile>(); 
	// Constructors

	/** default constructor */
	public ListChatInfo() {
	}

	/** full constructor */
	public ListChatInfo(Integer senderId, String senderName, String senderContent,
			Integer answerId, String answerName, String readType,
			Integer year, String sendTime,String chatType,String contType) {
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

	public String getSendTime() {
		return this.sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	public List<ChatFile> getChatFileList() {
		return chatFileList;
	}

	public void setChatFileList(List<ChatFile> chatFileList) {
		this.chatFileList = chatFileList;
	}

	public String getChatType() {
		return chatType;
	}

	public void setChatType(String chatType) {
		this.chatType = chatType;
	}

	public String getContType() {
		return contType;
	}

	public void setContType(String contType) {
		this.contType = contType;
	}

	

}