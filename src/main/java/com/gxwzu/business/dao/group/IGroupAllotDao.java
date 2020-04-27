package com.gxwzu.business.dao.group;

import java.util.List;

import com.gxwzu.business.model.group.GroupAllot;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;

public interface IGroupAllotDao extends BaseDao<GroupAllot>{

	public GroupAllot findById(Integer id);
	/**
	 * 查看分组列表
	 * @return
	 */
	public Result<Object> find(GroupAllot model, int page, int row);
	  /**
     * 查询分组列表
     * @author 俸捷
     * @return
     */
	public List<GroupAllot> finAllGroupAllotList();

	public List<Object> findByExample(GroupAllot model);
	


}
