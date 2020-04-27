package com.gxwzu.business.service.group;

import java.util.List;

import com.gxwzu.business.model.group.GroupDefenseDirection;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.sysVO.ListGroupDefenseDirection;

public interface IGroupDefenseDirectionService extends BaseService<GroupDefenseDirection>{

	Result<ListGroupDefenseDirection> find(GroupDefenseDirection model, int page,int row);

	GroupDefenseDirection add(GroupDefenseDirection model);

	List<ListGroupDefenseDirection> findByExample(GroupDefenseDirection model);
	
	public void del(Integer thisId);
	/**
	 * 查询 选择某组时 各专业学生人数
	 * @param groupAllotId 组id
	 * @param year 年度
	 * @return
	 */
	public List<ListGroupDefenseDirection> findMajorCountByGroupIdAndYear(Integer groupAllotId, Integer year); 

	 public Integer delByGroupIdAndYear(Integer thisId, Integer year);

}
