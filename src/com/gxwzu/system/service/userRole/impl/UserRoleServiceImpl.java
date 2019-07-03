package com.gxwzu.system.service.userRole.impl;

import com.gxwzu.system.dao.userRole.IUserRoleDao;
import com.gxwzu.system.model.userRole.UserRoleEntity;
import com.gxwzu.system.service.userRole.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Program: gdm
 * @Author: 麦奇
 * @Email： 1625017540@qq.com
 * @Create: 2019-07-03 23:30
 * @Describe：
 **/
@Service
public class UserRoleServiceImpl implements UserRoleService {

    @Autowired
    private IUserRoleDao iUserRoleDao;

    @Override
    public void save(UserRoleEntity userRoleEntity) {
        iUserRoleDao.save(userRoleEntity);
    }

    @Override
    public void delete(UserRoleEntity userRoleEntity) {
        iUserRoleDao.delete(userRoleEntity);
    }

    @Override
    public List<UserRoleEntity> find(UserRoleEntity userRoleEntity) {
        return iUserRoleDao.find(userRoleEntity);
    }

    @Override
    public void update(UserRoleEntity userRoleEntity) {
        iUserRoleDao.update(userRoleEntity);
    }
}
