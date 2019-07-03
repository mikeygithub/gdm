package com.gxwzu.business.service.replyScore;

import java.util.List;

import com.gxwzu.business.model.replyScore.ReplyScore;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.sysVO.ListReplyScore;

public interface IReplyScoreSerivce extends BaseService<ReplyScore> {

	public Result<ListReplyScore> find(ReplyScore model, int page, int size);

	public List<ListReplyScore> findByExample(ReplyScore model);
	
	public ListReplyScore findViewModelById(Integer id);
	
	public ReplyScore findById(Integer id);

	public void del(Integer id);

	public ListReplyScore findByStuIdAndReplyTypeAndYear(Integer stuId,
			String replyType, Integer year);

	public ListReplyScore findByStudentIdAndYear(Integer stuId, Integer year);

	public void updateByStuId(Integer stuId, int replyScoreFinish, String grade, float replyScore);

	public ReplyScore findExcellentStudntBySudentReplyType(int replyScoreFinish, String replyType);

}
