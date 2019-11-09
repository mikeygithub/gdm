package com.gxwzu.business.service.chatInfo.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.chatInfo.IChatInfoDao;
import com.gxwzu.business.model.chatInfo.ChatFile;
import com.gxwzu.business.model.chatInfo.ChatInfo;
import com.gxwzu.business.service.chatInfo.IChatFileSerivce;
import com.gxwzu.business.service.chatInfo.IChatInfoSerivce;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.core.util.DateUtils;
import com.gxwzu.sysVO.ListChatInfo;
import com.gxwzu.sysVO.ListStudentAllotGuide;

@Service("chatInfoService")
public class ChatInfoServiceImpl extends BaseServiceImpl<ChatInfo> implements IChatInfoSerivce{
    @Autowired
    private IChatInfoDao chatInfoDao;
    
    @Autowired
    private IChatFileSerivce chatFileSerivce;
    
    public BaseDao<ChatInfo> getDao() {
		return this.chatInfoDao;
	}


	@Override
	public ChatInfo add(ChatInfo model) {
		return chatInfoDao.saveOrUpdate(model);
	}



	@Override
	public List<ListChatInfo> findByUserIdAndAnswerId(Integer userId,
			Integer answerId,String chatType) {
		List<ListChatInfo> list = new ArrayList<ListChatInfo>(); 
		List<ChatInfo> oldList =  chatInfoDao.findByUserIdAndAnswerId(userId,answerId,chatType);
		if(oldList!=null){
			for(ChatInfo model :oldList){
				ListChatInfo lInfo = new ListChatInfo();
				lInfo.setChatId(model.getChatId());
				lInfo.setAnswerId(model.getAnswerId());
				lInfo.setAnswerName(model.getAnswerName());
				lInfo.setReadType(model.getReadType());
				lInfo.setSenderContent(model.getSenderContent());
				lInfo.setSenderId(model.getSenderId());
				lInfo.setSenderName(model.getSenderName());
				lInfo.setChatType(model.getChatType());
				lInfo.setContType(model.getContType());
				if(model.getSendTime()!=null)
				lInfo.setSendTime(DateUtils.timestampFormatTime(model.getSendTime()));
				
				lInfo.setYear(model.getYear());
				
				 List<ChatFile> chatFileList  = chatFileSerivce.findByChatInfoId(model.getChatId());
				lInfo.setChatFileList(chatFileList);
				
				list.add(lInfo);
			}
		}
		return  list; 
	}


	@Override
	public ListChatInfo findViewModelById(Integer chatId) {
		if(chatId!=null){
			ChatInfo model =  chatInfoDao.get(ChatInfo.class, chatId);
			ListChatInfo lInfo = null;
			if(model!=null){
				 lInfo = new ListChatInfo();
				lInfo.setChatId(model.getChatId());
				lInfo.setAnswerId(model.getAnswerId());
				lInfo.setAnswerName(model.getAnswerName());
				lInfo.setReadType(model.getReadType());
				lInfo.setSenderContent(model.getSenderContent());
				lInfo.setSenderId(model.getSenderId());
				lInfo.setSenderName(model.getSenderName());
				lInfo.setChatType(model.getChatType());
				lInfo.setContType(model.getContType());
				if(model.getSendTime()!=null)
					lInfo.setSendTime(DateUtils.timestampFormatTime(model.getSendTime()));
				lInfo.setYear(model.getYear());
				
				 List<ChatFile> chatFileList  = chatFileSerivce.findByChatInfoId(model.getChatId());
				lInfo.setChatFileList(chatFileList);
			}
		return lInfo;
		
		}else{
		return null;
		}
	}


	@Override
	public List<ListChatInfo> findByGuideTreacherId(Integer treacherId,
			Integer year, String chatType, List<ListStudentAllotGuide> allotGuideStudentList) {
		List<ListChatInfo> list = new ArrayList<ListChatInfo>(); 
		List<ChatInfo> oldList =  chatInfoDao.findByGuideTreacherId(treacherId,year,chatType,allotGuideStudentList);
		if(oldList!=null){
			for(ChatInfo model :oldList){
				ListChatInfo lInfo = new ListChatInfo();
				lInfo.setChatId(model.getChatId());
				lInfo.setAnswerId(model.getAnswerId());
				lInfo.setAnswerName(model.getAnswerName());
				lInfo.setReadType(model.getReadType());
				lInfo.setSenderContent(model.getSenderContent());
				lInfo.setSenderId(model.getSenderId());
				lInfo.setSenderName(model.getSenderName());
				lInfo.setChatType(model.getChatType());
				lInfo.setContType(model.getContType());
				if(model.getSendTime()!=null)
				lInfo.setSendTime(DateUtils.timestampFormatTime(model.getSendTime()));
				
				lInfo.setYear(model.getYear());
				 List<ChatFile> chatFileList  = chatFileSerivce.findByChatInfoId(model.getChatId());
				lInfo.setChatFileList(chatFileList);
				
				list.add(lInfo);
			}
		}
		return  list; 
	}


	@Override
	public List<ChatInfo> findByAnswerId(Integer answerId,Integer senderId,String chatType, String readType) {
		return chatInfoDao.findByAnswerId(answerId,senderId, chatType, readType);
	}

	/**
	 * 更新消息阅读状态
	 * @param readType
	 */
	@Override
	public void updateReadType(Integer answerId, Integer senderId, String readType) {
		chatInfoDao.updateReadType(answerId,senderId,readType);
	}


	@Override
	public void updateByChatId(Integer chatId, String readType) {
		chatInfoDao.updateByChatId(chatId, readType);
		
	}

	/**
	 *通过教师或学生的ID查询未读的聊天信息数量
	 * @param userId
	 * @return
	 */
	@Override
	public Integer findChatCountByTeacherIdOrStudentId(Integer userId) {
		return chatInfoDao.findChatCountByTeacherIdOrStudentId(userId);
	}


}
