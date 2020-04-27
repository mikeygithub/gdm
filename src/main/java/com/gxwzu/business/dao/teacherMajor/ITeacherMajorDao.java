package com.gxwzu.business.dao.teacherMajor;

import java.util.List;

import com.gxwzu.business.model.teacherMajor.TeacherMajor;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;

public interface ITeacherMajorDao extends BaseDao<TeacherMajor>{
	 /**
     * 查询老师所带专业列表
     * @author 俸捷
     * @Data 2017.07.18
     * @return
     */
	List<TeacherMajor> findAllTeacherMajorList();
	 /**
     * 按ID查询老师所带专业列表
     * @author 俸捷
     * @Data 2017.07.18
     * @return
     */
	TeacherMajor findById(Integer id);
	 /**
     * 分页查找所带专业
     * @author 俸捷
     * @Data 2017.07.18
     * @return
     */
	Result<Object> find(TeacherMajor model, int page, int row);
	
	 /**
     * 查找所带专业list
     * @author 
     * @Data 2017.07.19
     * @return
     */
	List<Object> findByExample(TeacherMajor model);

}
