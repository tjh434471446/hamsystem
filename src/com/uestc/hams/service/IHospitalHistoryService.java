package com.uestc.hams.service;

import java.util.List;

import com.uestc.hams.base.DaoSupport;
import com.uestc.hams.entity.HospitalHistory;


public interface IHospitalHistoryService extends DaoSupport<HospitalHistory>{

	/**
	 * 根据健康体检id查找相应的住院史记录
	 * @param id
	 * @return
	 */
	List<HospitalHistory> findByPhyExamId(Long id);
	/**
	 * 删除健康体检id对应的住院史记录
	 * @param id
	 */
	void deleteByPhyExamId(Long id);
}
