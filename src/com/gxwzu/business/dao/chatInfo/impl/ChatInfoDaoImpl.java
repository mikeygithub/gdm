package com.gxwzu.business.dao.chatInfo.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.classic.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.chatInfo.IChatInfoDao;
import com.gxwzu.business.dao.plan.IPlanYearDao;
import com.gxwzu.business.model.chatInfo.ChatInfo;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListChatInfo;
import com.gxwzu.sysVO.ListStudentAllotGuide;
import org.springframework.transaction.annotation.Transactional;

@SuppressWarnings("unchecked")
@Repository("chatInfoDao")
public class ChatInfoDaoImpl extends BaseDaoImpl<ChatInfo>implements IChatInfoDao {

	@Override
	public Result<ChatInfo> find(ChatInfo model, int page, int size) {
		String queryString = "from ChatInfo model where 1=1";
		int start = (page - 1) * size;
		int limit = size;
		List<Object> params = new ArrayList<Object>();
		
		if(model.getYear()!=null){
			queryString=queryString+"and model.year=?";
			params.add(model.getYear());
		}
		
		queryString = queryString + " ORDER BY model.sendTime DESC";
		return (Result<ChatInfo>) super.find(queryString, params.toArray(),null, start, limit);
	}


	@Override
	public List<ChatInfo> findByExample(ChatInfo model) {
		String queryString = "from ChatInfo model where 1=1";
		List<Object> params = new ArrayList<Object>();
		
		if(model.getYear()!=null){
			queryString=queryString+"and model.year=?";
			params.add(model.getYear());
		}
		
		queryString = queryString + " ORDER BY model.sendTime DESC";
		return super.findByExample(queryString, params.toArray());
	}


	@Override
	public List<ChatInfo> findByUserIdAndAnswerId(Integer senderId,
			Integer answerId,String chatType) {
		
		String queryString = "from ChatInfo model where 1=1 ";
		List<Object> params = new ArrayList<Object>();
		if(null!=chatType && !"".equals(chatType)){
			queryString=queryString+" and chatType = ?";
			params.add(chatType);
		}
		if(senderId!=null && answerId!=null){
			queryString=queryString+" and (model.senderId=? or model.senderId=?)";
			params.add(senderId);
			params.add(answerId);
			queryString=queryString+" and (model.answerId=? or model.answerId=?)";
			params.add(senderId);
			params.add(answerId);
		queryString = queryString + " ORDER BY model.sendTime ASC";
		return super.findByExample(queryString, params.toArray());
		}else{
			return null;
		}
	}


	@Override
	public List<ChatInfo> findByGuideTreacherId(Integer teacherId,
			Integer year, String chatType, List<ListStudentAllotGuide> allotGuideStudentList) {
		
		String queryString = "from ChatInfo model where 1=1 ";
		List<Object> params = new ArrayList<Object>();
		if(null!=chatType && !"".equals(chatType)){
			queryString=queryString+" and chatType = ? ";
			params.add(chatType);
		}
		
		if(teacherId!=null && year!=null){
			if(allotGuideStudentList.size() > 0 && teacherId!=null){
				queryString += " and ( senderId = ? or";
				params.add(teacherId);
				for (int i = 0; i < allotGuideStudentList.size(); i++) {
					if(i != allotGuideStudentList.size() - 1){
						queryString +=  " senderId = ? or ";
						params.add(allotGuideStudentList.get(i).getStuId());
					}else{
						queryString += " senderId = ?) ";
						params.add(allotGuideStudentList.get(i).getStuId());
					}
				}
			}
			queryString=queryString+" and year = ?";
			params.add(year);
		    queryString = queryString + " ORDER BY model.sendTime ASC";
		    return super.findByExample(queryString, params.toArray());
		}else{
			return null;
		}
	}


	@Override
	public List<ChatInfo> findByAnswerId(Integer answerId,Integer senderId, String chatType, String readType) {
		String queryString = "from ChatInfo model where 1=1 ";
		List<Object> params = new ArrayList<Object>();
		if(null!=answerId && !"".equals(answerId)){
			queryString=queryString+" and answerId = ? ";
			params.add(answerId);
		}
		if(null!=senderId && !"".equals(senderId)){
			queryString=queryString+" and senderId = ? ";
			params.add(senderId);
		}
		if(null!=chatType && !"".equals(chatType)){
			queryString=queryString+" and chatType = ? ";
			params.add(chatType);
		}
		if(null!=readType && !"".equals(readType)){
			queryString=queryString+" and readType = ? ";
			params.add(readType);
		}
		return super.findByExample(queryString, params.toArray());
	}


	/**
	 * 更新阅读条数状态
	 */
	@Override
	public void updateReadType(Integer answerId, Integer senderId, String readType) {
		String updateString = "";
		List<Object> params = new ArrayList<Object>();
		if(null!=answerId && !"".equals(answerId)&&(null!=senderId && !"".equals(senderId))){
			updateString = "update ChatInfo set  ";
			updateString = updateString+" readType = ?";
			params.add(readType);
			updateString = updateString+" where answerId = ? and senderId = ? ";
			params.add(answerId);
			params.add(senderId);
		}
		super.bulkUpdate(updateString, params.toArray(), null);
	}


	@Override
	public void updateByChatId(Integer chatId, String readType) {
		String updateString = "";
		List<Object> params = new ArrayList<Object>();
		if(null!=chatId && !"".equals(chatId)){
			updateString = "update ChatInfo set  ";
			updateString = updateString+" readType = ?";
			params.add(readType);
			updateString = updateString+" where chatId = ? ";
			params.add(chatId);
		}
		super.bulkUpdate(updateString, params.toArray(), null);
	}

	@Override
	@Transactional
	public Integer findChatCountByTeacherIdOrStudentId(Integer userId) {
		Integer size = 0;
		try {
		Criteria criteria = getSessionFactory().getCurrentSession().createCriteria(ChatInfo.class);
		//查询个人消息数量
			size = criteria.add(
					Restrictions.or(
							Restrictions.and(
									Restrictions.eq("readType", String.valueOf(1)),
									Restrictions.eq("answerId", userId)),
							Restrictions.and(
									Restrictions.eq("answerId", 1),
									Restrictions.like("readType", String.valueOf(userId), MatchMode.ANYWHERE))))
					.list().size();
		}catch (Exception e){
			e.printStackTrace();
		}
		return size;
	}

}
