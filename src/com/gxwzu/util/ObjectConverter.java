package com.gxwzu.util;

import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.sysVO.MaterialInfo;
import com.gxwzu.system.model.sysStudent.SysStudent;

/**
 * @ProjectName gdm
 * @Author 麦奇
 * @Email biaogejiushibiao@outlook.com
 * @Date 4/19/20 11:39 PM
 * @Version 1.0
 * @Title: ObjectConverter
 * @Description:
 **/

public class ObjectConverter {

    public static MaterialInfo Student2MaterialInfo(SysStudent sysStudent){

        MaterialInfo materialInfo = new MaterialInfo();

        ListStudent listStudent = new ListStudent();

        listStudent.setStuId(sysStudent.getStuId());
        listStudent.setStuNo(sysStudent.getStuNo());
        listStudent.setStuName(sysStudent.getStuName());
        listStudent.setStuIdcart(sysStudent.getStuIdcart());
        listStudent.setStuAddress(sysStudent.getStuAddress());
        listStudent.setStuArrangement(sysStudent.getStuArrangement());
        listStudent.setStuSchoollength(sysStudent.getStuSchoollength());
        listStudent.setStuEntrance(sysStudent.getStuEntrance());
        listStudent.setStuGrade(sysStudent.getStuGrade());
        listStudent.setDeptNumber(sysStudent.getDeptNumber());
        listStudent.setCategoryId(sysStudent.getCategoryId());
        listStudent.setMajorId(sysStudent.getMajorId());
        listStudent.setUserId(sysStudent.getStuId());

        materialInfo.setStudent(listStudent);

        return materialInfo;
    }
}
