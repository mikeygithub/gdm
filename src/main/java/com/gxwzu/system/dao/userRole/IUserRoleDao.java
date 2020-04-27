package com.gxwzu.system.dao.userRole;

import com.gxwzu.system.model.userRole.UserRoleEntity;

import java.util.List;

/**
 * @Program: gdm
 * @Author: 麦奇
 * @Email： 1625017540@qq.com
 * @Create: 2019-07-03 23:13
 * @Describe：
 **/
public interface IUserRoleDao {

    void save(UserRoleEntity userRoleEntity);

    void delete(UserRoleEntity userRoleEntity);

    List<UserRoleEntity> find(UserRoleEntity userRoleEntity);

    void update(UserRoleEntity userRoleEntity);
}
