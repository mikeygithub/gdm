package com.gxwzu.business.service.chatInfo;

import java.io.File;
import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.gxwzu.business.model.chatInfo.ChatInfo;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.sysVO.ListChatInfo;
import com.gxwzu.sysVO.ListStudentAllotGuide;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.util.R;
import io.netty.channel.ChannelHandlerContext;

public interface IChatInfoService extends BaseService<ChatInfo> {
	/**
	 * 加载聊天面板好友
	 * @param planYear
	 * @param loginName
	 * @return
	 */
	R loadChatFriend(PlanYear planYear, String loginName);

	/**
	 * 获取群员列表
	 * @param planYear
	 * @param loginName
	 * @return
	 */
	R loadGroupMembers(PlanYear planYear, String loginName);

    /**
     * 上传文件
     * @param upload
     * @return
     */
    R uploadChatFile(File upload,String uploadFileName);

	/**
	 * 上线注册
	 * @param param
	 * @param ctx
	 */
	void register(JSONObject param, ChannelHandlerContext ctx);

	/**
	 * 私聊
	 * @param param
	 * @param ctx
	 */
	void singleSend(JSONObject param, ChannelHandlerContext ctx);

	/**
	 * 群聊
	 * @param param
	 * @param ctx
	 */
	void groupSend(JSONObject param, ChannelHandlerContext ctx);

	/**
	 * 退出
	 * @param ctx
	 */
	void remove(ChannelHandlerContext ctx);

	/**
	 * 类型错误
	 * @param ctx
	 */
	void typeError(ChannelHandlerContext ctx);

	/**
	 * 已读消息
	 * @param param
	 * @param ctx
	 */
	void readChat(JSONObject param, ChannelHandlerContext ctx);

	R loadChatLog(Integer id, String type, int curr, int limit,String username);
}
