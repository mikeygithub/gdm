package com.gxwzu.business.dao.defenseRecord.impl;

import java.util.ArrayList;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.defenseRecord.IDefenseRecordDao;
import com.gxwzu.business.model.defenseRecord.DefenseRecord;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;

@SuppressWarnings("unchecked")
@Repository("defenseRecordDao")
public class DefenseRecordDaoImpl extends BaseDaoImpl<DefenseRecord>implements IDefenseRecordDao{
		@Override
		public Result<DefenseRecord> find(DefenseRecord model, int page, int size) {
			StringBuffer queryString = new StringBuffer("FROM DefenseRecord model where 1=1 ");
			int start = (page - 1) * size;
			int limit = size;
			List<Object> params = new ArrayList<Object>();

			if(model.getYear()!=null){
				queryString.append("and model.year=?");
				params.add(model.getYear());
			}

			if(model.getTeacherId()!=null){
				queryString.append("and model.teacherId=?");
				params.add(model.getTeacherId());
			}
			
			if(model.getStuId()!=null){
				queryString.append("and model.stuId=?");
				params.add(model.getStuId());
			}
			
			queryString.append(" ORDER BY model.defenseId DESC");

			return super.find(queryString.toString(), params.toArray(), null, start, limit);
		}
		@Override
		public List<DefenseRecord> findByExample(DefenseRecord model) {
			StringBuffer queryString = new StringBuffer("FROM DefenseRecord model where 1=1 ");

			List<Object> params = new ArrayList<Object>();
			if(model.getYear()!=null){
				queryString.append("and model.year=?");
				params.add(model.getYear());
			}

			if(model.getTeacherId()!=null){
				queryString.append("and model.teacherId=?");
				params.add(model.getTeacherId());
			}
			
			if(model.getStuId()!=null){
				queryString.append("and model.stuId=?");
				params.add(model.getStuId());
			}
			if(model.getDefenseId()!=null){
				queryString.append("and model.defenseId=?");
				params.add(model.getDefenseId());
			}
			
			queryString.append(" ORDER BY model.defenseId DESC");
			
			return super.findByExample(queryString.toString(),params.toArray() );
		}


}
