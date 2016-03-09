package com.uestc.hams.service;

import java.util.List;

import com.uestc.hams.base.DaoSupport;
import com.uestc.hams.entity.Medication;

public interface IMedicationService extends DaoSupport<Medication>{

	/**
	 * 根据健康体检id查找相应的主要用药情况记录
	 * @param id
	 * @return
	 */
	List<Medication> findByPhyExamId(Long id);
	/**
	 * 删除健康体检id对应的主要用药情况记录
	 * @param id
	 */
	void deleteByPhyExamId(Long id);
}
