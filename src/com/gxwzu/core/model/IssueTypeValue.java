package com.gxwzu.core.model;

import java.util.List;

public class IssueTypeValue<T,E> {
	
	String IssueTypeName;
	List<String> value;
	
	
	
	public IssueTypeValue(String IssueTypeName, List<String> value) {
		super();
		this.IssueTypeName = IssueTypeName;
		this.value = value;
	}
	public String getIssueTypeName() {
		return IssueTypeName;
	}
	public void setIssueTypeName(String issueTypeName) {
		IssueTypeName = issueTypeName;
	}

	
	public List<String> getValue() {
		return value;
	}
	public void setValue(List<String> value) {
		this.value = value;
	}
	@Override
	public String toString() {
		return "IssueTypeNum [IssueTypeName=" + IssueTypeName + ", value="
				+ value + "]";
	}

}
