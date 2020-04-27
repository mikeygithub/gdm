package com.gxwzu.business.dao.teacherDirection;

import java.util.List;

import com.gxwzu.business.model.teacherDirections.TeacherDirections;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;

public interface ITeacherDirectionsDao extends BaseDao<TeacherDirections>{

	/**
     * 查询研究方向列表
     * @author 韦东连
     * @Data 2017.08.02
     * @return
     */
	List<TeacherDirections> findAllTeacherDirectionsList();
	
	/**
     * 查询研究方向列表
     * @author 韦东连
     * @Data 2017.08.02
     * @return
     */
	Result<Object> find(TeacherDirections model, int page, int row);

	/**
     * 查找研究方向list
     * @author wdl
     * @Data 2017.08.13
     * @return
     */
	List<Object> findByExample(TeacherDirections model);

	TeacherDirections findById(Integer thisId);


}
