package com.uestc.hams.service;

import java.util.List;

import com.uestc.hams.base.DaoSupport;
import com.uestc.hams.entity.FamilyDisHistory;

public interface IFamilyDisHistoryService extends DaoSupport<FamilyDisHistory> {

	/**
	 * 根据健康体检id查找相应的家庭病床史记录
	 * @param id
	 * @return
	 */
	List<FamilyDisHistory> findByPhyExamId(Long id);
	/**
	 * 删除健康体检id对应的家庭病床史记录
	 * @param id
	 */
	void deleteByPhyExamId(Long id);
}
