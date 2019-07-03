package com.gxwzu.business.dao.allotGuide;

import java.util.List;

import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListStudentAllotGuide;
import com.gxwzu.sysVO.ListTeacherGuideCount;

public interface IAllotGuideDao extends BaseDao<AllotGuide>{

	Result<AllotGuide> find(AllotGuide model, int page, int row);

	public List<AllotGuide> findByExample(AllotGuide model);
	
	public List<AllotGuide> findByLoginName(AllotGuide model);
	
	public AllotGuide findById(Integer id);

	AllotGuide findByStuId(Integer stuId);
	
	
	/**
	 * 通过model和专业查找學生
	 * @author 
     * @date 2017.7.15
	 */
	public Result<Object> findStudentByDeptAndMajor(ListStudentAllotGuide model, List<Integer> majorIds, int page, int size);

	public List<Object> findStudentsByExample(ListStudentAllotGuide model);

	Result<Object> findTeacherList(ListTeacherGuideCount guideCount,
			List<Integer> majorIds, int page, int row);
}
