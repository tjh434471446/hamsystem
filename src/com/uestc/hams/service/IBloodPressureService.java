package com.uestc.hams.service;

import java.util.List;

import com.uestc.hams.base.DaoSupport;
import com.uestc.hams.entity.BloodPressure;

public interface IBloodPressureService extends DaoSupport<BloodPressure> {

	List<BloodPressure> findByResidentArchiveId(Long id);
}
