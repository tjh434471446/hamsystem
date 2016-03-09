package com.uestc.hams.serviceImpl;

import java.util.Collection;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uestc.hams.base.DaoSupportImpl;
import com.uestc.hams.entity.Privilege;
import com.uestc.hams.service.PrivilegeService;
@Service
@SuppressWarnings("unchecked")
@Transactional
public class PrivilegeServiceImpl extends DaoSupportImpl<Privilege> implements PrivilegeService{

	
	public List<Privilege> findTopList() {
		
		return getSession().createQuery//
		("FROM Privilege p WHERE p.parent IS NULL")//
		.list();
	}

	public Collection<String> getAllPrivilegeUrls() {
		return getSession().createQuery(//
		"SELECT DISTINCT p.url FROM Privilege p WHERE p.url IS NOT NULL")//
		.list();
	}
	
}
