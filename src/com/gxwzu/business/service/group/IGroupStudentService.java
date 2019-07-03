package com.gxwzu.business.service.group;

import java.util.List;

import com.gxwzu.business.model.group.GroupStudent;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.sysVO.ListGroupAllot;
import com.gxwzu.sysVO.ListGroupStudent;
import com.gxwzu.sysVO.ListStudent;

public interface IGroupStudentService extends BaseService<GroupStudent>{

	/**
	 * 查询可分组学生
	 *  条件 1未分配分组学生
	 *  条件 2该组答辩方向一致
	 *  条件 3指导教师不为该组成员的学生
	 * @param listGroupStudent
	 * @param groupAllot（条件 2，条件 3）
	 * @return
	 */
	Result<ListGroupStudent> find(ListGroupStudent listGroupStudent,ListGroupAllot groupAllot,int page, int row);

	GroupStudent add(GroupStudent groupStudent);

	/**
	 * 查看学生分组列表
	 * @author 黎艺侠
	 */
	Result<ListGroupStudent> findStuGroupList(ListGroupStudent model,int page, int row);

	List<ListGroupStudent> findByExample(ListGroupStudent model);
	
	public void del(Integer thisId);

	/**
	 * 查询分组学生信息 通过学生Id 可年度
	 * @param thisStuId
	 * @param thisYear
	 */
	ListGroupStudent findByStuIdAndYear(Integer thisStuId, Integer thisYear);

	public Integer delByGroupIdAndYear(Integer thisId, Integer year);

	/**
	 * 查询分组学生信息 通过组Id 可年度
	 * @param groupAllotId
	 * @param year
	 * @param size 
	 * @param page 
	 * @return
	 */
	Result<ListGroupStudent> findByGroupAllotIdAndYear(Integer groupAllotId,
			Integer year, int page, int size);
	
	/**
	 * 查询分组已分配评阅的学生信息 通过组Id 老师Id 可年度
	 * @param groupAllotId
	 * @param year
	 * @param size 
	 * @param page 
	 * @return
	 */
	Result<ListGroupStudent> findByGroupAllotIdAndDefenseTeacherIdAndYear(
			Integer groupAllotId, Integer teacherId, Integer year, int page,
			int size);

	/**
	 * 自动更新分组分配指导老师
	 */
	void updateAutoAllotTeacher(ListGroupAllot groupAllot);


}
