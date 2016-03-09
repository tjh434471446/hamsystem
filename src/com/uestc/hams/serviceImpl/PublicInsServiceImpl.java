package com.uestc.hams.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.uestc.hams.base.DaoSupportImpl;
import com.uestc.hams.entity.PublicIns;
import com.uestc.hams.service.PublicInsService;

@Service
@SuppressWarnings("unchecked")
public class PublicInsServiceImpl extends DaoSupportImpl<PublicIns> implements PublicInsService {

	public List<PublicIns> findByName(String name,Long id) {
		
		return getSession().createQuery("from PublicIns p where p.name=? and p.rsBloodTran.id=?")//
		.setParameter(0, name)//
		.setParameter(1, id)//
		.list();
	}

	public void deleteByName(String name, Long id) {
		List<PublicIns> lp=findByName(name, id);
	/*	for(PublicIns pi:lp){
			getSession().delete(pi);
		}*/
		for(PublicIns pi:lp){
			pi.setRsBloodTran(null);
		}
	}


}
