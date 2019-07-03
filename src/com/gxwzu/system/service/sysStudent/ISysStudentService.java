package com.gxwzu.system.service.sysStudent;

import java.util.List;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.sysVO.ListGroupAllotExport;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.system.model.sysStudent.SysStudent;
import com.gxwzu.system.model.userHelp.UserHelp;

public interface ISysStudentService extends BaseService<SysStudent> {

	public Result<ListStudent> find(SysStudent model, int page, int row);

	public SysStudent add(SysStudent sysStudent,UserHelp userHelp);

	public SysStudent findById(Integer id);

	public SysStudent edit(SysStudent sysStudent,UserHelp userHelp);

	public SysStudent del(Integer id);

	/**
	 * 通过stuNo查找
	 * @return
	 */
	public ListStudent findByStuNo(String stuNo);

	public ListStudent findViewModelById(Integer id);
	
	public List<ListStudent> findByExample(SysStudent model);
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

	public List<ListGroupAllotExport> findGroupAllotByStuId();

}
