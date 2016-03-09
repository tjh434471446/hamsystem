package com.uestc.hams.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uestc.hams.base.DaoSupportImpl;
import com.uestc.hams.entity.ResidentArchive;
import com.uestc.hams.service.ResidentArchiveService;
@Service
@Transactional
@SuppressWarnings("unchecked")
public class ResidentArchiveServiceImpl extends DaoSupportImpl<ResidentArchive> implements ResidentArchiveService {

	public Boolean findByRsId(String rsid) {
		List<ResidentArchive> rslist=getSession()//
		.createQuery("from ResidentArchive r where r.rsId=?")//
		.setParameter(0, rsid)//
		.list();
		System.out.println(rslist.size());
		if(rslist==null||rslist.size()==0){
			return true;
		}
		return false;
	}

	public List<ResidentArchive> findDoctorList(Long id) {
		
		return getSession().createQuery("from ResidentArchive r where r.doctor.id=?")//
		.setParameter(0, id)//
		.list();
	}

	public List<ResidentArchive> findHypertensionArchiveList() {
		return getSession().createQuery("from ResidentArchive r where r.diseaseString like '0%'")//
		.list();
	}
	
public boolean isIdExist(Long id) {
		
		List<ResidentArchive> raList = getSession().createQuery("from ResidentArchive r where r.id = ?").setParameter(0, id).list();
		
		if(!raList.isEmpty() && raList!=null){
			
			return true;
			
		}
		return false;
	}

}
