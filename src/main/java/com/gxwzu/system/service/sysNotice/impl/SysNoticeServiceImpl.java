package com.gxwzu.system.service.sysNotice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.core.util.DateUtils;
import com.gxwzu.system.dao.sysNotice.ISysNoticeDao;
import com.gxwzu.system.model.sysNotice.SysNotice;
import com.gxwzu.system.service.sysNotice.ISysNoticeService;

@Service("sysNoticeService")
public class SysNoticeServiceImpl extends BaseServiceImpl<SysNotice> implements ISysNoticeService {
	@Autowired
	private ISysNoticeDao SysNoticeDao;

	@Override
	public BaseDao<SysNotice> getDao() {

		return this.SysNoticeDao;
	}

	public Result<SysNotice> find(SysNotice model, int page, int size) {
		return SysNoticeDao.find(model, page, size);
	}

	public SysNotice add(SysNotice model) {
		return SysNoticeDao.save(model);
	}

	public SysNotice del(Integer id) {
		SysNotice model = SysNoticeDao.findById(id);
		System.out.println(model.getNoticeName());
		SysNoticeDao.remove(model);
		return model;

	}

	public SysNotice findById(Integer id) {
		return SysNoticeDao.findById(id);
	}


	@Override
	public List<SysNotice> findByExample(SysNotice model) {
		return SysNoticeDao.findByExample(model);
	}

	@Override
	public List<SysNotice> findAll(SysNotice model) {
		return SysNoticeDao.findAll(model);
	}

	@Override
	public List<SysNotice> findByMostNew(SysNotice model,Integer newNum) {
		return SysNoticeDao.findByMostNew(model,newNum);
	}

}
