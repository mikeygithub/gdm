package com.gxwzu.sysVO;

import org.joda.time.DateTime;

import com.gxwzu.business.model.paper.StudentPaper;
import com.gxwzu.core.util.ObjectUtil;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysFileType.SysFileType;
/**
 * 
 * SysClass entity. @author MyEclipse Persistence Tools
 *
 */
public class ListPaper implements java.io.Serializable{

	private Integer paperId;
	private String paperName;
	private Integer stuId;
	private Integer teacherId;
	private Integer year;
	private String path;
	private Integer fileSize;
	private String fileType;
	private String opTime;
	private String fileTypeName;
	
	
	/** default constructor 
	 * @param o 
	 * @return */
	public ListPaper(Object[] o) {
		super();
		this.paperId = ObjectUtil.getInteger(o[0]);
		this.paperName =  ObjectUtil.getString(o[1]);
		this.stuId =  ObjectUtil.getInteger(o[2]);
		this.teacherId =  ObjectUtil.getInteger(o[3]);
		this.year =  ObjectUtil.getInteger(o[4]);
		this.path =  ObjectUtil.getString(o[5]);
		this.fileSize =  ObjectUtil.getInteger(o[6]);
		this.fileType =  ObjectUtil.getString(o[7]);
		this.opTime =  ObjectUtil.getString(o[8]);
		this.fileTypeName =  ObjectUtil.getString(o[9]);
	}


	public Integer getPaperId() {
		return paperId;
	}
	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
	}
	public String getPaperName() {
		return paperName;
	}
	public void setPaperName(String paperName) {
		this.paperName = paperName;
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
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Integer getFileSize() {
		return fileSize;
	}
	public void setFileSize(Integer fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getFileTypeName() {
		return fileTypeName;
	}

	public void setFileTypeName(String fileTypeName) {
		this.fileTypeName = fileTypeName;
	}


	public String getOpTime() {
		return opTime;
	}


	public void setOpTime(String opTime) {
		this.opTime = opTime;
	}
	
}
