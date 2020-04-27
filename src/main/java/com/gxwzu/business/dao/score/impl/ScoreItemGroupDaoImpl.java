package com.gxwzu.business.dao.score.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.score.IScoreItemGroupDao;
import com.gxwzu.business.model.score.ScoreItemGroup;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;

@SuppressWarnings("unchecked")
@Repository("scoreItemGroupDao")
public class ScoreItemGroupDaoImpl extends BaseDaoImpl<ScoreItemGroup>implements IScoreItemGroupDao {

	@Override
	public Result<ScoreItemGroup> find(ScoreItemGroup model, int page, int size) {
		StringBuffer queryString = new StringBuffer("FROM ScoreItemGroup model where 1=1 ");
		int start = (page - 1) * size;
		int limit = size;
		List<Object> params = new ArrayList<Object>();
		queryString.append(" ORDER BY model.taskId DESC");
		if(StringUtils.isNotEmpty(model.getGroupType())){
			queryString.append("and model.groupType=?");
			params.add(model.getGroupType());
		}
		queryString.append(" ORDER BY model.groupType,model.weight asc");
		
		return super.find(queryString.toString(), params.toArray(), null, start, limit);
	}


	@Override
	public List<ScoreItemGroup> findByExample(ScoreItemGroup model) {
		StringBuffer queryString = new StringBuffer("FROM ScoreItemGroup model where 1=1 ");

		List<Object> params = new ArrayList<Object>();
		if(model.getItemGroupId()!=null){
			queryString.append("and model.itemGroupId=?");
			params.add(model.getItemGroupId());
		}

		if(StringUtils.isNotEmpty(model.getGroupNo())){
			queryString.append("and model.groupNo=?");
			params.add(model.getGroupNo());
		}
		if(StringUtils.isNotEmpty(model.getGroupType())){
			queryString.append("and model.groupType=?");
			params.add(model.getGroupType());
		}
		
		queryString.append(" ORDER BY model.groupType,model.weight asc");
		
		return super.findByExample(queryString.toString(),params.toArray() );
	}

}
