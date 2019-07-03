package com.gxwzu.system.service.sysStudent.impl;

import java.util.ArrayList;
import java.util.List;

import com.gxwzu.system.model.userRole.UserRoleEntity;
import com.gxwzu.system.service.sysRole.ISysRoleService;
import com.gxwzu.system.service.userRole.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.model.review.Review;
import com.gxwzu.business.service.allotGuide.IAllotGuideService;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.sysVO.ListGroupAllotExport;
import com.gxwzu.sysVO.ListReview;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.sysVO.ListTeacher;
import com.gxwzu.system.dao.sysStudent.ISysStudentDao;
import com.gxwzu.system.model.sysStudent.SysStudent;
import com.gxwzu.system.model.sysTeacher.SysTeacher;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.system.service.sysStudent.ISysStudentService;
import com.gxwzu.system.service.userHelp.IUserHelpService;

@Service("sysStudentService")
public class SysStudentServiceImpl extends BaseServiceImpl<SysStudent> implements ISysStudentService{

	@Autowired
	private ISysStudentDao sysStudentDao;
	@Autowired
	private IUserHelpService userHelpService;
	@Autowired
	private IAllotGuideService allotGuideService;              //指导老师分配接口

	@Autowired
	private UserRoleService userRoleService;//对应角色

	public BaseDao<SysStudent> getDao() {
		return this.sysStudentDao;
	}
	
	/**
	 * 学生信息显示列表
	 * @return
	 */
	@Override
	public Result<ListStudent> find(SysStudent model, int page, int row) {
		Result<Object> oldResult = sysStudentDao.find(model, page, row);
		Result<ListStudent> newResult = new Result<ListStudent>();
		List<ListStudent> newList = new ArrayList<ListStudent>();
		if (oldResult != null && oldResult.getData() != null
				&& oldResult.getData().size() != 0) {

			for (Object object : oldResult.getData()) {
				Object[] o = (Object[]) object;
				newList.add(new ListStudent(o));
			}
		}
		newResult.setData(newList);
		newResult.setOffset(oldResult.getOffset());
		newResult.setPage(oldResult.getPage());
		newResult.setSize(oldResult.getSize());
		newResult.setTotal(oldResult.getTotal());
		newResult.setTotalPage(oldResult.getTotalPage());
		return newResult;
	}

	/**
	 * 添加学生信息
	 * @return
	 */
	@Override
	public SysStudent add(SysStudent model,UserHelp userHelp) {
		
		UserHelp u = new UserHelp();
		u.setLoginName(model.getStuNo());
		u.setUserName(model.getStuName());
		u.setPassword(model.getStuNo());
		if(userHelp!=null){
			if(userHelp.getUserSex()!=null)
				u.setUserSex(userHelp.getUserSex());
			if(userHelp.getUserAge()!=null)
				u.setUserAge(userHelp.getUserAge());
				if(userHelp.getUserEmail()!=null)
				u.setUserEmail(userHelp.getUserEmail());
				if(userHelp.getUserTel()!=null)
				u.setUserTel(userHelp.getUserTel());
				
		}
		u.setUserType("1");  //用户类型 1-学生 2-老师
		u =  userHelpService.add(u);
		model.setUserId(u.getId());

		UserRoleEntity userRoleEntity = new UserRoleEntity();
		userRoleEntity.setRoleId(24);//TODO:暂时写死
		userRoleEntity.setUserHelpId(u.getId());

		userRoleService.save(userRoleEntity);

		return sysStudentDao.save(model);
	}

	/**
	 * 通过id查找
	 * @return
	 */
	@Override
	public SysStudent findById(Integer id) {
		return sysStudentDao.findById(id);
	}

	/**
	 * 修改学生信息
	 * @return
	 */
	@Override
	public SysStudent edit(SysStudent model,UserHelp userHelp) {
		UserHelp u = userHelpService.findById(model.getUserId());
		if(model.getStuName()!=null){
		  u.setUserName(model.getStuName());
		}
		if(userHelp!=null){
			if(userHelp.getUserAge()!=null)
			u.setUserAge(userHelp.getUserAge());
			if(userHelp.getUserEmail()!=null)
			u.setUserEmail(userHelp.getUserEmail());
			if(userHelp.getUserTel()!=null)
			u.setUserTel(userHelp.getUserTel());
			if(userHelp.getPassword()!=null)
				u.setPassword(userHelp.getPassword());
			}
		userHelpService.update(u);
		sysStudentDao.update(model);
		return model;
    	
	}

	/**
	 * 删除学生信息
	 * @return
	 */
	@Override
	public SysStudent del(Integer id) {
		SysStudent model = sysStudentDao.findById(id);
		userHelpService.del(model.getUserId());
		sysStudentDao.remove(model);
		return model;
	}

	/**
	 * 通过stuId查询学生信息
	 * @return
	 */
	@Override
	public ListStudent findByStuNo(String stuNo) {
		return sysStudentDao.findByStuNo(stuNo);
	}

	@Override
	public List<ListStudent> findByExample(SysStudent model) {
		List<Object> oldList = sysStudentDao.findByExample(model);
		List<ListStudent> newList = new ArrayList<ListStudent>();
		if (oldList != null && oldList.size() != 0)
			for (Object object : oldList) {
				Object[] o = (Object[]) object;
				newList.add(new ListStudent(o));
			}
		return newList;
	}
	/**
	   * 检查学号和姓名是否存在
	   * @author hjy
	   * @date 2017.7.31
	   * @param student
	   * @return
	   */
	@Override
	public List<SysStudent> findByStuIdAndStuName(SysStudent student) {
		return sysStudentDao.findByStuIdAndStuName(student);
	}

	@Override
	public ListStudent findViewModelById(Integer id) {
		SysStudent model = new SysStudent();
		model.setStuId(id);
		List<ListStudent> list = findByExample(model);
		if(list==null||list.size()<=0)
			return null;
		else{
			return list.get(0);
		}
	}

	@Override
	public SysStudent findByStuId(Integer stuId) {
		return sysStudentDao.findByStuId(stuId);
	}

	@Override
	public List<SysStudent> findByMajorId(Integer majorId) {
		return sysStudentDao.findByMajorId(majorId);
	}

	@Override
	public List<ListGroupAllotExport> findGroupAllotByStuId() {
		List<Object> oldList = sysStudentDao.findGroupAllotByStuId();
		
		
		List<ListGroupAllotExport> newList = new ArrayList<ListGroupAllotExport>();
		if (oldList != null && oldList.size() != 0)
			for (Object object : oldList) {
				Object[] o = (Object[]) object;
				newList.add(new ListGroupAllotExport(o));
			}
		for (int i = 0; i < oldList.size(); i++) {
			System.out.println(newList.get(i).getStuNo()+","+newList.get(i).getStuName()+","+newList.get(i).getClassroomName()
					+","+newList.get(i).getGroupTeacherNames());
		}
		return newList;
	}

}
