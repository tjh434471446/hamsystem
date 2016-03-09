package com.uestc.hams.serviceImpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.uestc.hams.base.DaoSupportImpl;
import com.uestc.hams.entity.Family;
import com.uestc.hams.entity.ResidentArchive;
import com.uestc.hams.service.FamilyService;


@Service
//@Transactional合并dao层后，调用的是dao层的方法,这些方法，是没有开事务的
@SuppressWarnings("unchecked")//service采用的单例模式，所以注入时使用的都是一个service
public class FamilyServiceImpl   extends DaoSupportImpl<Family> implements FamilyService{

	

//	public List<User> getMembers(Long id) {
//		
//		Session session=getSession();
//		Criteria cr=session.createCriteria(Family.class);
//		Family family=getById(id);
//		List<User> list=cr.add(Restrictions.eq("family", family)).list();
//		return list;
//	}
	

	public Long getLargestId() {
		
		Long id=new Long(1);
		Session session=getSession();
		Criteria cr=session.createCriteria(Family.class);
		cr.addOrder(Order.desc("id"));
		List<Family> list=cr.list();
		if(!list.isEmpty() && list!=null){
			Family family=list.get(0);
			id=family.getId();
		}
		return id;
	}

public ResidentArchive getFamilyHead(Long id) {
		
		Session session=getSession();
		Criteria cr=session.createCriteria(ResidentArchive.class);
		
		Family family = getById(id);
		cr.add(Restrictions.eq("family", family)).add(Restrictions.eq("relationShip", "head"));
		List<ResidentArchive> list=cr.list();
		if(!list.isEmpty() && list!=null){
			ResidentArchive head = list.get(0);
			
			return head;
		}
		
		return null;
	}

public boolean findByUserId(Long id) {
	List<Family> l=getSession().createQuery("from Family f where f.head.id=? ").setParameter(0, id).list();
	if(l!=null && !l.isEmpty()){
		return true;
	}
	return false;
}


	
	
	
	

}
