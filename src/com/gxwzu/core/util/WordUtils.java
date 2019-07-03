package com.gxwzu.core.util;

import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.List;
import java.util.Map;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Range;
import org.apache.poi.poifs.filesystem.DirectoryEntry;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.util.Units;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;

import com.gxwzu.sysVO.QcodeModel;

import freemarker.template.Configuration;
import freemarker.template.Template;

/**
 * 导出Word工具类
 * @author amu_1115
 *
 */
public class WordUtils {
	
	/**
	 * 创建带图片的Word
	 * @param qcodes
	 */
	public static ByteArrayInputStream createWord(List<QcodeModel> qcodes)  {
		
		ByteArrayOutputStream out=null;
		ByteArrayInputStream bais=null;
		try{
        XWPFDocument doc = new XWPFDocument();
        XWPFParagraph p = doc.createParagraph();
        XWPFRun r = p.createRun();
      
       
        for(QcodeModel model:qcodes) {
        	String qcode=model.getQcode()+"_"+model.getQcodeName();
            String qcodeName=model.getQcodeName();
        	InputStream qcodeStream=ZxingUtil.qCodeToStream(qcode, 100, 100);
            int format = XWPFDocument.PICTURE_TYPE_JPEG;
            r.addPicture(qcodeStream, format, qcodeName, Units.toEMU(100), Units.toEMU(100)); // 200x200 pixels
            r.setText(qcodeName);
        }
         out = new ByteArrayOutputStream();
        doc.write(out);
        byte[] ba = out.toByteArray();
		bais = new ByteArrayInputStream(ba);
		out.close();
		doc.close();
        }catch (Exception e) {
			e.printStackTrace();
		}
        return bais;
	}
	
/**
 * 通过模版生成word
 * @param dataMap
 * @param templatePath
 * @param outPath
 * @throws Exception
 */
	public static void exportWord(Map<String, String> dataMap,
			String templatePath, String outPath) throws Exception {
		Configuration configuration = new Configuration();
		configuration.setDefaultEncoding("utf-8");

		String templateFileName = templatePath.substring(
				templatePath.lastIndexOf("\\")+1, templatePath.length());
		String tempPath = templatePath.substring(0,
				templatePath.lastIndexOf("\\")+1);
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
