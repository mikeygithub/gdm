package com.gxwzu.util;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gxwzu.system.model.sysPermission.SysPermission;
import com.gxwzu.system.model.sysRole.SysRole;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.system.service.sysGroup.ISysGroupService;
import com.gxwzu.system.service.sysMenu.ISysMenuService;
import com.gxwzu.system.service.sysOperation.ISysOperationService;
import com.gxwzu.system.service.sysPermission.ISysPermissionService;
import com.gxwzu.system.service.sysRole.ISysRoleService;
import com.gxwzu.system.service.userHelp.IUserHelpService;



	@RunWith(SpringJUnit4ClassRunner.class)
	@ContextConfiguration(locations = { "classpath:conf/applicationContext-hibernate.xml" 
   ,"classpath:conf/applicationContext-resource.xml","classpath:conf/applicationContext-service.xml",
   "classpath:conf/applicationContext-security.xml"
	})
	public class Tests {

		private static final Logger LOGGER = Logger
				.getLogger(Tests.class);

 
		
		@Autowired
		IUserHelpService userHelpService;
		
		@Autowired
		ISysRoleService sysRoleService;
		@Autowired
		ISysPermissionService sysPermissionService;
		@Autowired
		ISysMenuService sysMenuService;
		@Autowired
		ISysGroupService sysGroupService;
		@Autowired
		ISysOperationService sysOperationService;
		
		@Test
		public void save() {

		}
		
		
		
//		@Test
		public void userRole() {
			UserHelp userHelp = new UserHelp();
			userHelp.setLoginName("11");
			userHelp.setPassword("122");
			 long time =  new Date().getTime();
			 userHelp.setOpTime(new Timestamp(time));
			Set<SysRole> set = new HashSet<SysRole>();
			set.add(sysRoleService.findById(35));
			userHelp.setSysRoles(set);
			userHelpService.add(userHelp);
			
		}
		
		 // 权限
		@Test
		public void perm() {
		
			SysRole sysRole = new SysRole();
			sysRole.setRoleName("系统");
			SysRole sysRole1 = sysRoleService.findById(35);
//			Set<SysPermission> sysPermissions =sysRole.getPermissions();
			Set<SysPermission> sysPermissions =new HashSet<SysPermission>();
			/*for(int j= 0 ;j<5;j++){
				SysPermission sysPermission = new SysPermission();
				sysPermission.setResource("perm:add");
				sysPermission.setRoleId(45);
				sysPermissions.add(sysPermission);
			}*/
//			sysPermissionService.delByRoleId(45);
//			sysRole1.setPermissions(sysPermissions);
			//sysRoleService.add(sysRole);
//			sysRoleService.update(sysRole1);
//			sysRole1.setPermissions(sysPermissions);
//			sysRoleService.edit(sysRole1);
  
			Set<UserHelp> set = sysRole1.getUserHelps();
//			set.add(userHelpService.findById(22664));
			Iterator<UserHelp > uIterator = set.iterator();
					while(uIterator.hasNext()){
						UserHelp u = uIterator.next();
						if(u.getId().equals(22664)){
							set.remove(u);
							break;
						}
					}
			sysRoleService.update(sysRole1);
			System.out.println(sysRole1.getUserHelps().size());
		}
		
	/*	  角色
		@Test
		public void role() {
			
			SysMenu sysMenu = new SysMenu();
			sysMenu.setMenuName("系统管理");
			sysMenu.setMenuPerm("权限");
			Set<SysGroup> sysGroups = new HashSet<SysGroup>();
			for(int i= 0 ;i<5;i++){
			SysGroup sysGroup = new SysGroup();
			sysGroup.setGroupName("用户管理"+i);
			sysGroup.setGroupPerm("权限"+i);
			
			Set<SysOperation> sysOperations = new HashSet<SysOperation>();
			
			for(int j= 0 ;j<5;j++){
				SysOperation sysOperation = new SysOperation();
				sysOperation.setOperationName("添加"+j);
				sysOperation.setOperationPerm("添加权限"+j);
				sysOperations.add(sysOperation);
			}
			sysGroup.setOperations(sysOperations);
			
			sysGroups.add(sysGroup);
			}
			sysMenu.setSysGroups(sysGroups);
			sysMenuService.add(sysMenu);
		}
		*/
		
		@Test
		public void query() {
			
		/*	RepairImages repairImages = new RepairImages();
			repairImages =repairImagesService.findById(64);
			repairImages.setRepairId(9);
			repairImagesService.update(repairImages);
			Repair repair = new  Repair();*/
//			System.out.println(repairService.save(repair));
			//weiXinDao.find();
//			weiXinDao.save(null);
//			Repair repair = new Repair();
//			repair.setApprovalNo("dddsssdd");
//			customerAccessTokenServer.find();
			//customerAccessTokenDao.save(new AccessToken());
			/*Maintenance maintenance
			 = new Maintenance();
			maintenance.setRapairId(2);
			maintenance.setExFinishTime(Timestamp.valueOf(new Date().toLocaleString()));
			maintenanceService.save(maintenance);*/
//			repairService.del(4);
//			maintenance.setRapairId(repair.getId());
			
		/*	StuClass stuClass = stuClassService.findById(6);
			UserHelp user  = new UserHelp();
			user.setLoginName("admin");
			List<UserHelp> us = userHelpDao.findByExample(user); */
//		       if(us == null ||us.size()<=0|| !us.get(0).getPassword().equals("")) { }
			/*SysPermission sysPermission = sysPermissionDao.findById(5);
			System.out.println(sysPermission.getRoles());*/
			/*SysRole sysRole = new  SysRole();
			UserHelp user = new UserHelp();*/
			//userHelpDao.update(user);
			//user.setSysRole(userHelp);
			//userHelpDao.save(user);
			//System.out.println(user.getSysRole().getRoleName());
			//sysPermission.getRoleList();
		}
}
