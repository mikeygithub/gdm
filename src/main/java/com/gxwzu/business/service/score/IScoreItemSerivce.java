package com.gxwzu.business.service.score;

import java.util.List;

import com.gxwzu.business.model.score.ScoreItem;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;

public interface IScoreItemSerivce extends BaseService<ScoreItem> {

	public Result<ScoreItem> find(ScoreItem model, int page, int size);

	public List<ScoreItem> findByExample(ScoreItem model);
	
	public ScoreItem findById(Integer id);
	
	public ScoreItem addOrEdit(ScoreItem model);

	public void del(Integer id);
}
