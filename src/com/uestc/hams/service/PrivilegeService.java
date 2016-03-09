package com.uestc.hams.service;

import java.util.Collection;
import java.util.List;

import com.uestc.hams.base.DaoSupport;
import com.uestc.hams.entity.Privilege;

public interface PrivilegeService extends DaoSupport<Privilege>{

	List<Privilege> findTopList();

	Collection<String> getAllPrivilegeUrls();

}
