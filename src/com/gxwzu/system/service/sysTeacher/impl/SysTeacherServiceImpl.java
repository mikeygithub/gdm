package com.gxwzu.system.service.sysTeacher.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.service.teacherDirections.ITeacherDirectionsService;
import com.gxwzu.business.service.teacherMajor.ITeacherMajorService;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.sysVO.ListTeacher;
import com.gxwzu.sysVO.ListTeacherDirections;
import com.gxwzu.sysVO.ListTeacherMajor;
import com.gxwzu.system.dao.sysTeacher.ISysTeacherDao;
import com.gxwzu.system.model.sysTeacher.SysTeacher;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.gxwzu.system.service.userHelp.IUserHelpService;

@Service("sysTeacherService")
public class SysTeacherServiceImpl extends BaseServiceImpl<SysTeacher>
		implements ISysTeacherService {

	@Autowired
	private ISysTeacherDao sysTeacherDao;

	@Autowired
	private IUserHelpService userHelpService;
	@Autowired
	private ITeacherMajorService teacherMajorService; // 老师专业接口
	@Autowired
	private ITeacherDirectionsService teacherDirectionsService; // 老师研究方向接口

	@Override
	public BaseDao<SysTeacher> getDao() {
		return this.sysTeacherDao;
	}

	@Override
	public SysTeacher add(SysTeacher model, UserHelp userHelp) {
		UserHelp u = new UserHelp();
		u.setLoginName(model.getTeacherNo());
		u.setUserName(model.getTeacherName());
		u.setPassword(model.getTeacherNo());
		if (userHelp != null) {
			if (userHelp.getUserSex() != null)
				u.setUserSex(userHelp.getUserSex());
			if (userHelp.getUserAge() != null)
				u.setUserAge(userHelp.getUserAge());
			if (userHelp.getUserEmail() != null)
				u.setUserEmail(userHelp.getUserEmail());
			if (userHelp.getUserTel() != null)
				u.setUserTel(userHelp.getUserTel());
		}
		u.setOpTime(new Date());
		u.setUserType("2"); // 用户类型 1-学生 2-老师
		u = userHelpService.add(u);
		model.setUserId(u.getId());
		return sysTeacherDao.save(model);
	}

	@Override
	public SysTeacher findById(Integer id) {
		return sysTeacherDao.findById(id);
	}

	@Override
	public SysTeacher edit(SysTeacher model, UserHelp userHelp) {

		UserHelp u = userHelpService.findById(model.getUserId());
		if (model.getTeacherName() != null) {
			u.setUserName(model.getTeacherName());
		}
		if (userHelp != null) {
			if (userHelp.getUserSex() != null)
				u.setUserSex(userHelp.getUserSex());
			if (userHelp.getUserAge() != null)
				u.setUserAge(userHelp.getUserAge());
			if (userHelp.getUserEmail() != null)
				u.setUserEmail(userHelp.getUserEmail());
			if (userHelp.getUserTel() != null)
				u.setUserTel(userHelp.getUserTel());
			if (userHelp.getPassword() != null)
				u.setPassword(userHelp.getPassword());
		}
		userHelpService.update(u);
		sysTeacherDao.update(model);
		return model;
	}

	@Override
	public SysTeacher del(Integer id) {
		SysTeacher model = sysTeacherDao.findById(id);
		userHelpService.del(model.getUserId());
		sysTeacherDao.remove(model);
		return model;
	}

	@Override
	public Result<ListTeacher> find(SysTeacher model, int page, int row) {
		Result<Object> oldResult = sysTeacherDao.find(model, page, row);
		Result<ListTeacher> newResult = new Result<ListTeacher>();
		List<ListTeacher> newList = new ArrayList<ListTeacher>();
		if (oldResult != null && oldResult.getData() != null
				&& oldResult.getData().size() != 0) {

			for (Object object : oldResult.getData()) {
				Object[] o = (Object[]) object;
				ListTeacher teacher = new ListTeacher(o);

				// 查询老师所带专业
				List<ListTeacherMajor> teacherMajorList = teacherMajorService
						.findByTeacherId(teacher.getTeacherId());
				if (teacherMajorList != null) {
					teacher.setTeacherMajorList(teacherMajorList);
				}
				// 查询老师研究方向
				List<ListTeacherDirections> teacherDirectionList = teacherDirectionsService
						.findByTeacherId(teacher.getTeacherId());
				if (teacherDirectionList != null) {
					teacher.setTeacherDirectionList(teacherDirectionList);
				}
				newList.add(teacher);

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
	 * 查询指导老师通过老师职工号
	 * 
	 * @author 何金燕
	 * @date 2017.7.15
	 * @param teacherId
	 */
	@Override
	public ListTeacher findByTeacherNo(String teacherNo) {

		SysTeacher sysTeacher = new SysTeacher();
		sysTeacher.setTeacherNo(teacherNo);
		List<ListTeacher> list = this.findByExample(sysTeacher);

		if (list != null && list.size() != 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<SysTeacher> findByDeptNumber(String deptNumber) {
		List<Object> params = new ArrayList<Object>();
		if (StringUtils.isNotEmpty(deptNumber)) {
			String queryString = "from SysTeacher model where model.deptNumber=?";

			params.add(deptNumber);
			return sysTeacherDao.findByExample(queryString, params.toArray());
		}
		return null;
	}
	/**
	 * @author 韦东连
	 * @date 2017.07.12.
	 */
	@Override
	public List<ListTeacher> findByExample(SysTeacher model) {

		List<Object> oldList = sysTeacherDao.findByExample(model);
		List<ListTeacher> newList = new ArrayList<ListTeacher>();
		if (oldList != null && oldList.size() != 0)
			for (Object object : oldList) {
				Object[] o = (Object[]) object;

				ListTeacher teacher = new ListTeacher(o);
				// 查询老师所带专业
				List<ListTeacherMajor> teacherMajorList = teacherMajorService
						.findByTeacherId(teacher.getTeacherId());
				if (teacherMajorList != null) {
					teacher.setTeacherMajorList(teacherMajorList);
				}
				// 查询老师研究方向
				List<ListTeacherDirections> teacherDirectionList = teacherDirectionsService
						.findByTeacherId(teacher.getTeacherId());
				if (teacherDirectionList != null) {
					teacher.setTeacherDirectionList(teacherDirectionList);
				}
				newList.add(teacher);
			}
		return newList;

	}

	@Override
	public ListTeacher findModelById(Integer teacherId) {
		SysTeacher model = new SysTeacher();
		if (teacherId != null) {
			model.setTeacherId(teacherId);
			List<ListTeacher> list = findByExample(model);
			if (list != null && list.size() != 0) {
				return list.get(0);
			}
		} else {
			return null;
		}
		return null;
	}
}
