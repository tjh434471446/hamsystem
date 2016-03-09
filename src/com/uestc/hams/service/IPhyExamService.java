package com.uestc.hams.service;

import java.util.List;

import com.uestc.hams.base.DaoSupport;
import com.uestc.hams.entity.PhyExam;

public interface IPhyExamService extends DaoSupport<PhyExam> {
	
	List<PhyExam> findByArchiveIdAndPage(Long rsaId,int page,int pageSize) ;
	
	List<PhyExam> findByPage(int page, int pageSize);
	
	int findTotalPagesByArchiveId(Long id,int pageSize);
	
	int findTotalPages(int pageSize);
}
