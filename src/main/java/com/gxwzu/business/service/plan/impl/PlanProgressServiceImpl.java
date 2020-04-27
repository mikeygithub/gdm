package com.gxwzu.business.service.plan.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.plan.IPlanProgressDao;
import com.gxwzu.business.dao.plan.IPlanYearDao;
import com.gxwzu.business.model.paln.PlanProgress;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.service.plan.IPlanProgressSerivce;
import com.gxwzu.business.service.plan.IPlanYearSerivce;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.sysVO.ListPlanProgress;
import com.gxwzu.sysVO.ListPlanProgress;
import com.gxwzu.system.model.sysCategory.SysCategory;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.service.sysCategory.ISysCategoryService;
import com.gxwzu.system.service.sysMajor.ISysMajorService;

@Service("planProgressService")
public class PlanProgressServiceImpl extends BaseServiceImpl<PlanProgress>
		implements IPlanProgressSerivce {
	@Autowired
	private IPlanProgressDao planProgressDao;

	@Autowired
	private ISysCategoryService sysCategoryService;

	@Autowired
	private ISysMajorService sysMajorService;

	public BaseDao<PlanProgress> getDao() {
		return this.planProgressDao;
	}

	@Override
	public Result<ListPlanProgress> find(PlanProgress model, int page, int row) {
		Result<ListPlanProgress> newResult = new Result<ListPlanProgress>();
		List<ListPlanProgress> newList = new ArrayList<ListPlanProgress>();
		Result<Object> oldList = planProgressDao.find(model, page, row);

		if (oldList != null && oldList.getData() != null
				&& oldList.getData().size() != 0) {

			for (Object object : oldList.getData()) {
				Object[] o = (Object[]) object;
				newList.add(new ListPlanProgress(o));
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
	public PlanProgress add(PlanProgress model) {
		return planProgressDao.save(model);
	}

	@Override
	public PlanProgress findById(int id) {
		return planProgressDao.get(PlanProgress.class, id);
	}

	@Override
	public void updateStartById(Integer progressId) {
		planProgressDao.updateStartById(progressId);
	}

	@Override
	public List<ListPlanProgress> findByExample(PlanProgress model) {
		List<ListPlanProgress> newList = new ArrayList<ListPlanProgress>();
		List<Object> oldList = planProgressDao.findByExample(model);

		if (oldList != null && oldList.size() != 0) {

			for (Object object : oldList) {
				Object[] o = (Object[]) object;
				newList.add(new ListPlanProgress(o));
			}
		}
		return newList;
	}

	@Override
	public boolean addOrEdit(PlanProgress model) {
		List<SysMajor> majors = null;
		boolean isSave = false;
		boolean isUpdate = false;
		String updateString = " DELETE FROM  PlanProgress WHERE deptNumber = ? and progressItemNo=?  and year=? ";
		List<Object> updateParams = new ArrayList<Object>();
		updateParams.add(model.getDeptNumber());
		updateParams.add(model.getProgressItemNo());
		updateParams.add(model.getYear());
		// 更新当前学院 中的 所有大类相应的进度时间
		if (-1 == model.getCategoryId()) {
			isUpdate = true;
			majors = sysMajorService.findByDeptNumber(model.getDeptNumber());
		} else if (-1 == model.getMajorId()) {
			updateString = updateString + " and categoryId=? ";
			updateParams.add(model.getCategoryId());
			isUpdate = true;
			majors = sysMajorService.findByCategoryId(model.getCategoryId());
		}
		if (isUpdate) {
			// 执行删除操作
			long count = planProgressDao.update(updateString,
					updateParams.toArray());
			
			//默认添加-1 为当前学院 所有大类 专业时间
			PlanProgress progress = new PlanProgress();
			progress.setProgressItemNo(model.getProgressItemNo());
			progress.setYear(model.getYear());
			progress.setStartTime(model.getStartTime());
			progress.setEndTime(model.getEndTime());
			progress.setProgressStart(model.getProgressStart());
			progress.setDeptNumber(model.getDeptNumber());
			progress.setCategoryId(model.getCategoryId());
			progress.setMajorId(model.getMajorId());
			planProgressDao.save(progress);
			
			for (SysMajor major : majors) {
				PlanProgress planProgress = new PlanProgress();
				planProgress.setProgressItemNo(model.getProgressItemNo());
				planProgress.setYear(model.getYear());
				planProgress.setStartTime(model.getStartTime());
				planProgress.setEndTime(model.getEndTime());
				planProgress.setProgressStart(model.getProgressStart());
				planProgress.setDeptNumber(model.getDeptNumber());
				planProgress.setCategoryId(major.getCategoryId());
				planProgress.setMajorId(major.getMajorId());
				planProgressDao.save(planProgress);
			}
			if (count < 0)
				isUpdate = false;
		} else {
			// 查看是否存在相应的 进度时间段 否则添加时间段
			PlanProgress planProgress = findById(model.getProgressId());
			if (planProgress != null) {
				planProgress.setStartTime(model.getStartTime());
				planProgress.setEndTime(model.getEndTime());
				planProgress.setProgressStart(model.getProgressStart());
				planProgressDao.update(planProgress);
				isSave = true;
			} else {
				PlanProgress progress = new PlanProgress();
				progress.setProgressItemNo(model.getProgressItemNo());
				progress.setYear(model.getYear());
				progress.setStartTime(model.getStartTime());
				progress.setEndTime(model.getEndTime());
				progress.setProgressStart(model.getProgressStart());
				progress.setDeptNumber(model.getDeptNumber());
				progress.setCategoryId(model.getCategoryId());
				progress.setMajorId(model.getMajorId());
				model = planProgressDao.save(progress);
				isSave = true;
			}
		}
		return (isUpdate || isSave);
	}

	@Override
	public List<ListPlanProgress> findByMajorAndYear(Integer majorId,
			Integer year) {
		PlanProgress model = new PlanProgress();
		model.setMajorId(majorId);
		model.setYear(year);
		List<ListPlanProgress> list = findByExample(model);
		return list;
	}

	@Override
	public PlanProgress findByStudMajoId(Integer majorId, String progressItemNo) {
		return 	planProgressDao.findByStudMajoId(majorId,progressItemNo);
	}

	@Override
	public PlanProgress findByTeacStaffroomId(Integer staffroomId, String progressItemNo) {
		return 	planProgressDao.findByTeacStaffroomId(staffroomId,progressItemNo);
	}


}
