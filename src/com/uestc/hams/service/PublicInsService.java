package com.uestc.hams.service;

import java.util.List;

import com.uestc.hams.base.DaoSupport;
import com.uestc.hams.entity.PublicIns;

public interface PublicInsService extends DaoSupport<PublicIns>{

	List<PublicIns> findByName(String name, Long id);

	void deleteByName(String name, Long id);

}
