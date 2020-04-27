package com.gxwzu.business.service.chatInfo.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.chatInfo.IChatFileDao;
import com.gxwzu.business.model.chatInfo.ChatFile;
import com.gxwzu.business.service.chatInfo.IChatFileService;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.service.impl.BaseServiceImpl;

@Service("chatFileService")
public class ChatFileServiceImpl extends BaseServiceImpl<ChatFile> implements IChatFileService {
    @Autowired
    private IChatFileDao chatFileDao;
    
    public BaseDao<ChatFile> getDao() {
		return this.chatFileDao;
	}

	@Override
	public ChatFile add(ChatFile model) {
		return chatFileDao.saveOrUpdate(model);
	}

	@Override
	public List<ChatFile> findByChatInfoId(Integer chatInfoId) {
		ChatFile model = new ChatFile();
		if(chatInfoId!=null){
			model.setChatInfoId(chatInfoId);
			return chatFileDao.findByExample(model);
		}else{
			return null;
		}
	}

}
