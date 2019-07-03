package com.gxwzu.business.service.chatInfo;

import java.util.List;

import com.gxwzu.business.model.chatInfo.ChatInfo;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.sysVO.ListChatInfo;
import com.gxwzu.sysVO.ListStudentAllotGuide;

public interface IChatInfoSerivce extends BaseService<ChatInfo> {

	public ChatInfo add(ChatInfo model);

	/**
	 * 查询个人聊天记录 通过当前用户id 和 被回复人ID
	 * 
	 * @param userId
	 *            当前用户id
	 * @param answerId
	 *            被回复人ID
	 * @return
	 */
	public List<ListChatInfo> findByUserIdAndAnswerId(Integer userId,
			Integer answerId,String chatType);

	/**
	 * 查询聊天记录视图 实体 
	 * 
	 * @param chatId
	 *            聊天记录id
	 * @return
	 */
	public ListChatInfo findViewModelById(Integer chatId);

	/**
	 * 查询当前指导老师所带学生的所有聊天记录  通过当前用户id 和 被回复人ID
	 * @param treacherId
	 * @param chatType 
	 * @param allotGuideStudentList 
	 * @return
	 */
	public List<ListChatInfo> findByGuideTreacherId(Integer treacherId,Integer year, String chatType, 
			List<ListStudentAllotGuide> allotGuideStudentList);

	public List<ChatInfo> findByAnswerId(Integer answerId, Integer senderId, String chatType, String readType);

	
	/**
	 * 更新消息阅读状态
	 * @param readType 
	 * @param readType
	 */
	public void updateReadType(Integer answerId, Integer senderId, String readType);

	public void updateByChatId(Integer chatId, String readType);


}
