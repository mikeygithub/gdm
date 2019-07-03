package com.gxwzu.business.dao.guideCount;

import java.util.List;

import com.gxwzu.business.model.guideCount.GuideCount;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListTeacherGuideCount;

public interface IGuideCountDao extends BaseDao<GuideCount> {
	public Result<GuideCount> find(GuideCount model, int page, int size);

	public List<GuideCount> findByExample(GuideCount model);
	
	/** 查询指导老师所带人数 
	 * @author 何金燕
	 * @param model 老师实体
	 * @param page   
	 * @param size
	 * @return
	 */
	public Result<Object> findGuideCount(ListTeacherGuideCount model,  int page, int size);


}
