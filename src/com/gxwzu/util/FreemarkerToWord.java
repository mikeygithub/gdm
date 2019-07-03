package com.gxwzu.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class FreemarkerToWord {
	public static void main(String[] args) {
		
		Map<String, String> dataMap = new HashMap<String, String>();
		dataMap.put("name","<p><span style=\"color: rgb(255, 0, 0);\"><strong>的说法答复</strong></span><br/></p>");
		String templatePath = "D:/123.mht";
		String outPath = "D:/123.doc";
		try {
			exportWord(dataMap, templatePath, outPath);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void exportWord(Map<String, String> dataMap,
			String templatePath, String outPath) throws Exception {
		Configuration configuration = new Configuration();
		configuration.setDefaultEncoding("utf-8");

		String templateFileName = templatePath.substring(
				templatePath.lastIndexOf("/")+1, templatePath.length());
		String tempPath = templatePath.substring(0,
				templatePath.lastIndexOf("/")+1);
		/*
		 * 以下是两种指定ftl文件所在目录路径的方式, 注意这两种方式都是 指定ftl文件所在目录的路径,而不是ftl文件的路径
		 */
		// 指定路径的第一种方式(根据某个类的相对路径指定)
		// configuration.setClassForTemplateLoading(this.getClass(),"");

		// 指定路径的第二种方式,我的路径是C:/a.ftl
		configuration.setDirectoryForTemplateLoading(new File(tempPath));
		// 输出文档路径及名称
		File outFile = new File(outPath);
		// 以utf-8的编码读取ftl文件
		Template t = configuration.getTemplate(templateFileName, "utf-8");
		Writer out = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(outFile), "utf-8"), 10240);
		t.process(dataMap, out);
		out.close();
	}
}
