package com.gxwzu.business.dao.chatInfo.impl;

import java.util.ArrayList;
import java.util.List;

import com.gxwzu.core.context.SystemContext;
import com.gxwzu.system.dao.userHelp.IUserHelpDao;
import com.gxwzu.system.model.userHelp.UserHelp;
import org.apache.commons.lang.xwork.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.classic.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
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

@Repository("chatInfoDao")
public class ChatInfoDaoImpl extends BaseDaoImpl<ChatInfo> implements IChatInfoDao {

    @Autowired
    private IUserHelpDao iUserHelpDao;

    @Override
    public Result<ChatInfo> find(ChatInfo model, int page, int size) {
        String queryString = "from ChatInfo model where 1=1";
        int start = (page - 1) * size;
        int limit = size;
        List<Object> params = new ArrayList<Object>();

        if (model.getYear() != null) {
            queryString = queryString + "and model.year= ? ";
            params.add(model.getYear());
        }
        if (null != model.getAnswerId() && !"".equals(model.getAnswerId())) {
            queryString = queryString + " and answerId = ? ";
            params.add(model.getAnswerId());
        }
        if (null != model.getSenderId() && !"".equals(model.getSenderId())) {
            queryString = queryString + " and senderId = ? ";
            params.add(model.getSenderId());
        }
        if (null != model.getChatType() && StringUtils.isNotBlank(model.getChatType())) {
            queryString = queryString + " and chatType = ? ";
            params.add(model.getChatType());
        }
        if (null != model.getReadType() && StringUtils.isNotBlank(model.getReadType())) {
            queryString = queryString + " and readType = ? ";
            params.add(model.getReadType());
        }
        //查询群聊
        if (null != model.getAnswerName() && StringUtils.isNotBlank(model.getAnswerName())) {
            queryString = queryString + " and answer_name like ? ";
            params.add("%" + model.getAnswerName() + "%");
        }

        queryString = queryString + " ORDER BY model.sendTime DESC";

        return (Result<ChatInfo>) super.find(queryString, params.toArray(), null, start, limit);
    }


//	@Override
//	public List<ChatInfo> findByExample(ChatInfo model) {
//		String queryString = "from ChatInfo model where 1=1";
//		List<Object> params = new ArrayList<Object>();
//
//		if(model.getYear()!=null){
//			queryString=queryString+"and model.year=?";
//			params.add(model.getYear());
//		}
//
//		queryString = queryString + " ORDER BY model.sendTime DESC";
//		return super.findByExample(queryString, params.toArray());
//	}
//
//
//	@Override
//	public List<ChatInfo> findByUserIdAndAnswerId(Integer senderId,
//			Integer answerId,String chatType) {
//
//		String queryString = "from ChatInfo model where 1=1 ";
//		List<Object> params = new ArrayList<Object>();
//		if(null!=chatType && !"".equals(chatType)){
//			queryString=queryString+" and chatType = ?";
//			params.add(chatType);
//		}
//		if(senderId!=null && answerId!=null){
//			queryString=queryString+" and (model.senderId=? or model.senderId=?)";
//			params.add(senderId);
//			params.add(answerId);
//			queryString=queryString+" and (model.answerId=? or model.answerId=?)";
//			params.add(senderId);
//			params.add(answerId);
//		queryString = queryString + " ORDER BY model.sendTime ASC";
//		return super.findByExample(queryString, params.toArray());
//		}else{
//			return null;
//		}
//	}
//
//
//	@Override
//	public List<ChatInfo> findByGuideTreacherId(Integer teacherId,
//			Integer year, String chatType, List<ListStudentAllotGuide> allotGuideStudentList) {
//
//		String queryString = "from ChatInfo model where 1=1 ";
//		List<Object> params = new ArrayList<Object>();
//		if(null!=chatType && !"".equals(chatType)){
//			queryString=queryString+" and chatType = ? ";
//			params.add(chatType);
//		}
//
//		if(teacherId!=null && year!=null){
//			if(allotGuideStudentList.size() > 0 && teacherId!=null){
//				queryString += " and ( senderId = ? or";
//				params.add(teacherId);
//				for (int i = 0; i < allotGuideStudentList.size(); i++) {
//					if(i != allotGuideStudentList.size() - 1){
//						queryString +=  " senderId = ? or ";
//						params.add(allotGuideStudentList.get(i).getStuId());
//					}else{
//						queryString += " senderId = ?) ";
//						params.add(allotGuideStudentList.get(i).getStuId());
//					}
//				}
//			}
//			queryString=queryString+" and year = ?";
//			params.add(year);
//		    queryString = queryString + " ORDER BY model.sendTime ASC";
//		    return super.findByExample(queryString, params.toArray());
//		}else{
//			return null;
//		}
//	}
//
//
//	@Override
//	public List<ChatInfo> findByAnswerId(ChatInfo chatInfo) {
//		String queryString = "from ChatInfo model where 1=1 ";
//		List<Object> params = new ArrayList<Object>();
//		if(null!=chatInfo.getAnswerId() && !"".equals(chatInfo.getAnswerId())){
//			queryString=queryString+" and answerId = ? ";
//			params.add(chatInfo.getAnswerId());
//		}
//		if(null!=senderId && !"".equals(senderId)){
//			queryString=queryString+" and senderId = ? ";
//			params.add(senderId);
//		}
//		if(null!=chatType && !"".equals(chatType)){
//			queryString=queryString+" and chatType = ? ";
//			params.add(chatType);
//		}
//		if(null!=readType && !"".equals(readType)){
//			queryString=queryString+" and readType = ? ";
//			params.add(readType);
//		}
//		return super.findByExample(queryString, params.toArray());
//	}
//
//
//	/**
//	 * 更新阅读条数状态
//	 */
//	@Override
//	public void updateReadType(Integer answerId, Integer senderId, String readType) {
//		String updateString = "";
//		List<Object> params = new ArrayList<Object>();
//		if(null!=answerId && !"".equals(answerId)&&(null!=senderId && !"".equals(senderId))){
//			updateString = "update ChatInfo set  ";
//			updateString = updateString+" readType = ?";
//			params.add(readType);
//			updateString = updateString+" where answerId = ? and senderId = ? ";
//			params.add(answerId);
//			params.add(senderId);
//		}
//		super.bulkUpdate(updateString, params.toArray(), null);
//	}
//
//
//	@Override
//	public void updateByChatId(Integer chatId, String readType) {
//		String updateString = "";
//		List<Object> params = new ArrayList<Object>();
//		if(null!=chatId && !"".equals(chatId)){
//			updateString = "update ChatInfo set  ";
//			updateString = updateString+" readType = ?";
//			params.add(readType);
//			updateString = updateString+" where chatId = ? ";
//			params.add(chatId);
//		}
//		super.bulkUpdate(updateString, params.toArray(), null);
//	}
//
//	@Override
//	@Transactional
//	public Integer findChatCountByTeacherIdOrStudentId(Integer userId) {
//		Integer size = 0;
//		try {
//		Criteria criteria = getSessionFactory().getCurrentSession().createCriteria(ChatInfo.class);
//		//查询个人消息数量
//			size = criteria.add(
//					Restrictions.or(
//							Restrictions.and(
//									Restrictions.eq("readType", String.valueOf(1)),
//									Restrictions.eq("answerId", userId)),
//							Restrictions.and(
//									Restrictions.eq("answerId", 1),
//									Restrictions.like("readType", String.valueOf(userId), MatchMode.ANYWHERE))))
//					.list().size();
//		}catch (Exception e){
//			e.printStackTrace();
//		}
//		return size;
//	}

    /**
     * 查询私聊未读消息
     *
     * @param userHelp
     * @return
     */
    @Override
    public List<ChatInfo> findNewChatMessage(UserHelp userHelp) {

        ChatInfo chatInfo = new ChatInfo();

        chatInfo.setAnswerId(userHelp.getId());//接收人
        chatInfo.setReadType(SystemContext.CHAT_NOT_READ_STATUS);//未阅读
        ArrayList<ChatInfo> arrayList = new ArrayList<>();
        List<ChatInfo> tmp = find(chatInfo, 1, Integer.MAX_VALUE).getData();
        //处理消息头像
        for (ChatInfo v : tmp) {
            String userImg = iUserHelpDao.findById(v.getSenderId()).getUserImg();
            v.setAvatar(StringUtils.isNotBlank(userImg) ? userImg : SystemContext.DEFAULT_PERSON_AVATAR);
            arrayList.add(v);
        }

        return arrayList;
    }

    /**
     * 更新群聊状态为已读
     *
     * @param groupId
     * @param answerId
     */
    @Override
    public void updateReadGroupChatStatus(String groupId, String answerId) {
        ChatInfo chatInfo = new ChatInfo();
        chatInfo.setAnswerId(Integer.parseInt(answerId));
        chatInfo.setChatType(SystemContext.CHAT_GROUP);//群聊
        chatInfo.setAnswerId(Integer.parseInt(groupId));
        chatInfo.setAnswerName(answerId);
        List<ChatInfo> res = find(chatInfo, 1, Integer.MAX_VALUE).getData();
        for (ChatInfo v : res) {

            String receives = v.getAnswerName();//获取群聊的所有接收者，将本人的id剔除即为已读

            if (receives.contains(answerId)){

                v.setAnswerName(receives.replace(answerId,""));
            }

            this.update(v);
        }
    }

    /**
     * 更新私聊消息状态为已读
     *
     * @param sendId
     * @param answerId
     */
    @Override
    public void updateReadSingleChatStatus(String sendId, String answerId) {
        ChatInfo chatInfo = new ChatInfo();
        chatInfo.setAnswerId(Integer.parseInt(answerId));
        chatInfo.setChatType(SystemContext.CHAT_PRIVATE_TYPE);
        chatInfo.setSenderId(Integer.parseInt(sendId));
        List<ChatInfo> res = find(chatInfo, 1, Integer.MAX_VALUE).getData();
        for (ChatInfo v : res) {
            v.setReadType(SystemContext.CHAT_ALREADY_READ);
            this.update(v);
        }
    }

    /**
     * 查询群聊未读消息
     *
     * @param userHelp
     */
    @Override
    public List<ChatInfo> findNewGroupChatMessage(UserHelp userHelp) {
        ChatInfo chatInfo = new ChatInfo();
        chatInfo.setChatType(SystemContext.CHAT_GROUP);//群聊
        chatInfo.setAnswerName(userHelp.getId().toString());
        return find(chatInfo, 1, Integer.MAX_VALUE).getData();

    }

}
