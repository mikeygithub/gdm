package com.gxwzu.system.dao.sysStudent;

import java.util.List;

import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListGroupAllotExport;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.sysVO.ListStudentAllotGuide;
import com.gxwzu.system.model.sysStudent.SysStudent;

public interface ISysStudentDao extends BaseDao<SysStudent>{

	public Result<Object> find(SysStudent model, int page, int row);

	public SysStudent findById(Integer id);

	/**
	 * 通过stuNo查找
	 * @return
	 */
	public ListStudent findByStuNo(String stuNo);

	public List<Object> findByExample(SysStudent model);
	/**
	   * 检查学号和姓名是否存在
	   * @author hjy
	   * @date 2017.7.31
	   * @param student
	   * @return
	   */
	public List<SysStudent> findByStuIdAndStuName(SysStudent student);

	public SysStudent findByStuId(Integer stuId);

	public List<SysStudent> findByMajorId(Integer majorId);

	public List<Object> findGroupAllotByStuId();

}
