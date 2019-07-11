package com.gxwzu.system.action.login;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;

import com.gxwzu.core.web.action.BaseAction;

@SuppressWarnings("serial")
public class DownloadAction extends BaseAction {
	protected final Log logger = LogFactory.getLog(getClass());
	private String fileName;
	private String filePath;
	private Integer fileLength;

	public InputStream isStream;

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public String execute() {
		try {
			
			if (filePath != null) {
				
				if (fileName == null||"".equals(fileName)) {
					fileName = filePath.substring(filePath.lastIndexOf("/"), filePath.length());
				}

				logger.info("下载文件名："+fileName);

				response = getResponse();

				response.reset();
				//设置相应类型application/octet-stream
//				response.setContentType("application/octet-stream;charset=ISO8859-1");
//				response.setCharacterEncoding("utf-8");
				response.setContentType("application/octet-stream;charset=ISO-8859-1");
				//设置头信息
				response.setHeader("Content-Disposition", "attachment;filename=\"" + fileName + "\"");

				fileName = new String(fileName.getBytes(), "ISO-8859-1");

				isStream = new BufferedInputStream(ServletActionContext.getServletContext().getResourceAsStream(filePath));

				logger.info("文件路径："+filePath);

				InputStream iStream =  ServletActionContext.getServletContext().getResourceAsStream(filePath);

				if(iStream!=null) {
					fileLength = iStream.available();
				}
			}
		} catch (Exception e) {
			fileLength = 0;
			e.printStackTrace();
			
		}
		return SUCCESS;
	}

	public String getFileName() {
		return fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Integer getFileLength() {

		return fileLength;
	}

	public void setFileLength(Integer fileLength) {
		this.fileLength = fileLength;
	}

	public InputStream getIsStream() {
		return isStream;
	}

	public void setIsStream(InputStream isStream) {
		this.isStream = isStream;
	}

}
