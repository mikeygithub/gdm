package com.gxwzu.system.model.userRole;

import javax.persistence.*;

/**
 * @Program: Ped_Moni_Gen
 * @Author: 麦奇
 * @Email： 1625017540@qq.com
 * @Create: 2019-07-03 23:07
 * @Describe：
 **/
@Entity
@Table(name = "user_role", schema = "gdm", catalog = "")
@IdClass(UserRoleEntityPK.class)
public class UserRoleEntity {
    private int roleId;
    private int userHelpId;

    @Id
    @Column(name = "roleId", nullable = false)
    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    @Id
    @Column(name = "userHelpId", nullable = false)
    public int getUserHelpId() {
        return userHelpId;
    }

    public void setUserHelpId(int userHelpId) {
        this.userHelpId = userHelpId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserRoleEntity that = (UserRoleEntity) o;

        if (roleId != that.roleId) return false;
        if (userHelpId != that.userHelpId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = roleId;
        result = 31 * result + userHelpId;
        return result;
    }
}
