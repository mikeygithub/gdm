package com.gxwzu.business.service.paper.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.paper.IStudentPaperDao;
import com.gxwzu.business.model.paper.StudentPaper;
import com.gxwzu.business.service.paper.IStudentPaperSerivce;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.sysVO.ListGroupStudent;
import com.gxwzu.sysVO.ListPaper;
import com.sun.org.apache.xpath.internal.FoundIndex;

@Service("studentPaperService")
public class StudentPaperServiceImpl extends BaseServiceImpl<StudentPaper> implements IStudentPaperSerivce{
    @Autowired
    private IStudentPaperDao studentPaperDao;
    
    public BaseDao<StudentPaper> getDao() {
		return this.studentPaperDao;
	}

	@Override
	public StudentPaper add(StudentPaper studentPaper) {
		
		 return studentPaperDao.save(studentPaper);
		
	}

	@Override
	public Result<StudentPaper> find(StudentPaper model, int page, int size) {
		 return studentPaperDao.find(model, page, size);
	}

	@Override
	public void del(Integer id) {
		remove(StudentPaper.class,id);
	}

	@Override
	public StudentPaper findById(Integer id) {
		return studentPaperDao.get(StudentPaper.class, id);
	}

	@Override
	public StudentPaper findByStuIdAndYear(Integer stuId, Integer year,String fileType) {
		StudentPaper model = new StudentPaper();
		model.setStuId(stuId);
		model.setYear(year);
		model.setFileType(fileType);
		List<StudentPaper> list= findByExample(model);
		if(list==null||list.size()<=0)
			return null;
		else{
			return list.get(0);
		}
	}

	@Override
	public List<StudentPaper> findByExample(StudentPaper model) {
		return studentPaperDao.findByExample(model);
	}

	@Override
	public List<ListPaper> findList(StudentPaper model) {
		List<ListPaper> newList = new ArrayList<ListPaper>();
		List<Object> oldList =  studentPaperDao.findList(model);
		if(oldList!=null&&oldList.size()!=0){
			for(Object os:oldList){
				Object[] o = (Object[]) os;
				newList.add(new ListPaper(o));
			}
		}
		return newList;
	}

}
