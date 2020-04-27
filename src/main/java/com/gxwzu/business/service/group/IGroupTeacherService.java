package com.gxwzu.business.service.group;

import java.util.List;

import com.gxwzu.business.model.group.GroupTeacher;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.sysVO.ListGroupTeacher;

public interface IGroupTeacherService extends BaseService<GroupTeacher> {
	
	public  GroupTeacher add(GroupTeacher groupTeacher);

	/**
	 * 删除已选教师信息
	 * @return
	 */
	public GroupTeacher del(Integer id);

	/**
	 * 分页查询 老师分组信息
	 * @param model
	 * @param page
	 * @param row
	 * @return
	 */
	public Result<ListGroupTeacher> find(ListGroupTeacher model, int page, int row);

	public List<ListGroupTeacher> findByExample(ListGroupTeacher groupTeacher);

	/**
	 * 查询分组老师 通过 分组Id 老师类型  年度
	 * @param thisGroupId
	 * @param teachType
	 * @param year
	 * @return
	 */
	public List<ListGroupTeacher> findByGroupIdAndTypeAndYear(Integer thisGroupId,
			String teachType, Integer year);

	/**
	 * 查询 已分组的老师信息 通过分组id 老师类型 和年度
	 * @param thisGroupId
	 * @param thisTeacherId
	 * @param thisYear
	 * @return
	 */
	public ListGroupTeacher findByGroupAllotIdAndTeacherIdAndYear(
			Integer thisGroupId, Integer thisTeacherId, Integer thisYear);

	public Integer delByGroupIdAndYear(Integer thisId, Integer year);

	/**
	 * 组已分组的老师信息  老师Id 和年度
	 * @param teacherId
	 * @param thisYear
	 */
	public List<ListGroupTeacher> findByTeacherIdAndYear(Integer teacherId, Integer thisYear);

}
