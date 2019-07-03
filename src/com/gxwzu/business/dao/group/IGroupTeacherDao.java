package com.gxwzu.business.dao.group;

import java.util.List;

import com.gxwzu.business.model.group.GroupTeacher;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListGroupTeacher;

public interface IGroupTeacherDao extends BaseDao<GroupTeacher>{

	public GroupTeacher findById(Integer id);
	/**
	 *分页查询 老师分组信息
	 * @param model
	 * @param page
	 * @param size
	 * @return
	 */
	public Result<Object> find(ListGroupTeacher model, int page, int size);
	
	public List<Object> findByExample(ListGroupTeacher model);
	
	public Integer delByGroupIdAndYear(Integer thisId, Integer year);



}
