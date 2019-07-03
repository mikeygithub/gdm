package com.gxwzu.system.service.sysTeacher;

import java.util.List;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.sysVO.ListTeacher;
import com.gxwzu.system.model.sysTeacher.SysTeacher;
import com.gxwzu.system.model.userHelp.UserHelp;

public interface ISysTeacherService extends BaseService<SysTeacher> {

	public  Result<ListTeacher> find(SysTeacher model, int page, int row);

	public  SysTeacher add(SysTeacher sysTeacher,UserHelp userHelp);
	
	public  SysTeacher findById(Integer id);
	
	public  SysTeacher edit(SysTeacher model,UserHelp userHelp);

	public  SysTeacher del(Integer id);

	
	public  List<ListTeacher> findByExample(SysTeacher model);
  /**
   * 查询指导老师通过老师职工号
   * @author 何金燕
   * @date 2017.7.15
   * @param teacherId
   */
	public  ListTeacher findByTeacherNo(String teacherNO);
    /**
     * 
     * @param thisDeptNumble
     * @return
     */
    public List<SysTeacher> findByDeptNumber(String thisDeptNumble);

	public ListTeacher findModelById(Integer teacherId);

	
}