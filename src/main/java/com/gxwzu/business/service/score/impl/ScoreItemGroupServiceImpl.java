package com.gxwzu.business.service.score.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.score.IScoreItemDao;
import com.gxwzu.business.dao.score.IScoreItemGroupDao;
import com.gxwzu.business.model.score.ScoreItem;
import com.gxwzu.business.model.score.ScoreItemGroup;
import com.gxwzu.business.service.score.IScoreItemGroupSerivce;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.sysVO.ListScoreItemGroup;

@Service("scoreItemGroupService")
public class ScoreItemGroupServiceImpl extends BaseServiceImpl<ScoreItemGroup> implements IScoreItemGroupSerivce{
    @Autowired
    private IScoreItemGroupDao scoreItemGroupDao;
    @Autowired
    private IScoreItemDao scoreItemDao;
    
    public BaseDao<ScoreItemGroup> getDao() {
		return this.scoreItemGroupDao;
	}

	@Override
	public ScoreItemGroup addOrEdit(ScoreItemGroup model) {
		return scoreItemGroupDao.saveOrUpdate(model);
	}


	@Override
	public Result<ListScoreItemGroup> find(ScoreItemGroup model, int page, int size) {
		Result<ScoreItemGroup> oldResult = scoreItemGroupDao.find(model, page, size);
		Result<ListScoreItemGroup> newResult = new Result<ListScoreItemGroup>();
		List<ListScoreItemGroup> newList = new ArrayList<ListScoreItemGroup>();
		
		if (oldResult != null && oldResult.getData() != null
				&& oldResult.getData().size() != 0) {

			for (ScoreItemGroup m : oldResult.getData()) {
				ListScoreItemGroup newModel =new  ListScoreItemGroup();
				ScoreItem scoreItem  = new ScoreItem();
				scoreItem.setItemGroupNo(m.getGroupNo());
				List<ScoreItem> scoreItemList =  scoreItemDao.findByExample(scoreItem);
				
				newModel.setItemGroupId(m.getItemGroupId());
				newModel.setGroupNo(m.getGroupNo());
				newModel.setGroupName(m.getGroupName());
				newModel.setGroupType(m.getGroupType());
				newModel.setGroupPercent(m.getGroupPercent());
				newModel.setWeight(m.getWeight());
				newModel.setScoreItemList(scoreItemList);
				newList.add(newModel);
			}
		}
		newResult.setData(newList);
		newResult.setOffset(oldResult.getOffset());
		newResult.setPage(oldResult.getPage());
		newResult.setSize(oldResult.getSize());
		newResult.setTotal(oldResult.getTotal());
		newResult.setTotalPage(oldResult.getTotalPage());
		return newResult;
	}


	@Override
	public List<ListScoreItemGroup> findByExample(ScoreItemGroup model) {
		List<ScoreItemGroup> oldList = scoreItemGroupDao.findByExample(model);
		List<ListScoreItemGroup> newList = new ArrayList<ListScoreItemGroup>();
		
		if (oldList != null && oldList.size() != 0){
			
			for (ScoreItemGroup m : oldList) {
				ListScoreItemGroup newModel =new  ListScoreItemGroup();
				ScoreItem scoreItem  = new ScoreItem();
				scoreItem.setItemGroupNo(m.getGroupNo());
				List<ScoreItem> scoreItemList =  scoreItemDao.findByExample(scoreItem);
				newModel.setItemGroupId(m.getItemGroupId());
				newModel.setGroupNo(m.getGroupNo());
				newModel.setGroupName(m.getGroupName());
				newModel.setGroupType(m.getGroupType());
				newModel.setGroupPercent(m.getGroupPercent());
				newModel.setWeight(m.getWeight());
				newModel.setTotalCount(scoreItemList.size());
				newModel.setScoreItemList(scoreItemList);
				newList.add(newModel);
			}
		}
		return newList;
	}


	@Override
	public ScoreItemGroup findById(Integer id) {
		return scoreItemGroupDao.get(ScoreItemGroup.class, id);
	}

	@Override
	public void del(Integer id) {
		remove(ScoreItemGroup.class,id);
	}

	@Override
	public List<ListScoreItemGroup> findByGroupType(String groupType) {
		ScoreItemGroup model = new ScoreItemGroup();
		model.setGroupType(groupType);
		return findByExample(model);
	}
}
