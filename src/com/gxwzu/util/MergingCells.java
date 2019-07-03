package com.gxwzu.util;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFPrintSetup;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.gxwzu.core.util.poi.ExcelSheetModel;

/**
 * An example of how to merge regions of cells.
 */
public class MergingCells {
	/**
	 * 读取模板路径
	 * @param webRoot
	 * @param templeNo
	 * @return
	 */
	private static XSSFWorkbook workbook(String tmplPath){
		try {
			XSSFWorkbook workbook = null;
			workbook = new XSSFWorkbook(new FileInputStream(tmplPath));
			return workbook;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 转换类型
	 * @param value
	 * @return
	 */
	private static String convert(Object value){
		if(value!=null){
			if(value instanceof Boolean){
				value=(Boolean)value==true?"是":"否";
			}
			
		}else{
			value="";
		}
		return value.toString();
	}
	public static InputStream merginExport(ExcelSheetModel model,String tmplPath) {
		try{
			XSSFWorkbook workbook = null;
			Workbook wb = new XSSFWorkbook();
			
			workbook=workbook(tmplPath);
			if(workbook==null){
				return null;
			}
			XSSFSheet sheet = null;
			// 生成一个表格
			sheet = workbook.getSheetAt(model.getSheetNum());
			// 定义单元格样式
			XSSFCellStyle style = workbook.createCellStyle();
			style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
			style.setBorderLeft(XSSFCellStyle.BORDER_THIN);
			style.setBorderRight(XSSFCellStyle.BORDER_THIN);
			style.setBorderTop(XSSFCellStyle.BORDER_THIN);
			style.setAlignment(XSSFCellStyle.ALIGN_CENTER);
			style.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
			style.setDataFormat(workbook.createDataFormat().getFormat("@"));
			
			// 遍历集合数据，产生数据行
			int startRow=model.getRowIndex();
			int k=1;
			
			if (model.getResult() != null) {
				for (int i = startRow; i < model.getResult().size()
						+ model.getRowIndex(); i++) {
					//创建行
					XSSFRow	rows = sheet.createRow(i);
					
					rows.setHeight((short) (25 * 20));
					Object[]oc=(Object[])model.getResult().get(i-startRow);	
					//创建列 第一列 为序号
					XSSFCell cell0 = rows.createCell(0);
					cell0.setCellValue(++k);
					cell0.setCellStyle(style);
					//创建列 第三列 为序号
					for(int c=1;c<oc.length+1;c++){
						XSSFCell cell = rows.createCell(c+2);
						cell.setCellValue(convert(oc[c-1]));
						cell.setCellStyle(style);
					}
				}
			}
			sheet.getPrintSetup().setLandscape(false); // 打印方向，true：横向，false：纵向
			sheet.getPrintSetup().setPaperSize(XSSFPrintSetup.A4_PAPERSIZE); // 纸张
			sheet.getPrintSetup().setScale((short) 85); // 设置打印缩放比例80%
			sheet.getPrintSetup().setHeaderMargin((double) 0.25);// 设置页眉打印范围
			sheet.getPrintSetup().setFooterMargin((double) 0.25);// 设置页眉打印范围
			sheet.setMargin(XSSFSheet.BottomMargin, 0.5);
			sheet.setMargin(XSSFSheet.LeftMargin, 0.25);
			sheet.setMargin(XSSFSheet.RightMargin, 0.25);
			sheet.setMargin(XSSFSheet.TopMargin, 0.5);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			
			workbook.write(baos);// 写入
			
			byte[] ba = baos.toByteArray();
			ByteArrayInputStream bais = new ByteArrayInputStream(ba);
			return bais;
		}catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
    public static void main(String[] args) throws IOException {
    	
    	Workbook wb = new XSSFWorkbook();
        
            Sheet sheet = wb.createSheet("new sheet");
            int num =0;
            for(int i=0;i<=9;i++){           	         
            		Row row = sheet.createRow(i+2);         
            		Cell  cell1 = row.createCell(2);
            		Cell  cell2 = row.createCell(5);
            		cell1.setCellValue("This is a test of merging2");
            		cell2.setCellValue("This is a test of merging3");      
            	    sheet.addMergedRegion(new CellRangeAddress(i+2, i+2, 2, 4));
                    sheet.addMergedRegion(new CellRangeAddress(i+2, i+2, 5, 7));
         }       
            // Write the output to a file
            FileOutputStream fileOut = new FileOutputStream("D://merging_cells.xlsx");
             wb.write(fileOut);
            
        
    }
}
