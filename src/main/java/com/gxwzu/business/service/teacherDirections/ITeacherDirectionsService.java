package com.gxwzu.business.service.teacherDirections;

import java.util.List;

import com.gxwzu.business.model.teacherDirections.TeacherDirections;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.sysVO.ListTeacherDirections;

public interface ITeacherDirectionsService extends BaseService<TeacherDirections>{

	 /**
     * 查询研究方向列表
     * @author 韦东连
     * @Data 2017.08.02
     * @return
     */
	public abstract List<TeacherDirections> findAllTeacherDirectionsList();
	
	 /**
     * 查询研究方向列表
     * @author 韦东连
     * @Data 2017.08.02
     * @return
     */
	public Result<ListTeacherDirections> find(TeacherDirections model, int page,int row );
	
	/**
     * 查找研究方向list
     * @author wdl
     * @Data 2017.08.13
     * @return
     */
	List<ListTeacherDirections> findByExample(TeacherDirections model);

	public  TeacherDirections add(TeacherDirections model);

	public  void del(Integer thisId)
	;
	public  TeacherDirections findById(Integer thisId);

	public  List<ListTeacherDirections> findByTeacherId(Integer teacherId);
	
	
}
