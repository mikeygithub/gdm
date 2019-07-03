package com.gxwzu.business.dao.chatInfo.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.chatInfo.IChatFileDao;
import com.gxwzu.business.model.chatInfo.ChatFile;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;

@SuppressWarnings("unchecked")
@Repository("chatFileDao")
public class ChatFileDaoImpl extends BaseDaoImpl<ChatFile>implements IChatFileDao {

	@Override
	public Result<ChatFile> find(ChatFile model, int page, int size) {
		String queryString = "from ChatFile model where 1=1";
		int start = (page - 1) * size;
		int limit = size;
		List<Object> params = new ArrayList<Object>();
		
		if(model.getChatInfoId()!=null){
			queryString=queryString+"and model.chatInfoId=?";
			params.add(model.getChatInfoId());
		}
		
		queryString = queryString + " ORDER BY model.chatInfoId DESC";
		return (Result<ChatFile>) super.find(queryString, params.toArray(),null, start, limit);
	}


	@Override
	public List<ChatFile> findByExample(ChatFile model) {
		String queryString = "from ChatFile model where 1=1";
		List<Object> params = new ArrayList<Object>();
		
		if(model.getChatInfoId()!=null){
			queryString=queryString+"and model.chatInfoId=?";
			params.add(model.getChatInfoId());
		}
		queryString = queryString + " ORDER BY model.chatInfoId DESC";
		return super.findByExample(queryString, params.toArray());
	}



}
