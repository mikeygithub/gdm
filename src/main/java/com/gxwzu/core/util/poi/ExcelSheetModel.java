package com.gxwzu.core.util.poi;

import java.util.List;

import com.gxwzu.core.base.BaseEntity;
/**
 * 
 * @author amu_1115
 *
 */
public class ExcelSheetModel extends BaseEntity {

	private static final long serialVersionUID = -4540462817430743118L;
	private  int sheetNum;//工作簿个数
	private  String sheetTitle;//工作簿名称
	private String[] headers;//表头列名
	private  Short[]columnWidth;//表头宽度
	private List result;//记录数
	private  int rowIndex=1;//行序号
	private String formContent;//填写信息
	/**
	 * 构造函数
	 * @param sheetNum
	 * @param sheetTitle
	 * @param headers
	 * @param columnWidth
	 * @param result
	 * @param rowIndex
	 */
	public ExcelSheetModel( int sheetNum,
			String sheetTitle, 
			List result, int rowIndex) {
		this.sheetNum = sheetNum;
		this.sheetTitle = sheetTitle;
		this.result = result;
		this.rowIndex = rowIndex;
	}

	public int getSheetNum() {
		return sheetNum;
	}
	public void setSheetNum(int sheetNum) {
		this.sheetNum = sheetNum;
	}
	public String getSheetTitle() {
		return sheetTitle;
	}
	public void setSheetTitle(String sheetTitle) {
		this.sheetTitle = sheetTitle;
	}
	public String[] getHeaders() {
		return headers;
	}
	public void setHeaders(String[] headers) {
		this.headers = headers;
	}
	
	public List getResult() {
		return result;
	}
	public void setResult(List result) {
		this.result = result;
	}
	public int getRowIndex() {
		return rowIndex;
	}
	public void setRowIndex(int rowIndex) {
		this.rowIndex = rowIndex;
	}

	public String getFormContent() {
		return formContent;
	}

	public void setFormContent(String formContent) {
		this.formContent = formContent;
	}

	public Short[] getColumnWidth() {
		return columnWidth;
	}

	public void setColumnWidth(Short[] columnWidth) {
		this.columnWidth = columnWidth;
	}
	

}
