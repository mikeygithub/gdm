package com.gxwzu.business.service.guideCount.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.guideCount.IGuideCountDao;
import com.gxwzu.business.model.guideCount.GuideCount;
import com.gxwzu.business.model.teacherMajor.TeacherMajor;
import com.gxwzu.business.service.guideCount.IGuideCountSerivce;
import com.gxwzu.business.service.teacherMajor.ITeacherMajorService;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.sysVO.ListTeacherGuideCount;
import com.gxwzu.sysVO.ListTeacherMajor;

@Service("guideCountService")
public class GuideCountServiceImpl extends BaseServiceImpl<GuideCount> implements IGuideCountSerivce{
    @Autowired
    private IGuideCountDao guideCountDao;
    @Autowired
	private ITeacherMajorService teacherMajorService; // 老师专业接口
    
    public BaseDao<GuideCount> getDao() {
		return this.guideCountDao;
	}

	@Override
	public Result<GuideCount> find(GuideCount model, int page, int size) {
		return guideCountDao.find(model, page, size);
	}

	@Override
	public GuideCount del(Integer id) {
		GuideCount model = get(GuideCount.class, id);
		guideCountDao.remove(model);
		return model;
	}
	@Override
	public GuideCount add(GuideCount model) {
		return guideCountDao.saveOrUpdate(model);
	}
	@Override
	public List<GuideCount> findByExample(GuideCount model) {
		
		return guideCountDao.findByExample(model);
	}

	/**
	 * 通过院系和专业查找指导老师
	 * 
	 * @author 黎艺侠
	 * @date 2017.7.11
	 */
	@Override
	public Result<ListTeacherGuideCount> findGuideCount(ListTeacherGuideCount model, int page, int size) {
		Result<Object> oldResult = guideCountDao.findGuideCount(model, page, size);
		Result<ListTeacherGuideCount> newResult = new Result<ListTeacherGuideCount>();
		List<ListTeacherGuideCount> newList = new ArrayList<ListTeacherGuideCount>();

		if (oldResult != null && oldResult.getData() != null
				&& oldResult.getData().size() != 0) {

			for (Object object : oldResult.getData()) {
				Object[] o = (Object[]) object;
				ListTeacherGuideCount guideCount =  new ListTeacherGuideCount(o);
			
				//查询老师所带专业
			    List<ListTeacherMajor> teacherMajorList = teacherMajorService.findByTeacherId(guideCount.getTeacherId());
				if(teacherMajorList!=null){
					guideCount.setTeacherMajorList(teacherMajorList);
				}
				newList.add(guideCount );
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

	
	@Override
	public GuideCount findById(Integer id) {
		
		return guideCountDao.get(GuideCount.class, id);
	}

	
}
