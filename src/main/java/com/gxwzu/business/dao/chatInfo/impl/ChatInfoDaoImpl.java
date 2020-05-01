package com.gxwzu.business.dao.chatInfo.impl;

import java.util.ArrayList;
import java.util.List;

import com.gxwzu.core.context.SystemContext;
import com.gxwzu.system.dao.userHelp.IUserHelpDao;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.util.R;
import org.apache.commons.lang.xwork.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.chatInfo.IChatInfoDao;
import com.gxwzu.business.model.chatInfo.ChatInfo;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;

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

        queryString = queryString + " ORDER BY model.sendTime ASC";

        return (Result<ChatInfo>) super.find(queryString, params.toArray(), null, start, limit);
    }
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

                this.update(v);
            }

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
        List<ChatInfo> data = find(chatInfo, 1, Integer.MAX_VALUE).getData();
        ArrayList<ChatInfo> res = new ArrayList<>();
        //resolve message head image
        for (ChatInfo tmp:data){
            UserHelp send = iUserHelpDao.findById(tmp.getSenderId());
            tmp.setAvatar(StringUtils.isNotBlank(send.getUserImg())?send.getUserImg():SystemContext.DEFAULT_PERSON_AVATAR);
            res.add(tmp);
        }
        return res;
    }

    /**
     * 查询群聊消息记录
     * @param id
     * @param curr
     * @param limit
     * @return
     */
    @Override
    public R findGroupChatLog(Integer id, int curr, int limit) {

        int start = (curr - 1) * limit;
        List<ChatInfo> chatInfoList = new ArrayList<>();
        List<ChatInfo> res = new ArrayList<>();

        Session session = this.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(ChatInfo.class);
        Criteria criteriaTotal = session.createCriteria(ChatInfo.class);

        //查询总记录数目
        int size = criteriaTotal.add(Restrictions.eq("answerId", id)).add(Restrictions.eq("chatType", SystemContext.CHAT_GROUP)).list().size();

        if (size!=0) {
            //查询数据
            chatInfoList = criteria.add(
                    Restrictions.eq("answerId", id))
                    .add(Restrictions.eq("chatType", SystemContext.CHAT_GROUP))//群聊
                    .addOrder(Order.desc("sendTime"))
                    .setFirstResult(start)
                    .setMaxResults(limit)
                    .list();

        }
        //处理头像
        for (ChatInfo tmp:chatInfoList){
            UserHelp sender = iUserHelpDao.findById(tmp.getSenderId());
            tmp.setAvatar(StringUtils.isNotBlank(sender.getUserImg())?sender.getUserImg():SystemContext.DEFAULT_PERSON_AVATAR);
            res.add(tmp);
        }

        session.close();

        return R.ok().add("total",size).add("list",res);
    }

    /**
     * 查询私聊信息记录
     * @param senderId 发送者id
     * @param answerId　接收者id
     * @param curr 当前页码
     * @param limit 每页大小
     * @return
     *
     * select * from chat_info
     * where
     *  (answer_id = 608 and sender_id = 892 and chat_type = 0)
     *    or
     *  (answer_id = 892 and sender_id = 608 and chat_type = 0)
     *
     * order by send_time asc
     */
    @Override
    public R findFriendChatLog(Integer senderId,Integer answerId, int curr, int limit) {

        int start = (curr - 1) * limit;
        List<ChatInfo> tmpArr = new ArrayList();
        List res = new ArrayList();
        Session session = this.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(ChatInfo.class);
        Criteria criteriaTotal = session.createCriteria(ChatInfo.class);

        int size = criteria.add(Restrictions.or(
                Restrictions.and(Restrictions.eq("answerId", answerId), Restrictions.eq("senderId", senderId))
                , Restrictions.and(Restrictions.eq("senderId", answerId), Restrictions.eq("answerId", senderId)
                ))).add(Restrictions.eq("chatType", SystemContext.CHAT_PRIVATE_TYPE)).list().size();

        if (size!=0) {
            tmpArr = criteriaTotal.add(Restrictions.or(
                    Restrictions.and(Restrictions.eq("answerId", answerId), Restrictions.eq("senderId", senderId))
                    , Restrictions.and(Restrictions.eq("senderId", answerId), Restrictions.eq("answerId", senderId)
                    ))).add(Restrictions.eq("chatType", SystemContext.CHAT_PRIVATE_TYPE)).addOrder(Order.desc("sendTime"))
                    .setFirstResult(start)
                    .setMaxResults(limit)
                    .list();
        }
        session.close();

        //处理头像
        for (ChatInfo tmp:tmpArr){
            UserHelp sender = iUserHelpDao.findById(tmp.getSenderId());
            tmp.setAvatar(StringUtils.isNotBlank(sender.getUserImg())?sender.getUserImg():SystemContext.DEFAULT_PERSON_AVATAR);
            res.add(tmp);
        }

        return R.ok().add("total",size).add("list",res);
    }

}
