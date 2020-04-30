package com.gxwzu.business.dao.chatInfo;

import java.util.List;

import com.gxwzu.business.model.chatInfo.ChatInfo;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListChatInfo;
import com.gxwzu.sysVO.ListStudentAllotGuide;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.util.R;

public interface IChatInfoDao extends BaseDao<ChatInfo> {
	
	Result<ChatInfo> find(ChatInfo model, int page, int size);

	List<ChatInfo> findNewChatMessage(UserHelp userHelp);

    void updateReadGroupChatStatus(String groupId, String answerId);

	void updateReadSingleChatStatus(String sendId, String answerId);

	List<ChatInfo> findNewGroupChatMessage(UserHelp userHelp);

    R findGroupChatLog(Integer id, int curr, int limit);

    R findFriendChatLog(Integer id,Integer answerId, int curr, int limit);

}