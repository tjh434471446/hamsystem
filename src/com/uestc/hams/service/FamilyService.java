package com.uestc.hams.service;

import java.util.List;

import com.uestc.hams.base.DaoSupport;
import com.uestc.hams.entity.Family;
import com.uestc.hams.entity.ResidentArchive;
import com.uestc.hams.entity.User;

public interface FamilyService extends DaoSupport<Family> {
	
//	public List<User> getMembers(Long id);
	
   public Long getLargestId();
   
	public ResidentArchive getFamilyHead(Long id);

	public boolean findByUserId(Long id);
}
