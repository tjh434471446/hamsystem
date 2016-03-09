package com.uestc.hams.serviceImpl;


import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uestc.hams.base.DaoSupportImpl;
import com.uestc.hams.entity.HospitalHistory;
import com.uestc.hams.service.IHospitalHistoryService;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class HospitalHistoryServiceImpl extends DaoSupportImpl<HospitalHistory> implements IHospitalHistoryService {


	public List<HospitalHistory> findByPhyExamId(Long id) {
		
		return getSession().createQuery("from HospitalHistory hh where hh.phyExam.id=?").setParameter(0, id).list();
	}

	public void deleteByPhyExamId(Long id) {
		Query query = getSession().createQuery("delete from HospitalHistory hh where hh.phyExam.id=?");
		query.setLong(0, id);
		query.executeUpdate();
		
	}

	

}
