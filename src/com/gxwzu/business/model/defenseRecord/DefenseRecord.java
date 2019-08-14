package com.gxwzu.business.model.defenseRecord;

import java.util.Date;

public class DefenseRecord implements java.io.Serializable {
	// Fields

		private Integer defenseId;
		private String defenseContent;
		private Integer stuId;
		private Integer teacherId;
		private Integer year;
		
		
		public DefenseRecord() {
		}
		public DefenseRecord(Integer defenseId, String defenseContent, 
				Integer stuId, Integer teacherId, Integer year) {
			super();
			this.defenseId = defenseId;
			this.defenseContent = defenseContent;
			this.stuId = stuId;
			this.teacherId = teacherId;
			this.year = year;
		}
		public Integer getDefenseId() {
			return defenseId;
		}
		public void setDefenseId(Integer defenseId) {
			this.defenseId = defenseId;
		}
		public Integer getStuId() {
			return stuId;
		}
		public DefenseRecord setStuId(Integer stuId) {
			this.stuId = stuId;
			return this;
		}
		public Integer getTeacherId() {
			return teacherId;
		}
		public void setTeacherId(Integer teacherId) {
			this.teacherId = teacherId;
		}
		public Integer getYear() {
			return year;
		}
		public DefenseRecord setYear(Integer year) {
			this.year = year;
			return this;
		}
		public String getDefenseContent() {
			return defenseContent;
		}
		public void setDefenseContent(String defenseContent) {
			this.defenseContent = defenseContent;
		}

	@Override
	public String toString() {
		return "DefenseRecord{" +
				"defenseId=" + defenseId +
				", defenseContent='" + defenseContent + '\'' +
				", stuId=" + stuId +
				", teacherId=" + teacherId +
				", year=" + year +
				'}';
	}
}
