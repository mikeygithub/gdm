package com.gxwzu.system.model.sysOperation;

import com.gxwzu.system.model.sysGroup.SysGroup;


/**
 * 系统操作实体
 * @author he
 *
 */
public class SysOperation {
	private Integer operationId;
	private String operationName;   //操作名称
	private String operationPerm;   //操作权限
	private Integer groupId; //分组ID
	private SysGroup sysGroup = new SysGroup(); //分组
	public SysOperation() {
		super();
	}

	public Integer getOperationId() {
		return operationId;
	}

	public void setOperationId(Integer operationId) {
		this.operationId = operationId;
	}

	public String getOperationName() {
		return operationName;
	}

	public void setOperationName(String operationName) {
		this.operationName = operationName;
	}

	public String getOperationPerm() {
		return operationPerm;
	}

	public void setOperationPerm(String operationPerm) {
		this.operationPerm = operationPerm;
	}

	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public SysGroup getSysGroup() {
		return sysGroup;
	}

	public void setSysGroup(SysGroup sysGroup) {
		this.sysGroup = sysGroup;
	}
	
}
