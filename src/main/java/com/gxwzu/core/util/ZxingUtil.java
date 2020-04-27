package com.gxwzu.core.util;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Hashtable;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
/**
 * 生成二维公共操作类
 * @author author
 * @version 1.0
 */
public class ZxingUtil {
	 
    private static final int BLACK = 0xFF000000;  
    private static final int WHITE = 0xFFFFFFFF;  
  
    private ZxingUtil() {  
    }  
  
    public static BufferedImage toBufferedImage(BitMatrix matrix) {  
        int width = matrix.getWidth();  
        int height = matrix.getHeight();  
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);  
        for (int x = 0; x < width; x++) {  
            for (int y = 0; y < height; y++) {  
                image.setRGB(x, y, matrix.get(x, y) ? BLACK : WHITE);  
            }  
        }  
        return image;  
    }
    /**
     * 作为外部的输入流
     * @param matrix
     * @return
     * @throws IOException
     */
    public static InputStream toInputStreamImage(BitMatrix matrix,String format) throws IOException {  
    	InputStream is = null; 
        int width = matrix.getWidth();  
        int height = matrix.getHeight();  
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);  
        for (int x = 0; x < width; x++) {  
            for (int y = 0; y < height; y++) {  
                image.setRGB(x, y, matrix.get(x, y) ? BLACK : WHITE);  
            }  
        }  
        image.flush();
        ByteArrayOutputStream bs = new ByteArrayOutputStream();  
        
        ImageOutputStream imOut=null; 
        try { 
            imOut = ImageIO.createImageOutputStream(bs); 
            ImageIO.write(image, format,imOut); 
            is= new ByteArrayInputStream(bs.toByteArray()); 
              
        } catch (IOException e) { 
            e.printStackTrace(); 
        } 
        return is;
    }  
  
    public static void writeToFile(BitMatrix matrix, String format, File file) throws IOException {  
        BufferedImage image = toBufferedImage(matrix);  
        if (!ImageIO.write(image, format, file)) {  
            throw new IOException("Could not write an image of format " + format + " to " + file);  
        }  
    }  
  
    public static void writeToStream(BitMatrix matrix, String format, OutputStream stream) throws IOException {  
        BufferedImage image = toBufferedImage(matrix);  
        if (!ImageIO.write(image, format, stream)) {  
            throw new IOException("Could not write an image of format " + format);  
        }  
    }  
    public static String qCode(String text,String name,String fPath,int width,int height)  {  
    	try{
    	  
       
        String format = "png";// 二维码的图片格式  
          
        Hashtable<EncodeHintType, String> hints = new Hashtable<EncodeHintType, String>();  
        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");   // 内容所使用字符集编码  
          
        BitMatrix bitMatrix = new MultiFormatWriter().encode(text+"_"+name, BarcodeFormat.QR_CODE, width, height, hints);  
        // 生成二维码  
        fPath=fPath+"/"+text+"."+format;
        String fileUrl="/"+text+"."+format;
        File outputFile = new File(fPath);
        if(outputFile.exists()){
        	outputFile.delete();
           ZxingUtil.writeToFile(bitMatrix, format, outputFile);
        }else{
        	ZxingUtil.writeToFile(bitMatrix, format, outputFile);
        }
     
        return fileUrl;
    	}catch (Exception e) {
			e.printStackTrace();
			return "";
		}
    } 
    /**
     * 生成二维码二进制流
     * @param text
     * @param width
     * @param height
     * @return
     * @throws Exception
     */
    public static InputStream qCodeToStream(String text, int width,int height) throws Exception {  
    	try{
        String format = "jpg";// 二维码的图片格式  
          
        Hashtable<EncodeHintType, String> hints = new Hashtable<EncodeHintType, String>();  
        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");   // 内容所使用字符集编码  
          
        BitMatrix bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.QR_CODE, width, height, hints);  
        // 生成二维码  
        return toInputStreamImage(bitMatrix,format);
    	}catch(Exception e){
    		e.printStackTrace();
    		return null;
    	}
    } 

}
