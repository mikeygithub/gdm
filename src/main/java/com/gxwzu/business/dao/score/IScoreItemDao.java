package com.gxwzu.business.dao.score;

import java.util.List;

import com.gxwzu.business.model.score.ScoreItem;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;

/**
 * 评分项目DAO
 * @author he
 *
 */
public interface IScoreItemDao extends BaseDao<ScoreItem> {
	
	public Result<ScoreItem> find(ScoreItem model, int page, int size);

	public List<ScoreItem> findByExample(ScoreItem model);
}
