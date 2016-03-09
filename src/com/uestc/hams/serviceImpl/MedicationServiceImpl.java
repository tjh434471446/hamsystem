package com.uestc.hams.serviceImpl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uestc.hams.base.DaoSupportImpl;
import com.uestc.hams.entity.FamilyDisHistory;
import com.uestc.hams.entity.Medication;
import com.uestc.hams.service.IMedicationService;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class MedicationServiceImpl extends DaoSupportImpl<Medication> implements IMedicationService {


	
	public List<Medication> findByPhyExamId(Long id) {
		
		return getSession().createQuery("from Medication m where m.phyExam.id=?").setParameter(0, id).list();
	}

	public void deleteByPhyExamId(Long id) {
		Query query = getSession().createQuery("delete from Medication m where m.phyExam.id=?");
		query.setLong(0, id);
		query.executeUpdate();
		
	}
}
