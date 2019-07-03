package com.gxwzu.business.service.guideCount;

import java.util.List;

import com.gxwzu.business.model.guideCount.GuideCount;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.sysVO.ListTeacherGuideCount;

public interface IGuideCountSerivce extends BaseService<GuideCount> {
	public Result<GuideCount> find(GuideCount model, int page, int size);

	public GuideCount del(Integer id);

	public GuideCount add(GuideCount model);

	public List<GuideCount> findByExample(GuideCount model);

	public GuideCount findById(Integer id);

	/**
	 * 查询指导老师所带人数
	 * @param guideCount
	 * @param page
	 * @param row
	 * @return
	 */
	public Result<ListTeacherGuideCount> findGuideCount(
			ListTeacherGuideCount guideCount, int page, int row);

}
