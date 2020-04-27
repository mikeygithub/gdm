package com.gxwzu.business.service.group.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.group.IGroupTeacherDao;
import com.gxwzu.business.model.group.GroupTeacher;
import com.gxwzu.business.model.teacherMajor.TeacherMajor;
import com.gxwzu.business.service.group.IGroupTeacherService;
import com.gxwzu.business.service.teacherMajor.ITeacherMajorService;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.sysVO.ListGroupTeacher;
import com.gxwzu.sysVO.ListTeacherMajor;

@Service("groupTeacherService")
public class GroupTeacherServiceImpl extends BaseServiceImpl<GroupTeacher>
		implements IGroupTeacherService {

	@Autowired
	private IGroupTeacherDao groupTeacherDao;
	   @Autowired
		private ITeacherMajorService teacherMajorService; // 老师专业接口
	@Override
	public BaseDao<GroupTeacher> getDao() {
		return this.groupTeacherDao;
	}

	@Override
	public GroupTeacher add(GroupTeacher groupTeacher) {
		return groupTeacherDao.save(groupTeacher);
	}

	/**
	 * 删除已选教师信息
	 * 
	 * @return
	 */
	@Override
	public GroupTeacher del(Integer id) {
		GroupTeacher model = groupTeacherDao.findById(id);
		groupTeacherDao.remove(model);
		return model;
	}

	@Override
	public Result<ListGroupTeacher> find(ListGroupTeacher model, int page,
			int row) {
		Result<ListGroupTeacher> newResult = new Result<ListGroupTeacher>();
		List<ListGroupTeacher> newList = new ArrayList<ListGroupTeacher>();
		Result<Object> oldList = groupTeacherDao.find(model, page, row);
		if (oldList != null && oldList.getData() != null
				&& oldList.getData().size() != 0) {

			for (Object object : oldList.getData()) {
				Object[] o = (Object[]) object;
				ListGroupTeacher guideTeacher = new ListGroupTeacher(o);
				newList.add(new ListGroupTeacher(o));
				//查询老师所带专业
			    List<ListTeacherMajor> teacherMajorList = teacherMajorService.findByTeacherId(guideTeacher.getTeacherId());
				if(teacherMajorList!=null){
					guideTeacher.setTeacherMajorList(teacherMajorList);
				}
			}
		}
		newResult.setData(newList);
		newResult.setOffset(oldList.getOffset());
		newResult.setPage(oldList.getPage());
		newResult.setSize(oldList.getSize());
		newResult.setTotal(oldList.getTotal());
		newResult.setTotalPage(oldList.getTotalPage());
		return newResult;
	}

	@Override
	public List<ListGroupTeacher> findByExample(ListGroupTeacher model) {
		List<ListGroupTeacher> newList = new ArrayList<ListGroupTeacher>();;
		List<Object> oldList = groupTeacherDao.findByExample(model);

		if (oldList != null && oldList.size() != 0) {
			
			for (Object object : oldList) {
				Object[] o = (Object[]) object;
				newList.add(new ListGroupTeacher(o));
			}
		}
		return newList;
	}

	@Override
	public List<ListGroupTeacher> findByGroupIdAndTypeAndYear(Integer thisGroupId,
			String teachType, Integer year) {
		ListGroupTeacher model = new ListGroupTeacher();
		model.setGroupAllotId(thisGroupId);
		   model.setType(teachType);
		model.setYear(year);
		List<ListGroupTeacher> list = findByExample(model);
		if (list == null||list.size()==0)
			return null;
		else {
			return list;
		}
	}

	@Override
	public ListGroupTeacher findByGroupAllotIdAndTeacherIdAndYear(
			Integer thisGroupId, Integer thisTeacherId, Integer thisYear) {
		ListGroupTeacher model = new ListGroupTeacher();
		model.setGroupAllotId(thisGroupId);
		model.setTeacherId(thisTeacherId);
		model.setYear(thisYear);
		List<ListGroupTeacher> list = findByExample(model);
		if (list == null||list.size()==0)
			return null;
		else {
			return list.get(0);
		}
	}

	@Override
	public Integer delByGroupIdAndYear(Integer thisId, Integer year) {
		return groupTeacherDao.delByGroupIdAndYear(thisId,year);
		
	}

	@Override
	public List<ListGroupTeacher> findByTeacherIdAndYear(Integer teacherId,
			Integer thisYear) {
			ListGroupTeacher model = new ListGroupTeacher();
			model.setTeacherId(teacherId);
			model.setYear(thisYear);
			List<ListGroupTeacher> list = findByExample(model);
			if (list == null||list.size()==0)
				return null;
			else {
				return list;
			}
	}

}
