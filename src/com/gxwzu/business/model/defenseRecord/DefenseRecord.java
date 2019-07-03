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
		public void setStuId(Integer stuId) {
			this.stuId = stuId;
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
		public void setYear(Integer year) {
			this.year = year;
		}
		public String getDefenseContent() {
			return defenseContent;
		}
		public void setDefenseContent(String defenseContent) {
			this.defenseContent = defenseContent;
		}
		
}
