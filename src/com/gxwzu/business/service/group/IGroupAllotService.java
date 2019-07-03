package com.gxwzu.business.service.group;

import java.util.List;

import com.gxwzu.business.model.group.GroupAllot;
import com.gxwzu.business.model.group.GroupTeacher;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.sysVO.ListGroupAllot;

public interface IGroupAllotService extends BaseService<GroupAllot>{

	public  GroupAllot del(Integer id);

	public  GroupAllot edit(GroupAllot model);

	public  GroupAllot findById(Integer thisId);

	public  GroupAllot add(GroupAllot model);

	public  Result<ListGroupAllot> find(GroupAllot model, int page, int row);
    /**
     * 查询分组列表
     * @author 俸捷
     * @return
     */
	public  List<GroupAllot> finAllGroupAllotList();

	public GroupAllot findGroupAllotById(Integer id);

	/**
	 * 打开分组修改页面
	 * @author 黎艺侠
	 * @return
	 */
	public List<ListGroupAllot> findByExample(GroupAllot model);

	public ListGroupAllot findViewModelById(Integer thisId);

	/**
	 * 通过分组类型 和年度查询分组信息
	 * @param year
	 * @return
	 */
	public List<ListGroupAllot> findByGroupTypeAndYear(String groupType,
			Integer year);

}
