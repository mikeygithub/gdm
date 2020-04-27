package com.gxwzu.business.model.score;

/**
 * ScoreItem entity. @author MyEclipse Persistence Tools
 */

public class ScoreItem implements java.io.Serializable {

	// Fields

	private Integer scoreItemId;
	private String itemGroupNo;
	private String itemName;
	private Integer itemScore;
	private Integer weight;
	private String itemType;
	private Integer year;

	// Constructors

	/** default constructor */
	public ScoreItem() {
	}

	/** full constructor */
	public ScoreItem(String itemGroupNo, String itemName, Integer itemScore,
			Integer weight, String itemType, Integer year) {
		this.itemGroupNo = itemGroupNo;
		this.itemName = itemName;
		this.itemScore = itemScore;
		this.weight = weight;
		this.itemType = itemType;
		this.year = year;
	}

	// Property accessors

	public Integer getScoreItemId() {
		return this.scoreItemId;
	}

	public void setScoreItemId(Integer scoreItemId) {
		this.scoreItemId = scoreItemId;
	}

	public String getItemGroupNo() {
		return this.itemGroupNo;
	}

	public void setItemGroupNo(String itemGroupNo) {
		this.itemGroupNo = itemGroupNo;
	}

	public String getItemName() {
		return this.itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public Integer getItemScore() {
		return this.itemScore;
	}

	public void setItemScore(Integer itemScore) {
		this.itemScore = itemScore;
	}

	public Integer getWeight() {
		return this.weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public String getItemType() {
		return this.itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

	public Integer getYear() {
		return this.year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	@Override
	public String toString() {
		return "ScoreItem{" +
				"scoreItemId=" + scoreItemId +
				", itemGroupNo='" + itemGroupNo + '\'' +
				", itemName='" + itemName + '\'' +
				", itemScore=" + itemScore +
				", weight=" + weight +
				", itemType='" + itemType + '\'' +
				", year=" + year +
				'}';
	}
}