package com.uestc.hams.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uestc.hams.base.DaoSupportImpl;
import com.uestc.hams.entity.BloodPressure;
import com.uestc.hams.service.IBloodPressureService;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class BloodPressureServiceImpl extends DaoSupportImpl<BloodPressure> implements IBloodPressureService{

	/**
	 * 根据健康档案id号查找相应血压
	 */
	public List<BloodPressure> findByResidentArchiveId(Long id) {
	
		return getSession().createQuery("from BloodPressure bp where bp.residentArchive.id=? order by recordTime")
				.setParameter(0, id)
				.list();
	}

	
	
}