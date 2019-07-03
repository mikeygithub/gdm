package com.gxwzu.business.dao.score;

import java.util.List;

import com.gxwzu.business.model.score.ScoreItemGroup;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;

/**
 * 评分项目分组DAO
 * @author he
 *
 */
public interface IScoreItemGroupDao extends BaseDao<ScoreItemGroup> {
	
	public Result<ScoreItemGroup> find(ScoreItemGroup model, int page, int size);

	public List<ScoreItemGroup> findByExample(ScoreItemGroup model);
}
