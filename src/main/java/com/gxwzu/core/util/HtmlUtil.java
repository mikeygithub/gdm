package com.gxwzu.core.util;

import java.util.regex.Matcher;  
import java.util.regex.Pattern;  
  
public class HtmlUtil {  
    private static final String regEx_script = "<script[^>]*?>[\\s\\S]*?<\\/script>"; // 定义script的正则表达式  
    private static final String regEx_style = "<style[^>]*?>[\\s\\S]*?<\\/style>"; // 定义style的正则表达式  
    private static final String regEx_html = "<[^>]+>"; // 定义HTML标签的正则表达式  
    private static final String regEx_space = "\\s*|\t|\r|\n";//定义空格回车换行符  
    
    private static final String regEx_rich = "</?[^>]+>";//定义空格回车换行符
    private static final String regEx_rich1 = "<a>\\s*|\t|\r|\n</a>";//定义空格回车换行符
    private static final String regEx_rich2 = "<.*?>";//定义空格回车换行符
      
    /** 
     * @param htmlStr 
     * @return 
     *  删除Html标签 
     */  
    public static String delHTMLTag(String htmlStr) {  
        Pattern p_script = Pattern.compile(regEx_script, Pattern.CASE_INSENSITIVE);  
        Matcher m_script = p_script.matcher(htmlStr);  
        htmlStr = m_script.replaceAll(""); // 过滤script标签  
  
        Pattern p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);  
        Matcher m_style = p_style.matcher(htmlStr);  
        htmlStr = m_style.replaceAll(""); // 过滤style标签  
  
        Pattern p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);  
        Matcher m_html = p_html.matcher(htmlStr);  
        htmlStr = m_html.replaceAll(""); // 过滤html标签  
  
        Pattern p_space = Pattern.compile(regEx_space, Pattern.CASE_INSENSITIVE);  
        Matcher m_space = p_space.matcher(htmlStr);  
        htmlStr = m_space.replaceAll(""); // 过滤空格回车标签  
        
        Pattern p_rich = Pattern.compile(regEx_rich, Pattern.CASE_INSENSITIVE);  
        Matcher m_rich = p_rich.matcher(htmlStr);  
        htmlStr = m_rich.replaceAll(""); 
        
        Pattern p_rich1 = Pattern.compile(regEx_rich1, Pattern.CASE_INSENSITIVE);  
        Matcher m_rich1 = p_rich1.matcher(htmlStr);  
        htmlStr = m_rich1.replaceAll(""); 
        
        Pattern p_rich2 = Pattern.compile(regEx_rich2, Pattern.CASE_INSENSITIVE);  
        Matcher m_rich2 = p_rich2.matcher(htmlStr);  
        htmlStr = m_rich2.replaceAll(""); 
        
        return htmlStr.trim(); // 返回文本字符串  
    }  
      
    public static String getTextFromHtml(String htmlStr){  
        htmlStr = delHTMLTag(htmlStr);  
        htmlStr = htmlStr.replaceAll("&nbsp;", "");  
        htmlStr = htmlStr.substring(0, htmlStr.indexOf("。")+1);  
        return htmlStr;  
    }  
      
    public static void main(String[] args) {  
        String str =" <p style=font-family: tahoma, helvetica, arial, 宋体, sans-serif; font-size: 12px; line-height: 18px; white-space: normal; text-align: justify; background: white;><strong><span style=line-height: 32px; font-family: 仿宋; font-size: 16pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;>一、整改落实工作总体情况</span></strong><span style=line-height: 32px; font-family: 仿宋; font-size: 16pt;></span></p><p style=font-family: tahoma, helvetica, arial, 宋体, sans-serif; font-size: 12px; line-height: 18px; white-space: normal; background: white;><strong><span style=line-height: 32px; font-family: 仿宋; font-size: 16pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;></span></strong><strong><span style=line-height: 32px; font-family: 仿宋; font-size: 16pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;>（一）及时传达，认真部署</span></strong></p><p style=font-family: tahoma, helvetica, arial, 宋体, sans-serif; font-size: 12px; line-height: 18px; white-space: normal; text-align: justify; text-indent: 28.5pt; background: white;><strong><span style=line-height: 32px; font-family: 仿宋; font-size: 16pt; font-weight: normal; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;>学校党委把做好巡视整改工作作为当前的重大政治任务，列入重要的议事日程，迅速部署开展巡视整改工作。从5月4日开始，学校党委书记唐耀华先后主持召开6次党委会，研究、讨论、部署巡视整改各项工作。</span></strong></p><p style=font-family: tahoma, helvetica, arial, 宋体, sans-serif; font-size: 12px; line-height: 18px; white-space: normal; text-align: justify; text-indent: 28.5pt; background: white;><strong><span style=line-height: 32px; font-family: 仿宋; font-size: 16pt; font-weight: normal; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;>5</span></strong><strong><span style=line-height: 32px; font-family: 仿宋; font-size: 16pt; font-weight: normal; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;>月3日反馈会第二天（5月4日）下午，学校党委召开落实整改巡视意见和建议专题会议，学习《自治区党委第十四巡视组关于梧州学院巡视情况的反馈意见》（桂巡办〔2016〕246号）（以下简称《反馈意见》），研究部署整改工作。会议根据《反馈意见》中提出的存在的主要问题和意见建议进行对照落实，提出了学校整改落实的初步方案，详细分解具体的落实任务和责任部门，明确了工作完成时间。会议认为，自治区党委巡视组的反馈意见实事求是，具有很强的针对性、指导性，对巡视组提出的意见建议，学校领导班子成员和相关部门要认真学习，坚决贯彻、全面落实。5月9日，学校召开2016年第八次党委会，深入学习领会巡视反馈意见，各党委委员和学校领导针对反馈意见中提出的问题和意见建议进行逐条对照分析，认真领会。5月17日,学校召开第九次党委会，专题研究整改方案，并检查各项整改工作的进展情况。从2016年第十次党委会开始，全面部署落实整改方案，研究解决整改过程中遇到的有关问题。</span></strong><strong><span style=line-height: 32px; font-family: 仿宋; font-size: 16pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;></span></strong></p><p style=font-family: tahoma, helvetica, arial, 宋体, sans-serif; font-size: 12px; line-height: 18px; white-space: normal; text-indent: 24.1pt; background: white;><strong><span style=line-height: 32px; font-family: 仿宋; font-size: 16pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;>（二）加强领导，明确责任</span></strong><span style=line-height: 32px; font-family: 仿宋; font-size: 16pt;></span></p><p style=font-family: tahoma, helvetica, arial, 宋体, sans-serif; font-size: 12px; line-height: 18px; white-space: normal; text-indent: 29.5pt; background-color: rgb(255, 255, 255);><strong><span style=line-height: 32px; font-family: 仿宋; font-size: 16pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;>一是建立工作机构，加强组织领导。</span></strong><span style=line-height: 32px; font-family: 仿宋; font-size: 16pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;>学校组建了由党委书记主抓，学校其他领导，学校党委办公室、纪检监察室等相关部门负责人为成员的整改工作机构，全面负责、统一领导学校整改落实工作。</span></p><p style=font-family: tahoma, helvetica, arial, 宋体, sans-serif; font-size: 12px; line-height: 18px; white-space: normal; text-indent: 29.5pt; background-color: rgb(255, 255, 255);><strong><span style=line-height: 32px; font-family: 仿宋; font-size: 16pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;>二是制定工作方案，明确责任和任务。</span></strong><span style=line-height: 32px; font-family: 仿宋; font-size: 16pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;>学校党委制定了《梧州学院巡视情况反馈意见存在的主要问题和意见、建议对照落实整改方案》和《整改任务清单》，明确每个整改任务的整改措施、牵头校领导、牵头单位和责任单位，确保措施到位、责任到位。</span></p><p style=font-family: tahoma, helvetica, arial, 宋体, sans-serif; font-size: 12px; line-height: 18px; white-space: normal; text-indent: 24.1pt; background-color: rgb(255, 255, 255);><strong><span style=line-height: 32px; font-family: 仿宋; font-size: 16pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;>（三）明确时限，强化监督</span></strong><span style=line-height: 32px; font-family: 仿宋; font-size: 16pt;></span></p><p style=font-family: tahoma, helvetica, arial, 宋体, sans-serif; font-size: 12px; line-height: 18px; white-space: normal; text-align: justify; text-indent: 29.55pt; background: white;><strong><span style=line-height: 32px; font-family: 仿宋; font-size: 16pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;>一是制定时间表，明确整改工作完成时限。</span></strong><span style=line-height: 32px; font-family: 仿宋; font-size: 16pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;>对于《落实整改方案》中所列5个方面17个整改问题，要求从2016年5月4日起，相关制度的制定（修订）要在2016年6&nbsp;月15日前完成。对于《整改任务清单》所列5个方面17个问题，要求从2016年5月4日起，一些可立行立改的问题立即整改，其余大多要在2个月内整改到位；少量牵涉面较广、工作难度较大的问题，要在半年之内解决；极个别牵涉面特别广、情况十分复杂、需要较长时间解决的问题，要在1年之内完成整改。</span></p><p style=font-family: tahoma, helvetica, arial, 宋体, sans-serif; font-size: 12px; line-height: 18px; white-space: normal; text-align: justify; text-indent: 29.55pt; background: white;><strong><span style=line-height: 32px; font-family: 仿宋; font-size: 16pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;>二是加强督查督办。</span></strong><span style=line-height: 32px; font-family: 仿宋; font-size: 16pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;>出台了《梧州学院督查督办工作制度》（梧院党办发〔2016〕21号）学校党委办公室根据整改清单，加强对整改任务完成情况的督促检查，以问题的实际解决、工作的有效推进，让师生员工看到变化，见到成效。</span></p><p><br/></p>";  
        
    }  
}  