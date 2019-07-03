package com.gxwzu.core.context;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.password.StandardPasswordEncoder;



/**
 * 全局常量配置
 * @author Mr.xucb
 * @version 1.0
 */
public final class SystemContext {
	protected final Log logger = LogFactory.getLog(getClass());

	/*配置软件版本信息*/
	public static final String AREACODE="apk";
	public static final String PROJECTNAME="毕业选题档案管理系统";
	public static final String PROJECT_VERSION="V1.0";
	
	public static final Integer DEFUALT_PAGE_SIZE=12;//默认分页数,Result有一个BUG，
	public static final Integer DEFUALT_PAGE_NUM=1;//默认分页码
	public static final String ACTION_CONTENT_TYPE="application/json;charset=utf-8";//默认传输编码，注意utf-8
	
	public static final int TIME_INTERVAL_MSG = 900;//单位，秒。2次发送短信的时间间隔不能少于900秒

	/* 配置系统session信息 */
	public static final String SPRING_SECURITY_CONTEXT = "SPRING_SECURITY_CONTEXT"; //安全认证用户信息
	public static final String USERID = "userId"; // 用户ID
	public static final String USERNAME = "userName"; // 用户名
	public static final String LOGINNAME = "loginName"; // 登录名
	public static final String DEPARTMENT = "Department"; // 部门
	public static final String ROLE = "sysrole"; // 角色
	public static final String USERTYPE = "userType"; // 用户类型
	public static final String SIGN = "sign"; // 登录标识
	public static final String CFILE = "cFile"; // 消息文件实体
	
	public static  String ipName = ""; //本机IP
	public static  String hostName = ""; //本机计算机名称
	public static  String osName = System.getProperties().getProperty("os.name");  //系统名称
	public static  String javaVersion =   System.getProperties().getProperty("java.version");//Java的运行环境版本
	
	;
	/**
	 * 获取用户头像的路径
	 * @return 用户头像上传图片的路径
	 */
	public static String getUserImgURL(){
		String root_url = "/attached/persinfo";
		return root_url;
	}
	
	/**
	 * 论文上传路径
	 * @return
	 */
	public static String getPaperURL(){
		String paper_url = "attached/paper";
		return paper_url;
	}
	
	private static final String SITE_WIDE_SECRET = "GXUWZ_0774_KEY";  
	private static final PasswordEncoder encoder = new StandardPasswordEncoder(SITE_WIDE_SECRET); 
	
	/**
	 * 密码加密
	 * @param rawPasswd 需要加密的密码
	 * @return
	 */
	public static String passwdEncryption(String rawPasswd){
		
		String str = encoder.encode(rawPasswd);
		return str;
	}

	/**
	 * 密码校验
	 * @param rawPassword 明文密码（需要匹配的用户输入的那份）
	 * @param password 数据库保存的加密的密码
	 * @return true = 通过，fasle=失败
	 */
	public static boolean passwdDecryption(String rawPasswd, String password){

		boolean isT = false;
		try {
			isT = encoder.matches(rawPasswd, password);
		} catch (Exception e) {
			
			System.out.println("密码匹配："+e);
		}
		return isT;
	}
	
	
	/**
	 * 拼凑短信发送内容	
	 */
	public String sendContext(){
		return "您的验证码：";
	}
	

    public static String getIpName() {
		try {
			  InetAddress addr = InetAddress.getLocalHost();
			 ipName = addr.getHostAddress().toString(); //获取本机ip
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		return ipName;
	}
    
	public static String getHostName() {
		try {
			  InetAddress addr = InetAddress.getLocalHost();
			  hostName = addr.getHostName().toString(); //获取本机ip
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		return hostName;
	}
    
}
