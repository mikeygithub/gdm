package com.gxwzu.system.dao.userHelp.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;
import org.springframework.stereotype.Repository;

import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.GeneralUtil;
import com.gxwzu.system.dao.userHelp.IUserHelpDao;
import com.gxwzu.system.model.userHelp.UserHelp;
/**
 * 用户dao
 * @author he
 *
 */
@SuppressWarnings("unchecked")
@Repository("UserHelpDao")
public class UserHelpDaoImpl  extends BaseDaoImpl<UserHelp>  implements IUserHelpDao{
	
	public Result<UserHelp> find(UserHelp model ,int page,int size){
		String queryString="from UserHelp model where 1=1 ";
		int start=(page-1)*size;
		int limit =size;
		List params=new ArrayList<Object>();
		if(model.getId()!=null&&!"".equals(model.getId())){
			 queryString =queryString+" and model.id=?";
	    	 params.add(model.getId());
		}
		if(StringUtils.isNotEmpty(model.getUserName())){
			queryString=queryString+" and model.userName like ?";
			params.add("%"+model.getUserName()+"%");
		}
		if(model.getLoginName()!=null&&!"".equals(model.getLoginName())){
			queryString=queryString+" and model.loginName=?";
			params.add(model.getLoginName());
		}
		if(StringUtils.isNotEmpty(model.getUserType())){
			if(model.getUserType().equals("0")){
				  queryString=queryString+" and (model.userType='1' or model.userType='2')";
			}else{
			   queryString=queryString+" and model.userType=?";
			   params.add(model.getUserType());
			}
		}
		
		
		queryString = queryString+" ORDER BY opTime DESC";
		
		return (Result<UserHelp>)super.find(queryString, params.toArray(), null, start, limit);
	}

	public UserHelp findById(Integer id) {
		log.debug("getting UserHelp instance with id: " + id);
		try {
			UserHelp instance = (UserHelp) getHibernateTemplate().get(
					"com.gxwzu.system.model.userHelp.UserHelp", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	  public List<UserHelp> findByExample(UserHelp model){
		  List  params=new ArrayList<Object>();
		  String queryString="from UserHelp model where 1=1";
		  if(model.getId()!=null&&!"".equals(model.getId())){
				 queryString =queryString+" and model.id=?";
		    	 params.add(model.getId());
			}
			if(model.getUserName()!=null&&!"".equals(model.getUserName())){
				queryString=queryString+"and model.userName=?";
				params.add(model.getUserName());
			}
			if(model.getLoginName()!=null&&!"".equals(model.getLoginName())){
				queryString=queryString+"and model.loginName=?";
				params.add(model.getLoginName());
			}
			if(model.getPassword()!=null&&!"".equals(model.getPassword())){
				queryString=queryString+"and model.password=?";
				params.add(model.getPassword());
			}
			
			if(model.getUserType()!=null&&!"".equals(model.getUserType())){
				
				if(model.getUserType().equals("0")){   //查找后勤用户
					queryString=queryString+" and model.userType=1 OR model.userType=2";
				}else{
					
				queryString=queryString+"and model.userType=?";
				params.add(model.getUserType());
				}
			}
			Object[] objects = new Object[params.size()];
			for(int i = 0;i<params.size();i++){
				objects[i] = params.get(i);
			}
			queryString = queryString+" ORDER BY opTime DESC";
			return super.findByExample(queryString, objects);
	  }

	@Override
	public List<UserHelp> findByNamePawd(UserHelp model) {
		List<UserHelp> list = new ArrayList<UserHelp>();
		List<Object> params = new ArrayList<Object>();
		if(!GeneralUtil.isEmpty(model.getLoginName(),model.getPassword())){
			String queryString = "from UserHelp model where  model.loginName=? and model.password=?";
			params.add(model.getLoginName());
			params.add(model.getPassword());
			list = super.findByExample(queryString, params.toArray());
		}
		return list;
	}

	@Override
	public List<UserHelp> findByLoginName(String loginName) {
		List<UserHelp> list = new ArrayList<UserHelp>();
		List<Object> params = new ArrayList<Object>();
		if(!GeneralUtil.isEmpty(loginName)){
			String queryString = "from UserHelp model where  model.loginName=?";
			params.add(loginName);
			list = super.findByExample(queryString, params.toArray());
		}
		return list;
	}
	

}
