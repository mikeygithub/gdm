package com.gxwzu.util;

import com.gxwzu.business.model.review.ReviewScore;
import com.gxwzu.sysVO.ListGroupTeacher;
import com.gxwzu.sysVO.StudentProcessDocVO;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ProjectName gdm
 * @Author 麦奇
 * @Email biaogejiushibiao@outlook.com
 * @Date 8/15/19 3:44 PM
 * @Version 1.0
 * @Description:
 **/

public class ExportDocUtil {

    protected static final Log logger = LogFactory.getLog(ExportDocUtil.class);

    /**
     * 初始化数据map
     * @return
     */
    public static Map initMapMsg() {

        logger.info("初始化Map");

        Map<String, String> map = new HashMap<String, String>();
        map.put("issueName", "");
        map.put("deptName", "");
        map.put("majorName", "");
        map.put("className", "");
        map.put("stuNo", "");
        map.put("stunName", "");
        map.put("content", "");
        map.put("planJob", "");
        map.put("document", "");
        map.put("teacherName", "");
        //开题报告
        map.put("tN", "");
        map.put("lN", "");
        map.put("cT", "");
        map.put("bD", "");
        map.put("dT", "");
        map.put("mD", "");
        //进展情况记录(五个阶段)
        for (int j = 0; j < 5; j++) {
            map.put("time" + (j + 1), "");
            map.put("work" + (j +1), "");
            map.put("ProgressRecord" + (j+1), "");
        }
        //论文（设计）评阅表（指导教师用）
        map.put("iN", "");
        map.put("dT", "");
        map.put("mR", "");
        map.put("tN", "");
        map.put("sN", "");
        map.put("tL", "");
        for (int j = 0; j < 12; j++) {
            map.put("GR" + (j + 1), "");
        }
        map.put("reviewGuideRemark", "");
        map.put("GRSum","");//
        map.put("GRPass", "");
        //论文（设计）评阅表（评阅教师用）
        map.put("TRSum", "");
        for (int k = 0; k < 13; k++) {
            map.put("TR" + (k + 1), "");
        }
        map.put("reviewTeacherRemark", "");
        map.put("TRSum","");//
        map.put("TRPass", "");
        //规范审查表（指导教师用）
        for (int l = 0; l < 6; l++) {
            map.put("checkScore" + (l + 1), "");
            map.put("checkRemark" + (l + 1), "");
        }
        map.put("checkScoreSum","");//
        map.put("checkRemark7","");//
        map.put("flunkCase", "");
        //答辩过程记录表
        map.put("issueName", "");
        map.put("teacherName", "");
        map.put("technical", "");
        map.put("stuName", "");
        map.put("grade", "");
        map.put("stuNo", "");
        map.put("reviewContent", "");
        //答辩成绩及评语表
        map.put("defenceGroupName", "");
        map.put("groupReviewScore", "");
        map.put("groupRemark", "");
        map.put("groupGuideReadScore", "");
        map.put("groupReaderScore", "");
        map.put("groupDefenceScore", "");
        map.put("finalScore", "");
        map.put("groupRank", "");
        //系
        map.put("committeeGroupName", "");
        map.put("committeeRemark", "");
        map.put("committeeFinalScore", "");
        map.put("committeeRank", "");

        return map;
    }

    public static void delNotDir(File file){

        logger.info("清理压缩文件："+file);

        File[] f = file.listFiles();
        for (int i = 0; i < f.length; i++) {
            if (f[i].isDirectory()) {
                delNotDir(f[i]);
            }
            f[i].delete();
        }
    }

    public static void putData(StudentProcessDocVO doc, Map<String, String> map) {
        //任务书
        map.put("issueName", doc.getIssueInfo()!=null?doc.getIssueInfo().getIssueName():"");
        map.put("deptName", doc.getListStudent()!=null?doc.getListStudent().getDeptName():"");
        map.put("majorName", doc.getListStudent()!=null?doc.getListStudent().getMajorName():"");
        map.put("className", doc.getListStudent()!=null?doc.getListStudent().getClassName():"");
        map.put("stuNo", doc.getListStudent()!=null?doc.getListStudent().getStuNo():"");
        map.put("stuName", doc.getListStudent()!=null?doc.getListStudent().getStuName():"");
        map.put("content", doc.getTaskBook()!=null?doc.getTaskBook().getTaskContent():"");
        map.put("planJob", doc.getTaskBook()!=null?doc.getTaskBook().getTaskPlanJob():"");
        map.put("document", doc.getTaskBook()!=null?doc.getTaskBook().getTaskDocument():"");
        map.put("teacherName", doc.getSysTeacher()!=null?doc.getSysTeacher().getTeacherName():"");
        //开题报告
        map.put("tN", doc.getSysTeacher()!=null?doc.getSysTeacher().getTeacherName():"");
        map.put("lN", doc.getSysTechnical()!=null?doc.getSysTechnical().getTechnicalName():"");
        map.put("cT", doc.getOpenReport()!=null?doc.getOpenReport().getReportContent():"");
        map.put("bD", doc.getOpenReport()!=null?doc.getOpenReport().getBackground():"");
        map.put("dT", doc.getOpenReport()!=null?doc.getOpenReport().getReportDocument():"");
        map.put("mD", doc.getOpenReport()!=null?doc.getOpenReport().getReportMethod():"");
        //进展情况记录(五个阶段)
        if (doc.getProgressSitus()!=null){
        for (int j = 0; j < doc.getProgressSitus().size(); j++) {
            map.put("time" + (j+1), doc.getProgressSitus().get(j).getProgressTime());
            map.put("work" + (j+1), doc.getProgressSitus().get(j).getProgressWork());
            map.put("ProgressRecord" + (j+1), doc.getProgressSitus().get(j).getProgressRecord());
        }}
        //论文（设计）评阅表（指导教师用）
        map.put("iN", doc.getIssueInfo()!=null?doc.getIssueInfo().getIssueName():"");
        map.put("dT", doc.getListStudent()!=null?doc.getListStudent().getDeptName():"");
        map.put("mR", doc.getListStudent()!=null?doc.getListStudent().getMajorName():"");
        map.put("tN", doc.getSysTeacher()!=null?doc.getSysTeacher().getTeacherName():"");
        map.put("sN", doc.getListStudent()!=null?doc.getListStudent().getStuName():"");
        map.put("tL", doc.getListReviewReadGuide()!=null&&doc.getListReviewReadGuide().getTotalScore()!=null?doc.getListReviewReadGuide().getTotalScore().toString():"");
        if (doc.getListReviewReadGuide()!=null){
        List<ReviewScore> list = doc.getListReviewReadGuide().getReviewScoreList();
        for (int j = 0; j < list.size(); j++) {
            ReviewScore reviewScore = list.get(j);
            map.put("GR" + (j + 1), "" + reviewScore.getScore()!=null?reviewScore.getScore().toString():"");
        }
        map.put("GRSum",doc.getListReviewReadGuide()!=null&&doc.getListReviewReadGuide().getTotalScore()!=null?doc.getListReviewReadGuide().getTotalScore().toString():"");
        map.put("reviewGuideRemark", doc.getListReviewReadGuide()!=null?doc.getListReviewReadGuide().getReviewContent():"");
        if ("00".equals(doc.getListReviewReadGuide().getReplyLink())) {
            map.put("GRPass", "否");
        } else if ("01".equals(doc.getListReviewReadGuide().getReplyLink())) {
            map.put("GRPass", "是");
        } else {
            map.put("GRPass", "");
        }}
        //论文（设计）评阅表（评阅教师用）
        if (doc.getListReviewReadTeacher()!=null){
            map.put("TRSum", doc.getListReviewReadTeacher().getTotalScore()!=null?doc.getListReviewReadTeacher().getTotalScore().toString():"");
            List<ReviewScore> listT = doc.getListReviewReadTeacher().getReviewScoreList();
            for (int k = 0; k < listT.size(); k++) {
                ReviewScore reviewScore = listT.get(k);
                map.put("TR" + (k + 1), "" + reviewScore.getScore());
            }
            map.put("reviewTeacherRemark", doc.getListReviewReadTeacher().getReviewContent()!=null?doc.getListReviewReadTeacher().getReviewContent():"");
            if ("00".equals(doc.getListReviewReadTeacher().getReplyLink())) {
                map.put("TRPass", "否");
            } else if ("01".equals(doc.getListReviewReadTeacher().getReplyLink())) {
                map.put("TRPass", "是");
            } else {
                map.put("TRPass", "");
            }}
        //规范审查表（指导教师用）
        if (doc.getListReviewReadTeacher()!=null){
        List<ReviewScore> listC = doc.getListReviewCheckTeacher().getReviewScoreList();
        for (int l = 0; l < listC.size(); l++) {
            ReviewScore reviewScore = listC.get(l);
            map.put("checkScore" + (l + 1), reviewScore.getScore().toString());
            map.put("checkRemark" + (l + 1),  reviewScore.getRemark()==null?"":reviewScore.getRemark());
        }}
        if (doc.getListReviewReadTeacher()!=null)map.put("checkScoreSum",doc.getListReviewReadTeacher().getTotalScore().toString());
        map.put("flunkCase", doc.getListReviewCheckTeacher()!=null?doc.getListReviewCheckTeacher().getReviewContent():"");
        //答辩过程记录表
        map.put("technical", doc.getSysTechnical().getTechnicalName());
        map.put("grade", doc.getListStudent().getStuGrade());
        map.put("reviewContent", doc.getDefenseRecordVOS().size()>0?doc.getDefenseRecordVOS().get(0).getDefenseContent():"");
        //答辩成绩及评语表
        StringBuilder defenceGroupName = new StringBuilder();
        for (ListGroupTeacher teacher:doc.getDefenceGroup().getTeacherList()) {
            defenceGroupName.append(teacher.getTeacherName()+" ");
        }
        map.put("defenceGroupName",defenceGroupName.toString() );
        if (doc.getGroupReply()!=null) {
            map.put("groupReviewScore", doc.getListReviewReadTeacher().getTotalScore()!=null?doc.getListReviewReadTeacher().getTotalScore().toString():"");
            map.put("groupRemark", doc.getGroupReply().getReplyLink()!=null?doc.getGroupReply().getReplyLink():"");
            map.put("groupGuideReadScore", doc.getGroupReply().getGuideScore()!=null?doc.getGroupReply().getGuideScore().toString():"");
            map.put("groupReaderScore",doc.getGroupReply().getReadScore()!=null?doc.getGroupReply().getReadScore().toString():"");
            map.put("groupDefenceScore", doc.getGroupReply().getReplyScore()!=null?doc.getGroupReply().getReplyScore().toString():"");
            map.put("finalScore", doc.getGroupReply().getReplyScoreFinish() + "");
            map.put("groupRank", doc.getGroupReply().getGrade()!=null?doc.getGroupReply().getGrade():"");
        }
        //系
        StringBuilder commiteeGroupName = new StringBuilder();
        for (ListGroupTeacher teacher:doc.getCommiteeGroup().getTeacherList()) {
            commiteeGroupName.append(teacher.getTeacherName()+" ");
        }
        map.put("committeeGroupName",commiteeGroupName.toString());
        if (doc.getDeptReply()!=null) {
            map.put("committeeRemark", doc.getDeptReply().getReplyLink()!=null?doc.getDeptReply().getReplyLink():"");
            map.put("committeeFinalScore", doc.getDeptReply().getReplyScoreFinish() + "");
            map.put("committeeRank", doc.getDeptReply().getGrade()!=null?doc.getDeptReply().getGrade():"");
        }
        //文件名
        StringBuffer sBuffer = new StringBuffer(doc.getListStudent().getClassName());
        sBuffer.append("-").append(doc.getListStudent().getStuId()).append("-").append(doc.getListStudent().getStuName()).append("-").append("过程文档.doc");
        map.put("fileName",sBuffer.toString());
    }
}
