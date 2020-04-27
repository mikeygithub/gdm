package com.gxwzu.business.dao.score.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.score.IScoreItemDao;
import com.gxwzu.business.model.score.ScoreItem;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;

@SuppressWarnings("unchecked")
@Repository("ScoreItemDao")
public class ScoreItemDaoImpl extends BaseDaoImpl<ScoreItem>implements IScoreItemDao {

	@Override
	public Result<ScoreItem> find(ScoreItem model, int page, int size) {
		StringBuffer queryString = new StringBuffer("FROM ScoreItem model where 1=1 ");
		int start = (page - 1) * size;
		int limit = size;
		List<Object> params = new ArrayList<Object>();
		if(StringUtils.isNotEmpty(model.getItemGroupNo())){
			queryString.append("and model.itemGroupNo=?");
			params.add(model.getItemGroupNo());
		}
		if(StringUtils.isNotEmpty(model.getItemType())){
			queryString.append("and model.itemType=?");
			params.add(model.getItemType());
		}
		if(model.getYear()!=null){
			queryString.append("and model.year=?");
			params.add(model.getYear());
		}
		queryString.append(" ORDER BY model.itemType,model.itemGroupNo,model.weight asc");
		
		return super.find(queryString.toString(), params.toArray(), null, start, limit);
	}


	@Override
	public List<ScoreItem> findByExample(ScoreItem model) {
		StringBuffer queryString = new StringBuffer("FROM ScoreItem model where 1=1 ");

		List<Object> params = new ArrayList<Object>();
		if(model.getScoreItemId()!=null){
			queryString.append("and model.scoreItemId=?");
			params.add(model.getScoreItemId());
		}

		if(StringUtils.isNotEmpty(model.getItemGroupNo())){
			queryString.append("and model.itemGroupNo=?");
			params.add(model.getItemGroupNo());
		}
		if(StringUtils.isNotEmpty(model.getItemType())){
			queryString.append("and model.itemType=?");
			params.add(model.getItemType());
		}
		if(model.getYear()!=null){
			queryString.append("and model.year=?");
			params.add(model.getYear());
		}
		queryString.append(" ORDER BY model.itemType,model.itemGroupNo,model.weight asc");
		
		return super.findByExample(queryString.toString(),params.toArray() );
	}

}
