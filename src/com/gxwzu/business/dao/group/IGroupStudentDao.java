package com.gxwzu.business.dao.group;

import java.util.List;

import com.gxwzu.business.model.group.GroupStudent;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListGroupAllot;
import com.gxwzu.sysVO.ListGroupStudent;

public interface IGroupStudentDao extends BaseDao<GroupStudent>{

	Result<Object> find(ListGroupStudent model, ListGroupAllot groupAllot,int page, int row);


	Result<Object> findStuGroupList(ListGroupStudent model, int page, int row);
	
	List<Object> findByExample(ListGroupStudent model);


	GroupStudent findByStuId(Integer stuId);


	Integer delByGroupIdAndYear(Integer thisId, Integer year);


}
