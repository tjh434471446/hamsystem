package com.uestc.hams.service;

import java.util.List;

import com.uestc.hams.base.DaoSupport;
import com.uestc.hams.entity.DistrictIns;

public interface DistrictInsService extends DaoSupport<DistrictIns>{

	List<DistrictIns> findTopList();

	List<DistrictIns> findChildren(Long id);


	/*List<DistrictIns> findAll();

	DistrictIns getById(Long id);

	void delete(Long id);

	void save(DistrictIns districtIns);

	void update(DistrictIns districtIns);*/

}
