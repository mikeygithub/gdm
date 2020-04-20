package com.gxwzu.business.service.allotGuide;

import java.util.List;

import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.sysVO.ListAllotGuide;
import com.gxwzu.sysVO.ListStudentAllotGuide;
import com.gxwzu.sysVO.ListTeacherGuideCount;


public interface IAllotGuideService extends BaseService<AllotGuide> {


    Result<AllotGuide> find(AllotGuide model, int page, int row);

    public List<AllotGuide> findByExample(AllotGuide model);

    public AllotGuide add(AllotGuide allotGuide);

    public List<ListAllotGuide> findByLoginName(AllotGuide model);

    public ListAllotGuide findByStuId(Integer stuId);

    public void del(Integer id);

    /**
     * 通过model和专业查找學生
     * @param model
     * @param majorIds
     * @param tabFlag
     * @param page
     * @param size
     * @return
     */
    public Result<ListStudentAllotGuide> findStudentByDeptAndMajor(ListStudentAllotGuide model, List<Integer> majorIds,String tabFlag, int page, int size);

    /**
     * 查找指导老师所带的学生
     * 通过指导老师Id和年度查找已分配學生
     *
     * @param teacherId
     * @param year
     * @author
     * @date 2017.7.15
     */
    public List<ListStudentAllotGuide> findStudentsByTeacherIdAndYear(Integer teacherId, Integer year);


    public AllotGuide findByStuIdAndYear(Integer stuId, Integer thisYear);

    /**
     * 查询可分配指导老师
     *
     * @param guideCount
     * @param majorIds
     * @param page
     * @param row
     * @return
     */
    Result<ListTeacherGuideCount> findTeacherList(ListTeacherGuideCount guideCount, List<Integer> majorIds, int page, int row);

}
