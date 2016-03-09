package com.uestc.hams.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import com.uestc.hams.base.DaoSupportImpl;
import com.uestc.hams.entity.DistrictIns;
import com.uestc.hams.service.DistrictInsService;

@Service
//@Transactional合并dao层后，调用的是dao层的方法,这些方法，是没有开事务的
@SuppressWarnings("unchecked")//service采用的单例模式，所以注入时使用的都是一个service
public class DistrictInsServiceImpl extends DaoSupportImpl<DistrictIns> implements DistrictInsService{
	
/*	@Resource
	private DistrictInsDao districtInsDao;
	*/
	@Resource
	private SessionFactory sessionFactory;
	

	public List<DistrictIns> findChildren(Long id) {
		return sessionFactory.getCurrentSession()//
		.createQuery("from DistrictIns d where d.parent.id=?")//
		.setParameter(0, id)
		.list()
		;
	}

	public List<DistrictIns> findTopList() {
		return sessionFactory.getCurrentSession().//
		createQuery("from DistrictIns d where d.parent is null")
		.list();
	}
	
	/*public List<DistrictIns> findAll() {
 		return districtInsDao.findAll();
	}

	public void delete(Long id) {
		districtInsDao.delete(id);
		
	}


	public DistrictIns getById(Long id) {
		return districtInsDao.getById(id);
	}

	public void save(DistrictIns districtIns) {
		districtInsDao.save(districtIns);
	}

	public void update(DistrictIns districtIns) {
		districtInsDao.update(districtIns);
	}*/

}
