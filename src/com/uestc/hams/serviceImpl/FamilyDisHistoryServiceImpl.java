package com.uestc.hams.serviceImpl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uestc.hams.base.DaoSupportImpl;
import com.uestc.hams.entity.FamilyDisHistory;
import com.uestc.hams.service.IFamilyDisHistoryService;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class FamilyDisHistoryServiceImpl extends DaoSupportImpl<FamilyDisHistory> implements IFamilyDisHistoryService {



	public List<FamilyDisHistory> findByPhyExamId(Long id) {
		
		return getSession().createQuery("from FamilyDisHistory fd where fd.phyExam.id=?").setParameter(0, id).list();
	}

	public void deleteByPhyExamId(Long id) {
		Query query = getSession().createQuery("delete from FamilyDisHistory fd where fd.phyExam.id=?");
		query.setLong(0, id);
		query.executeUpdate();
		
	}
}
