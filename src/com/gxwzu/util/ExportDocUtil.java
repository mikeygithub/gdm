package com.gxwzu.util;

import com.gxwzu.business.model.review.ReviewScore;
import com.gxwzu.sysVO.ListGroupTeacher;
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
}
