package com.gxwzu.system.dao.sysStudent.impl;

import java.util.ArrayList;
import java.util.List;

import com.gxwzu.sysVO.MaterialInfo;
import org.apache.commons.lang.xwork.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListGroupAllotExport;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.system.dao.sysStudent.ISysStudentDao;
import com.gxwzu.system.model.sysStudent.SysStudent;


/**
 * 学生DAOIMPL实现类
 *
 * @author黎艺侠
 */
@SuppressWarnings("unchecked")
@Repository("sysStudentDao")
public class SysStudentDaoImpl extends BaseDaoImpl<SysStudent> implements ISysStudentDao {

    /**
     * 学生信息显示列表
     *
     * @return
     */
    @Override
    public Result<Object> find(MaterialInfo model, int page, int size) {
        int start = (page - 1) * size;
        int limit = size;
        List<Object> params = new ArrayList<Object>();
        StringBuffer queryString = new StringBuffer("SELECT * FROM (")
                .append("SELECT ")
                .append(" st.*,up.userSex,up.userAge,up.userEmail,up.userTel,up.userImg,up.userType, ")
                .append(" sdt.dept_name,scy.category_name,smr.major_name,scs.class_name,ag.teacher_id ,ag.year")
                .append(" FROM sys_student st ")
                .append(" INNER JOIN user_hlep up ON st.user_id = up.id ")
                .append(" LEFT JOIN sys_department sdt ON st.dept_number = sdt.dept_number ")
                .append(" LEFT OUTER JOIN sys_category scy ON st.category_id = scy.category_id ")
                .append(" LEFT OUTER JOIN sys_major smr ON st.major_id =smr.major_id ")
                .append(" LEFT OUTER JOIN sys_class scs ON st.class_id = scs.class_id ")
                .append(" LEFT OUTER JOIN allot_guide ag ON st.stu_id = ag.stu_id ")
                .append(") AS model WHERE 1 = 1 ");

        if (model.getStudent() != null) {
            if (StringUtils.isNotEmpty(model.getStudent().getStuName())) {
                queryString.append(" and model.stu_name like ? ");
                params.add("%" + model.getStudent().getStuName() + "%");
            }
            if (StringUtils.isNotEmpty(model.getStudent().getStuNo())) {
                queryString.append(" and model.stu_no like ? ");
                params.add("%" + model.getStudent().getStuNo() + "%");
            }
            if (StringUtils.isNotEmpty(model.getStudent().getDeptNumber())) {
                queryString.append(" and model.dept_number = ? ");
                params.add(model.getStudent().getDeptNumber());
            }
            if (model.getStudent().getMajorId() != null) {
                queryString.append(" and model.major_id =? ");
                params.add(model.getStudent().getMajorId());
            }
            if (model.getStudent().getClassId() != null) {
                queryString.append(" and model.class_id =? ");
                params.add(model.getStudent().getClassId());
            }
            if (model.getStudent().getStuId() != null) {
                queryString.append(" and model.stu_id =? ");
                params.add(model.getStudent().getStuId());
            }
        }
        if (StringUtils.isNotEmpty(model.getStuNo())) {
            queryString.append(" and model.stu_no like ? ");
            params.add("%" + model.getStuNo() + "%");
        }
        if (StringUtils.isNotEmpty(model.getDeptNumber())) {
            queryString.append(" and model.dept_number =? ");
            params.add(model.getDeptNumber());
        }
        if (model.getMajorId() != null) {
            queryString.append(" and model.major_id =? ");
            params.add(model.getMajorId());
        }
        if (model.getClassId() != null) {
            queryString.append(" and model.class_id =? ");
            params.add(model.getClassId());
        }
        if (model.getStuId() != null) {
            queryString.append(" and model.stu_id =? ");
            params.add(model.getStuId());
        }
        //指定教师指导的学生
        if (model.getTeacherId() != null) {
            queryString.append(" and model.teacher_id = ? ");
            params.add(model.getTeacherId());
        }
        //年度
        if (model.getYear()!=null){
            queryString.append(" and model.year = ? ");
            params.add(model.getYear());
        }
        queryString.append(" ORDER BY model.stu_id DESC ");

        return (Result<Object>) super.findBySQL(queryString.toString(), params.toArray(), start, limit);
    }

    /**
     * 通过id查找
     *
     * @return
     */
    @Override
    public SysStudent findById(Integer id) {
        log.debug("############ " + id);
        try {
            SysStudent instance = (SysStudent) getHibernateTemplate().get(
                    "com.gxwzu.system.model.sysStudent.SysStudent", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }

    /**
     * 通过stuNo查找
     *
     * @return
     */
    @Override
    public ListStudent findByStuNo(String stuNo) {
        StringBuffer queryString = new StringBuffer("SELECT * FROM (")
                .append("SELECT ")
                .append(" st.*,up.userSex,up.userAge,up.userEmail,up.userTel,up.userImg,up.userType, ")
                .append(" sdt.dept_name,scy.category_name,smr.major_name,scs.class_name,up.sign ")
                .append(" FROM sys_student st ")
                .append(" INNER JOIN user_hlep up ON st.user_id = up.id ")
                .append(" LEFT JOIN sys_department sdt ON st.dept_number = sdt.dept_number ")
                .append(" LEFT OUTER JOIN sys_category scy ON st.category_id = scy.category_id ")
                .append(" LEFT OUTER JOIN sys_major smr ON st.major_id =smr.major_id ")
                .append(" LEFT OUTER JOIN sys_class scs ON st.class_id = scs.class_id ")
                .append(") AS model WHERE 1 = 1 ");


        List<Object> params = new ArrayList<Object>();
        ListStudent student = null;
        try {
            if (StringUtils.isNotEmpty(stuNo)) {
                queryString.append("and model.stu_no=?");
                params.add(stuNo);
                List<Object> list = super.query(queryString.toString(), params.toArray());
                if (list != null && list.size() != 0) {
                    Object[] o = (Object[]) list.get(0);
                    student = new ListStudent(o);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return student;

    }

    /**
     * 对学生查重
     */
    @Override
    public List<Object> findByExample(SysStudent model) {
        List<Object> params = new ArrayList<Object>();
        StringBuffer queryString = new StringBuffer("SELECT * FROM (")
                .append("SELECT ")
                .append(" st.*,up.userSex,up.userAge,up.userEmail,up.userTel,up.userImg,up.userType, ")
                .append(" sdt.dept_name,scy.category_name,smr.major_name,scs.class_name ")
                .append(" FROM sys_student st ")
                .append(" INNER JOIN user_hlep up ON st.user_id = up.id ")
                .append(" LEFT JOIN sys_department sdt ON st.dept_number = sdt.dept_number ")
                .append(" LEFT OUTER JOIN sys_category scy ON st.category_id = scy.category_id ")
                .append(" LEFT OUTER JOIN sys_major smr ON st.major_id =smr.major_id ")
                .append(" LEFT OUTER JOIN sys_class scs ON st.class_id = scs.class_id ")
                .append(") AS model WHERE 1 = 1 ");


        if (model.getStuId() != null) {
            queryString.append(" and model.stu_id =? ");
            params.add(model.getStuId());
        }
        if (StringUtils.isNotEmpty(model.getStuNo())) {
            queryString.append(" and model.stu_no =? ");
            params.add(model.getStuNo());
        }
        if (StringUtils.isNotEmpty(model.getStuName())) {
            queryString.append(" and model.stu_name =? ");
            params.add(model.getStuName());
        }
        if (StringUtils.isNotEmpty(model.getDeptNumber())) {
            queryString.append(" and model.dept_number =? ");
            params.add(model.getDeptNumber());
        }
        if (model.getMajorId() != null) {
            queryString.append(" and model.major_id =? ");
            params.add(model.getMajorId());
        }
        if (model.getClassId() != null) {
            queryString.append(" and model.class_id =? ");
            params.add(model.getClassId());
        }
        queryString.append(" ORDER BY model.stu_id DESC ");

        return super.query(queryString.toString(), params.toArray());
    }

    /**
     * 检查学号和姓名是否存在
     *
     * @param student
     * @return
     * @author hjy
     * @date 2017.7.31
     */
    @Override
    public List<SysStudent> findByStuIdAndStuName(SysStudent student) {
        List<Object> params = new ArrayList<Object>();
        String queryString = "from SysStudent model where 1=1";
        if (StringUtils.isNotEmpty(student.getStuNo())) {
            queryString = queryString + " and student.stu_no=?";
            params.add(student.getStuNo());
        }
        Object[] objects = new Object[params.size()];
        for (int i = 0; i < params.size(); i++) {
            objects[i] = params.get(i);
        }
        queryString = queryString + " ORDER BY stu_id DESC";
        return super.findByExample(queryString, objects);
    }

    @Override
    public SysStudent findByStuId(Integer stuId) {

        StringBuffer queryString = new StringBuffer("FROM SysStudent model where 1=1 ");
        List<Object> params = new ArrayList<Object>();

        if (stuId != null && !"".equals(stuId)) {
            queryString.append("and model.stuId=? ");
            params.add(stuId);
        }
        queryString.append(" ORDER BY model.stuId DESC");
        List<SysStudent> list = super.findByExample(queryString.toString(), params.toArray());
        return list.get(0);
    }

    @Override
    public List<SysStudent> findByMajorId(Integer majorId) {
        List<Object> params = new ArrayList<Object>();
        String queryString = "";
        if (majorId != null && !"".equals(majorId)) {
            queryString = "from SysStudent model where 1=1 and model.majorId = ? ";
            params.add(majorId);
        } else {
            queryString = "from SysStudent model where 1!=1 ";
        }
        return super.findByExample(queryString, params.toArray());
    }


    /**
     * 通过学生id查找分组
     */
    @Override
    public List<Object> findGroupAllotByStuId() {

        List<Object> params = new ArrayList<Object>();
        StringBuffer queryString = new StringBuffer("SELECT *,group_concat(model.t_name) as group_teacher_names FROM (")
                .append(" SELECT ")
                .append(" st.stu_id,st.stu_no,st.stu_name,")
                .append(" scs.class_id ,scs.class_name,")
                .append(" gst.student_id,gst.group_allot_id,")
                .append(" ga.group_id,ga.group_name,ga.classRoom_id, ")
                .append(" sym.classroom_name, ")
                .append(" ag.teacher_id,")
                .append(" ste.teacher_name,")
                .append(" iso.issue_name,")
                .append(" ster.teacher_name as t_name")
                .append(" FROM sys_student st ")
                .append(" LEFT OUTER JOIN sys_class scs ON st.class_id = scs.class_id")
                .append(" LEFT OUTER JOIN group_student gst ON st.stu_id= gst.student_id ")
                .append(" LEFT OUTER JOIN group_allot ga ON gst.group_allot_id = ga.group_id ")
                .append(" LEFT OUTER JOIN sys_classroom sym ON sym.id= ga.classRoom_id")
                .append(" LEFT OUTER JOIN allot_guide ag ON st.stu_id = ag.stu_id  ")
                .append(" LEFT OUTER JOIN sys_teacher ste ON ag.teacher_id = ste.teacher_id")
                .append(" LEFT OUTER JOIN issue_info iso ON st.stu_id= iso.stu_id  ")
                .append(" LEFT OUTER JOIN group_teacher gt ON gt.group_allot_id = ga.group_id")
                .append(" LEFT OUTER JOIN sys_teacher ster ON ster.teacher_id = gt.teacher_id")
                .append(" ) as model where 1=1 and group_allot_id is not null ")
                .append(" group by model.stu_id")
                .append(" ORDER BY model.group_allot_id asc,model.teacher_id ASC, model.stu_id ASC");


        return super.query(queryString.toString(), params.toArray());
    }

    @Override
    public SysStudent findByUserId(Integer id) {
        Session session = this.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(SysStudent.class);
        List<SysStudent> userId = criteria.add(Restrictions.eq("userId", id)).list();
        session.close();

        return userId.get(0);
    }

}
