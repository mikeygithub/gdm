package com.gxwzu.business.service.materialInfo;

import java.util.List;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListGroupStudent;
import com.gxwzu.sysVO.MaterialInfo;

public interface IMaterialInfoSerivce {

	public Result<MaterialInfo> find(MaterialInfo model, int page, int size);

	public List<MaterialInfo> findByExample(MaterialInfo model);

	public MaterialInfo findByStuIdAndYear(Integer thisStuId, Integer thisYear);

	/**
	 * 查询指导老师所带的 学生材料信息
	 * @param teacherId
	 * @param year
	 * @return
	 */
	public List<MaterialInfo> findGuideStudent(Integer teacherId,Integer year);

	/**
	 * 查询老师所在组学生信息
	 * @param groupAllotId
	 * @param year
	 * @param page
	 * @param size
	 * @return
	 */
	public Result<MaterialInfo> findGroupStudent(Integer groupAllotId,String groupType, Integer year,int page, int size);

	/**
	 * 查询老师所在组已分配评阅的学生信息
	 * @param groupAllotId
	 * @param teacherId
	 * @param year
	 * @param page
	 * @param size
	 * @return
	 */
	public Result<MaterialInfo> findGroupDefenseStudent(Integer groupAllotId,
			Integer teacherId, Integer year, int page, int size);

}
