package com.gxwzu.system.dao.userRole.impl;

import com.gxwzu.system.dao.userRole.IUserRoleDao;
import com.gxwzu.system.model.userRole.UserRoleEntity;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Program: gdm
 * @Author: 麦奇
 * @Email： 1625017540@qq.com
 * @Create: 2019-07-03 23:16
 * @Describe：
 **/
@Repository
public class UserRoleDaoImpl implements IUserRoleDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void save(UserRoleEntity userRoleEntity) {
        sessionFactory.getCurrentSession().save(userRoleEntity);
    }

    @Override
    public void delete(UserRoleEntity userRoleEntity) {
        sessionFactory.getCurrentSession().delete(userRoleEntity);
    }

    @Override
    public List<UserRoleEntity> find(UserRoleEntity userRoleEntity) {
        Session currentSession = sessionFactory.getCurrentSession();
        Criteria criteria = currentSession.createCriteria(UserRoleEntity.class);
        List userHelpId = criteria.add(Restrictions.eq("userHelpId", userRoleEntity.getUserHelpId())).list();
        return userHelpId;
    }

    @Override
    public void update(UserRoleEntity userRoleEntity) {
        sessionFactory.getCurrentSession().update(userRoleEntity);
    }
}
