package com.gxwzu.business.dao.chatInfo;

import java.util.List;

import com.gxwzu.business.model.chatInfo.ChatFile;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;

public interface IChatFileDao extends BaseDao<ChatFile> {

	public Result<ChatFile> find(ChatFile model, int page, int size);

	public List<ChatFile> findByExample(ChatFile model);

}
