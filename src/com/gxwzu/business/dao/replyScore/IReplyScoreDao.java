package com.gxwzu.business.dao.replyScore;

import java.util.List;

import com.gxwzu.business.model.replyScore.ReplyScore;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListReplyScore;

/**
 * 答辩成绩及评语DAO
 * @author he
 *
 */
public interface IReplyScoreDao extends BaseDao<ReplyScore> {
	
	public Result<ReplyScore> find(ReplyScore model, int page, int size);

	public List<ReplyScore> findByExample(ReplyScore model);

	public void updateByStuId(Integer stuId,String replyLink, int replyScoreFinish, String grade, float replyScore);

	public ReplyScore findExcellentStudntBySudentReplyType(int replyScoreFinish, String replyType);
}
