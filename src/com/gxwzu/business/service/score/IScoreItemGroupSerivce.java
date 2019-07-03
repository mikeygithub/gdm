package com.gxwzu.business.service.score;

import java.util.List;

import com.gxwzu.business.model.score.ScoreItemGroup;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.sysVO.ListScoreItemGroup;

public interface IScoreItemGroupSerivce extends BaseService<ScoreItemGroup> {

	public Result<ListScoreItemGroup> find(ScoreItemGroup model, int page, int size);

	public List<ListScoreItemGroup> findByExample(ScoreItemGroup model);
	
	public List<ListScoreItemGroup> findByGroupType(String groupType);
	
	public ScoreItemGroup findById(Integer id);
	
	public ScoreItemGroup addOrEdit(ScoreItemGroup model);

	public void del(Integer id);
}
