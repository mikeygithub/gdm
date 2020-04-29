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

	//执行成功标识
	public static final String RESULT_SUCCESS = "1";
	public static final String RESULT_FAIL = "0";
	//聊天类型
	public static final String CHAT_PRIVATE_TYPE = "0";
	public static final String CHAT_GROUP = "1";
	//消息阅读状态
	public static final String CHAT_NOT_READ_STATUS = "0";
	public static final String CHAT_ALREADY_READ = "1";
	//默认群头像
	public static final String DEFAULT_GROUP_AVATAR = "images/group_head.png";
	//默认个人头像
	public static final String DEFAULT_PERSON_AVATAR = "images/photo.jpg";
	//聊天图片默认保存路径
	public static final String DEFAULT_CHAT_IMG_SAVE_PATH = "/";
    //日志
	protected final Log logger = LogFactory.getLog(getClass());

	/*配置软件版本信息*/
	public static final String PROJECTNAME="毕业设计管理及过程监管云平台";

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

	//类型常量配置
	public static final String USER_STUDENT_TYPE = "1";//学生
	public static final String USER_TEACHER_TYPE = "2";//教师
	public static final String USER_ADMIN_TYPE = "3";//管理员
	//评阅审查表类型：
	public static final String REVIEW_TYPE_TEACHER = "00";//00 指导老师评阅
	public static final String REVIEW_TYPE_REVIEWER = "01";//01评阅人评阅
	public static final String REVIEW_TYPE_CHECK = "02";//02指导老师审查
	//答辩类型
	public static final String REPLY_TYPE_SMALL_GROUP = "00";//答辩小组
	public static final String REPLY_TYPE_BIG_GROUP = "01";//系答辩委员会

	//硬件信息
	public static  String ipName = ""; //本机IP
	public static  String hostName = ""; //本机计算机名称
	public static  String osName = System.getProperties().getProperty("os.name");  //系统名称
	public static  String javaVersion =   System.getProperties().getProperty("java.version");//Java的运行环境版本
	//进度计划类型
	public static final String  PROGRESS_ITEM_PLAN = "00";//安排计划
	public static final String  PROGRESS_ITEM_GUIDE = "01";//指导分配
	public static final String  PROGRESS_ITEM_ISSUEINFO = "02";//选题情况
	public static final String  PROGRESS_ITEM_GROUP = "04";//分组情况
	public static final String  PROGRESS_ITEM_TASKBOOK = "03";//任务书
	public static final String  PROGRESS_ITEM_OPENREPORT = "06";//开题报告
	public static final String  PROGRESS_ITEM_PROGRESSSITU = "07";//进展情况
	public static final String  PROGRESS_ITEM_PAPER = "06";//论文上交
	public static final String  PROGRESS_ITEM_GUIDE_TEACHER_CHECK = "08";//指导老师规范审查评阅信息
	public static final String  PROGRESS_ITEM_READ_TEACHER_CHECK = "05";//评阅老师论文评阅
	public static final String  PROGRESS_ITEM_PAPCER_TALK = "10";//论文答辩
	public static final String  PROGRESS_ITEM_TALK = "11";//答辩记录
	public static final String  PROGRESS_ITEM_SCORCE = "12";//成绩及评阅
	public static final String  PROGRESS_ITEM_INPUT_SCORCE = "13";//答辩组（成绩录入/评阅分配/评阅信息）
	public static final String  PROGRESS_ITEM_BEST_PAPER = "14";//论文推优

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
	public static boolean passwdDecryption(String rawPassword, String password){

		boolean isT = false;
		try {
			isT = encoder.matches(rawPassword, password);
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
			  hostName = addr.getHostName(); //获取本机ip
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		return hostName;
	}
    
}
