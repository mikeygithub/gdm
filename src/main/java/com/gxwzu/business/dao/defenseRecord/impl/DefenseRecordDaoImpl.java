package com.gxwzu.business.dao.defenseRecord.impl;

import java.util.ArrayList;

import java.util.List;

import com.gxwzu.sysVO.DefenseRecordVO;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.defenseRecord.IDefenseRecordDao;
import com.gxwzu.business.model.defenseRecord.DefenseRecord;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;

@SuppressWarnings("unchecked")
@Repository("defenseRecordDao")
public class DefenseRecordDaoImpl extends BaseDaoImpl<DefenseRecord> implements IDefenseRecordDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Result find(DefenseRecord model, int page, int size) {

        StringBuffer queryString = new StringBuffer("SELECT model.*,st.teacher_name,ii.issue_name FROM defense_record model");
        queryString.append(" LEFT  JOIN sys_teacher st ON model.teacher_id = st.teacher_id");
        queryString.append(" LEFT  JOIN issue_info ii ON model.stu_id = ii.stu_id");
        queryString.append(" where 1=1 ");

        int start = (page - 1) * size;
        int limit = size;

        List<Object> params = new ArrayList<Object>();

        if (model.getYear() != null) {
            queryString.append(" and model.year=?");
            params.add(model.getYear());
        }

        if (model.getTeacherId() != null) {
            queryString.append(" and model.teacher_id=?");
            params.add(model.getTeacherId());
        }

        if (model.getStuId() != null) {
            queryString.append(" and model.stu_id=?");
            params.add(model.getStuId());
        }

        queryString.append(" ORDER BY model.defense_id DESC");

        return super.findBySQL(queryString.toString(), params.toArray(), start, limit);
    }

    @Override
    public List<DefenseRecord> findByExample(DefenseRecord model) {
        StringBuffer queryString = new StringBuffer("FROM DefenseRecord model where 1=1 ");

        List<Object> params = new ArrayList<Object>();
        if (model.getYear() != null) {
            queryString.append("and model.year=?");
            params.add(model.getYear());
        }

        if (model.getTeacherId() != null) {
            queryString.append("and model.teacherId=?");
            params.add(model.getTeacherId());
        }

        if (model.getStuId() != null) {
            queryString.append("and model.stuId=?");
            params.add(model.getStuId());
        }
        if (model.getDefenseId() != null) {
            queryString.append("and model.defenseId=?");
            params.add(model.getDefenseId());
        }

        queryString.append(" ORDER BY model.defenseId DESC");

        return super.findByExample(queryString.toString(), params.toArray());
    }

    /**
     * 分页查询
     *
     * @param model
     * @param page
     * @param size
     * @return
     */
    @Override
    public Result<DefenseRecord> findByPage(DefenseRecord model, int page, int size) {

        Session session = sessionFactory.openSession();

        Criteria criteria = session.createCriteria(DefenseRecord.class);

        Result<DefenseRecord> defenseRecordResult = new Result<>();

        List list = criteria.add(Restrictions.eq("stuId", model.getStuId())).setFirstResult(page)
                .setMaxResults(size).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("year")).list();

        defenseRecordResult.setData(list);

        Long total = (Long) session.createCriteria(DefenseRecord.class).setProjection(Projections.rowCount()).uniqueResult();

        defenseRecordResult.setTotal(Math.toIntExact(total));

        session.close();

        return defenseRecordResult;
    }


}
