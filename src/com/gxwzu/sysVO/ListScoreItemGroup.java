package com.gxwzu.sysVO;

import java.util.ArrayList;
import java.util.List;

import com.gxwzu.business.model.score.ScoreItem;

/**
 * ScoreItemGroup entity. @author MyEclipse Persistence Tools
 */

public class ListScoreItemGroup implements java.io.Serializable {

	// Fields

	private Integer itemGroupId;
	private String groupName;
	private Integer weight;
	private String groupPercent;
	private String groupType;
	private String groupNo;
	private Integer totalCount; //scoreItemList记录数
	private List<ScoreItem> scoreItemList = new ArrayList<ScoreItem>(); 
	// Constructors

	/** default constructor */
	public ListScoreItemGroup() {
	}

	/** full constructor */
	public ListScoreItemGroup(String groupName, Integer weight, String groupPercent,
			String groupType, String groupNo) {
		this.groupName = groupName;
		this.weight = weight;
		this.groupPercent = groupPercent;
		this.groupType = groupType;
		this.groupNo = groupNo;
	}

	// Property accessors

	public Integer getItemGroupId() {
		return this.itemGroupId;
	}

	public void setItemGroupId(Integer itemGroupId) {
		this.itemGroupId = itemGroupId;
	}

	public String getGroupName() {
		return this.groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public Integer getWeight() {
		return this.weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}



	public String getGroupPercent() {
		return groupPercent;
	}

	public void setGroupPercent(String groupPercent) {
		this.groupPercent = groupPercent;
	}

	public String getGroupType() {
		return this.groupType;
	}

	public void setGroupType(String groupType) {
		this.groupType = groupType;
	}

	public String getGroupNo() {
		return this.groupNo;
	}

	public void setGroupNo(String groupNo) {
		this.groupNo = groupNo;
	}

	public List<ScoreItem> getScoreItemList() {
		return scoreItemList;
	}

	public void setScoreItemList(List<ScoreItem> sItemList) {
		this.scoreItemList = sItemList;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	
	
}
