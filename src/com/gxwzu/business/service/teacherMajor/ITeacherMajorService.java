package com.gxwzu.business.service.teacherMajor;

import java.util.List;

import com.gxwzu.business.model.teacherMajor.TeacherMajor;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.sysVO.ListTeacherMajor;

public interface ITeacherMajorService extends BaseService<TeacherMajor>{
   /**
     * 查询老师可选专业列表
     * @author 俸捷
     * @Data 2017.07.18
     * @return
     */
	public abstract List<TeacherMajor> findAllTeacherMajorList();
	 /**
     * 查询老师可选专业列表
     * @author 俸捷
     * @Data 2017.07.18
     * @return
     */
	public  Result<ListTeacherMajor> find(TeacherMajor model, int page, int row);
	
	 /**
     * 添加可选专业
     * @author 俸捷
     * @Data 2017.07.18
     * @return
     */
	public  TeacherMajor add(TeacherMajor TeacherMajor);
	 /**
     * 查找可选专业
     * @author 俸捷
     * @Data 2017.07.18
     * @return
     */
	public  TeacherMajor findById(Integer id);
	 /**
     * 修改可选专业
     * @author 俸捷
     * @Data 2017.07.18
     * @return
     */
	public  TeacherMajor edit(TeacherMajor model);
	 /**
     * 删除可选专业
     * @author 俸捷
     * @Data 2017.07.18
     * @return
     */
	public  TeacherMajor del(Integer id);
	
	
	 /**
     * 查找可选专业list
     * @author 
     * @Data 2017.07.19
     * @return
     */
	List<ListTeacherMajor> findByExample(TeacherMajor model);
	
	
	public  List<ListTeacherMajor> findByTeacherId(Integer teacherId);
	/**
	 * 查询老师所带专业
	 * @param majorId
	 * @return
	 */
	public abstract List<ListTeacherMajor> findByMajorId(Integer majorId);
	
	
	
	
}
