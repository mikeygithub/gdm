package com.gxwzu.core.util.tools;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;


import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;




/**
 * 反射工具类
 * @author author
 * @version 1.0
 */
public class ReflectUtil {
	
	private static final Log log = LogFactory.getLog(ReflectUtil.class);
	
	/**
	 * 根据属性名获取属性值
	 * */
    private static  Object getFieldValueByName(String fieldName, Object o) {
        try {  
            String firstLetter = fieldName.substring(0, 1).toUpperCase();  
            String getter = "get" + firstLetter + fieldName.substring(1);  
            Method method = o.getClass().getMethod(getter, new Class[] {});  
            Object value = method.invoke(o, new Object[] {});  
            return value;  
        } catch (Exception e) {  
            log.error(e.getMessage(),e);  
            return null;  
        }  
    } 

    
    /**
     * 获取属性名数组
     * */
    public static String[] getFiledName(Object o){
    	Field[] fields=o.getClass().getDeclaredFields();
       	String[] fieldNames=new String[fields.length];
    	for(int i=0;i<fields.length;i++){
    		fieldNames[i]=fields[i].getName();
    	}
    	return fieldNames;
    }
    
    
    /**
     * 获取属性类型(type)，属性名(name)，属性值(value)的String组成的list
     * */
    private static List<String> getFiledsInfo(Object o){
    	Field[] fields=o.getClass().getDeclaredFields();
       	List<String> list = new ArrayList<String>();
    	for(int i=0;i<fields.length;i++){	
    		String type=fields[i].getType().toString();
    		String name= fields[i].getName();
    		Object value=getFieldValueByName(fields[i].getName(), o);
    		StringBuffer buffer=new StringBuffer();
    		String data=value==null?"0":value+"";
    		int length=data.length();
    		buffer.append("[");
    		buffer.append("type:"+type+",");
    		buffer.append("name:"+name+",");
    		buffer.append("value:"+value+",");
    		buffer.append("length:"+length+"]");
    		list.add(buffer.toString());
    	}
    	return list;
    }
    
    /**
     * 获取对象的所有属性值，返回一个对象数组
     * */
    public static Object[] getFiledValues(Object o){
    	String[] fieldNames=getFiledName(o);
    	Object[] value=new Object[fieldNames.length];
    	for(int i=0;i<fieldNames.length;i++){
    		value[i]=getFieldValueByName(fieldNames[i], o);
    	}
    	return value;
    }

//    public static void f2(){
//
//    	Projects model=new Projects();
//    	String talble="projects";
//    	String enityName=model.getClass().getName();
//    	Field[] fields=model.getClass().getDeclaredFields();
//    	String _class="<class name=\""+enityName+ "\" table=\""+talble+"\" >";
//    	
//		System.out.println(_class);
//    	
//    	
//    	for(int i=0;i<fields.length;i++){	
//    		String type=fields[i].getType().getName();
//    		String field= fields[i].getName();
//    
//    		String firstLetter=StringUtils.upperCase(field.substring(0,1));
//    		String otherLetter=field.substring(1, field.length());
//    		String Bigfield=StringUtils.upperCase(field);
//    		if(i==0){
//    			String id="<id name=\""+field+"\" type=\""+type+"\"><column name=\""+field+"\" /><generator class=\"native\" /></id>";
//    			System.out.println(id);
//    		}else{
//    		System.out.println("<property name=\""+field+"\" type=\""+type+"\">");
//    		if("java.lang.String".equals(type)){
//    			System.out.println("<column name=\""+field+"\" length=\"100\"/>");
//    		}
//    		if("java.util.Date".equals(type)){
//    			System.out.println("<column name=\""+field+"\" length=\"23\"/>");
//    		}
//    		if("java.lang.Double".equals(type)){
//    			System.out.println("<column name=\""+field+"\" precision=\"12\" scale=\"4\"/>");
//    		}
//    		if("java.lang.Float".equals(type)){
//    			System.out.println("<column name=\""+field+"\" precision=\"12\" scale=\"4\"/>");
//    		}
//    		if("java.lang.Byte".equals(type)){
//    			System.out.println("<column name=\""+field+"\" />");
//    		}
//    		}
//    		if(i!=0){
//    		System.out.println("</property>");
//    		}
//    	}
//    	System.out.println("</class>");
//    }
    
    public static void main(String[]args){
//    	ReflectUtil.f2();
   
    }
}
