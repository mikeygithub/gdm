package com.gxwzu.system.action.sysRole;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.xwork.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.gxwzu.core.model.ZTreeModel;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.system.model.sysGroup.SysGroup;
import com.gxwzu.system.model.sysMenu.SysMenu;
import com.gxwzu.system.model.sysOperation.SysOperation;
import com.gxwzu.system.model.sysPermission.SysPermission;
import com.gxwzu.system.model.sysRole.SysRole;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.system.service.sysMenu.ISysMenuService;
import com.gxwzu.system.service.sysPermission.ISysPermissionService;
import com.gxwzu.system.service.sysRole.ISysRoleService;
import com.gxwzu.system.service.userHelp.IUserHelpService;

/**
 * 角色管理控制层
 * 
 * @author he
 * 
 */
public class SysRoleAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected final Log logger = LogFactory.getLog(getClass());

	/********************** 对象实例化 *******************/
	private SysRole model = new SysRole();

	public SysRole getModel() {
		return model;
	}

	public void setModel(SysRole model) {
		this.model = model;
	}

	/*********************** Service接口注入 ***************************/
	@Autowired
	private ISysRoleService sysRoleService; // 角色service
	@Autowired
	private ISysPermissionService sysPermissionService;
	@Autowired
	private ISysMenuService sysMenuService; // 菜单service
	@Autowired
	private IUserHelpService userHelpService;
	/******************** 变量声明 *********************/
	private Result<SysRole> pageResult;
	private Result<UserHelp> pageResult1;
	private Integer thisId;
	private String thisIds; // 批量删除Ids
	private String perms;    //权限集合字符串
	private List<String> roleIds;
	private String userType;
	private String mark;
	private List<SysMenu> menuList = new ArrayList<SysMenu>();
	private List<ZTreeModel> treeModels = new ArrayList<ZTreeModel>();

	/************************ 方法体 ********************/

	/**
	 * 角色管理列表
	 * 
	 * @return
	 */
	public String list() {
		logger.info("角色管理列表");
		try {
			SysRole sysRole = new SysRole();
			pageResult = sysRoleService.find(sysRole, getPage(), getRow());
			footer = PageUtil.pageFooter(pageResult, getRequest());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	/**
	 * 打开角色添加页面
	 * 
	 * @return
	 */
	public String openAdd() {
		logger.info("打开角色添加页面");
		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	/**
	 * 添加角色
	 * 
	 * @return
	 */
	public String add() {
		logger.info("添加角色" + perms);
		try {
			if (null != model) {
				model.setPermissions(spiltPerms(new HashSet<SysPermission>(),perms));
				model = sysRoleService.add(model);
				mark = "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list();
	}

	/**
	 * 打开角色修改页面
	 * 
	 * @return
	 */
	public String openEdit() {
		logger.info("打开角色修改页面");
		try {

			model = sysRoleService.findById(thisId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	/**
	 * 修改角色信息
	 * 
	 * @return
	 */
	public String edit() {
		logger.info("修改角色信息");
		try {
			SysRole sysRole = sysRoleService.findById(model.getId());
			if (model.getDescription() != null) {
				sysRole.setDescription(model.getDescription());
			}
			sysPermissionService.delByRoleId(model.getId());
			Set<SysPermission> set = new HashSet<SysPermission>();;
			sysRole.setPermissions(spiltPerms(set, perms));
			sysRoleService.edit(sysRole);
			mark = "1";
		} catch (Exception e) {
			e.printStackTrace();
			mark = "0";
		}
		return list();
	}

	/**
	 * 删除角色信息
	 * 
	 * @return
	 */
	public String del() {
		logger.info("删除角色信息");
		try {
			sysRoleService.del(thisId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list();
	}

	/**
	 * 角色成员管理列表
	 * 
	 * @return
	 */
	public String openUserRoleList() {
		logger.info("角色成员管理列表");
		try {
			if (thisId != null) {
				model.setId(thisId);
				pageResult1 = sysRoleService.findUserRoleList(model, getPage(),
						getRow());
				footer = PageUtil.pageFooter(pageResult1, getRequest());
				model = sysRoleService.findById(thisId);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	/**
	 * 单个/批量移除角色用户信息
	 * 
	 * @return
	 * @throws IOException
	 */
	public String removeUser() {
		logger.info(" 单个/批量移除角色用户信息");
		boolean isdel = false;
		try {
			PrintWriter out = getResponse().getWriter();
			if (thisId != null&&thisIds != null) {
				SysRole sysRole = sysRoleService.findById(thisId);
				String[] tis = thisIds.split(",");
				Set<UserHelp> set = sysRole.getUserHelps();
				for (int i = 0; i < tis.length; i++) 
					if (!"".equals(tis[i]))  removeUser(set,Integer.parseInt(tis[i]));
				
				sysRoleService.update(sysRole);
				isdel = true;
			}
			out.print(isdel);
			out.flush();
			out.close();
		} catch (Exception e) {
			logger.info("单个/批量移除角色用户信息失败");
		}

		return null;
	}
	
	/**
	 * 添加相应角色到所有学生/老师用户
	 * 
	 * @return
	 * @throws IOException
	 */
	public String addRoleToAllUser() {
		logger.info(" 添加相应角色到所有学生/老师用户");
		boolean isdel = false;
		try {
			PrintWriter out = getResponse().getWriter();
			if (thisId != null&&userType != null) {
				SysRole sysRole = sysRoleService.findById(thisId);
				Set<UserHelp> set = sysRole.getUserHelps();
			    getUserSet(set,userType);
				sysRoleService.update(sysRole);
				isdel = true;
			}
			out.print(isdel);
			out.flush();
			out.close();
		} catch (Exception e) {
			logger.info("添加相应角色到所有学生/老师用户");
		}

		return null;
	}
	/**
	 * 获取用户集合
	 * 
	 * @param set
	 * @param perms
	 * @return
	 */
	private Set<UserHelp> getUserSet(Set<UserHelp> set,String userType) {
		if (set == null)
			set = new HashSet<UserHelp>();
		UserHelp userHelp = new UserHelp();
		userHelp.setUserType(userType);
		Result<UserHelp> pageResult = userHelpService.find(userHelp,getPage(), getRow());
		for(int i = 1;pageResult!=null&&pageResult.getData()!=null&&pageResult.getData().size()>0;i++){
		set.addAll(pageResult.getData());
		pageResult = userHelpService.find(userHelp,i+1, getRow());
		}
		return set;
	}

	
	
	
	
	
	
	
	
	
	/**
	 * 移除角色用户
	 * @param set
	 * @param userId
	 * @return
	 */
	private Set<UserHelp>   removeUser(Set<UserHelp> set, Integer userId) {
		   Iterator<UserHelp> uIterator = set.iterator();
				while (uIterator.hasNext()) {
					UserHelp u = uIterator.next();
					if (u.getId().equals(userId)) {
						set.remove(u);
						break;
					}
		}
	  return set;
	}

	/**
	 * 查询系统权限
	 * 
	 * @return
	 */
	public void findPerm() {
		logger.info("查询系统权限");
		try {
			menuList = sysMenuService.findAll(SysMenu.class);
			List<SysPermission> sList = new ArrayList<SysPermission>();
			if (thisId != null) {
				sList = sysRoleService.findById(thisId).getPermissionList();
			}
			HttpServletResponse response = getResponse();
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			Gson g = new Gson();
			String json = g.toJson(new Gson().toJson(getTreeData(menuList,
					sList)));
			PrintWriter pw = response.getWriter();
			pw.print(json);
			pw.flush();
			pw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取权限树数据
	 * 
	 * @param menuList
	 */
	private List<ZTreeModel> getTreeData(List<SysMenu> menuList,
			List<SysPermission> permList) {

		treeModels.add(new ZTreeModel(0, -1, "所有权限", "", true));
		for (int i = 0; i < menuList.size(); i++) {
			SysMenu sysMenu = menuList.get(i);
			treeModels.add(new ZTreeModel(i + 1, 0, sysMenu.getMenuName(),
					sysMenu.getMenuPerm(), false));
			for (int j = 0; j < sysMenu.getSysGroupList().size(); j++) {
				SysGroup sysGroup = sysMenu.getSysGroupList().get(j);
				treeModels
						.add(new ZTreeModel(i + 1 + (j + 1) * 10, i + 1,
								sysGroup.getGroupName(), sysGroup
										.getGroupPerm(), false));
				for (int k = 0; k < sysGroup.getOperationList().size(); k++) {
					SysOperation sysOperation = sysGroup.getOperationList()
							.get(k);
					treeModels.add(new ZTreeModel(i + 1 + (j + 1) * 10
							+ (k + 1) * 100, i + 1 + (j + 1) * 10, sysOperation
							.getOperationName(), sysOperation
							.getOperationPerm(), true));
				}
			}
		}
		// 检查是否存在权限
		if (permList.size() > 0) {
			treeModels.get(0).setChecked(true);
			for (ZTreeModel zModel : treeModels)
				if (existPerm(0, permList.toArray(), zModel.getAliasName()))
					zModel.setChecked(true);
		}
		return treeModels;
	}

	/**
	 * 递归是否存在权限
	 * 
	 * @param i
	 * @param objects
	 * @param perm
	 * @return
	 */
	private boolean existPerm(int i, Object[] objects, String perm) {
		if (i == (objects.length))
			return false;
		SysPermission sPermission = (SysPermission) objects[i];
		if (sPermission.getResource().equals(perm))
			return true;
		return existPerm(i + 1, objects, perm);
	}

	/**
	 * 分割权限字符串获取权限
	 * 
	 * @param set
	 * @param perms
	 * @return
	 */
	private Set<SysPermission> spiltPerms(Set<SysPermission> set, String perms) {
		if (set == null)
			set = new HashSet<SysPermission>();
		if (perms == null)
			return set;
		for (String perm : perms.split(",")) {
			if (StringUtils.isEmpty(perm))
				continue;
			set.add(new SysPermission(perm));
		}
		return set;
	}

	/**
	 * 检查角色名称是否存在
	 * 
	 * @return
	 */
	public void checkName() throws Exception {
		logger.info("检查角色是否存在" + model.getRoleName());
		try {
			PrintWriter out = getResponse().getWriter();

			List<SysRole> lists = sysRoleService.findByExample(model);

			if (null != lists && lists.size() > 0) {// 不可用
				out.print("false");
			} else {// 可用
				out.print("true");
			}
			out.flush();
			out.close();
		} catch (Exception e) {
			logger.info("检查角色出错");
		}
	}

	/*********************** setter/getter方法 ***************************/
	public Result<SysRole> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<SysRole> pageResult) {
		this.pageResult = pageResult;
	}

	public Integer getThisId() {
		return thisId;
	}

	public void setThisId(Integer thisId) {
		this.thisId = thisId;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public ISysMenuService getSysMenuService() {
		return sysMenuService;
	}

	public void setSysMenuService(ISysMenuService sysMenuService) {
		this.sysMenuService = sysMenuService;
	}

	public List<SysMenu> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<SysMenu> menuList) {
		this.menuList = menuList;
	}

	public List<ZTreeModel> getTreeModels() {
		return treeModels;
	}

	public void setTreeModels(List<ZTreeModel> treeModels) {
		this.treeModels = treeModels;
	}

	public String getPerms() {
		return perms;
	}

	public void setPerms(String perms) {
		this.perms = perms;
	}

	public Result<UserHelp> getPageResult1() {
		return pageResult1;
	}

	public void setPageResult1(Result<UserHelp> pageResult1) {
		this.pageResult1 = pageResult1;
	}

	public String getThisIds() {
		return thisIds;
	}

	public void setThisIds(String thisIds) {
		this.thisIds = thisIds;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public List<String> getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(List<String> roleIds) {
		this.roleIds = roleIds;
	}

}
