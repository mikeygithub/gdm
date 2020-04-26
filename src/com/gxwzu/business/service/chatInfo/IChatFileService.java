package com.gxwzu.business.service.chatInfo;

import java.util.List;

import com.gxwzu.business.model.chatInfo.ChatFile;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.sysVO.ListChatInfo;

public interface IChatFileService extends BaseService<ChatFile> {

	public ChatFile add(ChatFile model);
	/**
	 * 查询 聊天文件信息
	 * 
	 * @param chatInfoId
	 *            聊天信息Id
	 * @return
	 */
	public List<ChatFile> findByChatInfoId(Integer chatInfoId);
	
	
	
}
