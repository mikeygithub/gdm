package com.gxwzu.core.message;
/**
 * 系统异常提示类
 * @author author
 * @version 1.0
 */
public final class ErrorMessage {
	
	public static final  String WEB_SUC_000="处理成功";
	/*WEB层出错提示*/
	public static final  String WEB_ERR_TIMEOUT="访问超时";
	public static final  String WEB_ERR_001="用户名或者密码不对";
	public static final  String WEB_SUC_002="删除所选检测项目成功";
	public static final  String WEB_ERR_002="删除所选检测项目失败";
	public static final  String WEB_SUC_003="增加所选检测项目成功";
	public static final  String WEB_ERR_003="增加所选检测项目失败";
	public static final  String WEB_SUC_004="增加所实验采集数据成功!";
	public static final  String WEB_ERR_004="增加所实验采集数据失败!";
	public static final  String WEB_ERR_005="有未完成的检测项目报告,不能完成检验!";
	public static final  String WEB_SUC_006="增加实验溯源数据成功!";
	public static final  String WEB_ERR_006="增加实验溯源数据失败!";
	public static final  String WEB_ERR_007="检索实验溯源数据失败!";
	public static final  String WEB_ERR_008="登记实验溯源数据失败!";
	public static final  String WEB_ERR_009="删除登记实验溯源数据失败!";
	public static final  String WEB_ERR_010="删除实验记录原始附件失败!";
	public static final  String WEB_ERR_011="实验记录原始附件不存在!";
	public static final  String WEB_ERR_012="有未完成复核的检测项目报告,不能完成提交!";
	public static final  String WEB_ERR_013="有未完成复核的检测项目报告,不能完成提交!";
	public static final  String WEB_ERR_014="检索所有已有检品模板出错!";
	public static final  String WEB_ERR_015="检索所有已有检品出错!";
	public static final  String WEB_ERR_016="修改实验步骤出错!";
	public static final  String WEB_SUC_017="修改实验步骤同步成功";
	public static final  String WEB_ERR_018="获取岗位用户列表失败!";
	public static final  String WEB_ERR_019="修改操作失败!";
	public static final  String WEB_SUC_020="保存复核结果成功!";
	public static final  String WEB_ERR_020="保存复核结果失败!";
	public static final  String WEB_ERR_021="取消复检失败!";
	public static final  String WEB_SUC_021="复核成功!";
	public static final  String WEB_SUC_022="同步报告结果成功!";
	public static final  String WEB_ERR_022="同步报告结果失败!";
	public static final  String WEB_ERR_023="删除基础数据出错!";
	public static final  String WEB_ERR_024="无法连接服务器!";
	public static final  String WEB_ERR_025="无法删除模板里的项目!";
	public static final  String WEB_ERR_026="检品编号重复!";
	
	/*业务层出错提示*/
	public static final  String BIZ_ERR_001="业务流程:保存样品登记信息出错";
	public static final  String BIZ_ERR_002="业务流程:岗位流转出错";
	public static final  String BIZ_ERR_003="业务流程:岗位待办列表获取失败";
	public static final  String BIZ_ERR_004="业务流程:岗位签收获取检品信息失败";
	public static final  String BIZ_ERR_005="业务流程:检验员校验是否全部完成失败";
	public static final  String BIZ_ERR_006="业务流程:批量导入检品名单";

}
