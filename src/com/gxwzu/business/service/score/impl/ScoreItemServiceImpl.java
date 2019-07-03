package com.gxwzu.business.service.score.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.score.IScoreItemDao;
import com.gxwzu.business.model.score.ScoreItem;
import com.gxwzu.business.service.score.IScoreItemSerivce;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;

@Service("ScoreItemService")
public class ScoreItemServiceImpl extends BaseServiceImpl<ScoreItem> implements IScoreItemSerivce{
    @Autowired
    private IScoreItemDao ScoreItemDao;
    
    public BaseDao<ScoreItem> getDao() {
		return this.ScoreItemDao;
	}

	@Override
	public ScoreItem addOrEdit(ScoreItem model) {
		
		
		return ScoreItemDao.saveOrUpdate(model);
	}


	@Override
	public Result<ScoreItem> find(ScoreItem model, int page, int size) {
		 return ScoreItemDao.find(model, page, size);
	}


	@Override
	public List<ScoreItem> findByExample(ScoreItem model) {
		return ScoreItemDao.findByExample(model);
	}


	@Override
	public ScoreItem findById(Integer id) {
		return ScoreItemDao.get(ScoreItem.class, id);
	}

	@Override
	public void del(Integer id) {
		remove(ScoreItem.class,id);
	}

}
