package com.gxwzu.business.dao.group;

import java.util.List;

import com.gxwzu.business.model.group.GroupDefenseDirection;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
/**
 * 分组答辩方向
 * @author he
 *
 */
public interface IGroupDefenseDirectionDao extends BaseDao<GroupDefenseDirection>{

	public Result<Object> find(GroupDefenseDirection model, int page, int row);

	public List<Object> findByExample(GroupDefenseDirection model);

	/**
	 * 查询 选择某组时 各专业学生人数
	 * @param groupAllotId 组id
	 * @param year 年度
	 * @return
	 */
	public List<Object> findMajorCountByGroupIdAndYear(Integer groupAllotId, Integer year); 
	
	public Integer delByGroupIdAndYear(Integer thisId, Integer year);

}
