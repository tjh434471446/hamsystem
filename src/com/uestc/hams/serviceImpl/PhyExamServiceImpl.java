package com.uestc.hams.serviceImpl;


import java.util.List;
import org.hibernate.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.uestc.hams.base.DaoSupportImpl;
import com.uestc.hams.entity.PhyExam;
import com.uestc.hams.service.IPhyExamService;

@Service
@Transactional
public class PhyExamServiceImpl extends DaoSupportImpl<PhyExam> implements
		IPhyExamService {
	
	/*
	 * 1. HibernateCallback是一个接口，该接口只有一个方法doInHibernate(org.hibernate.Session session)，该方法只有一个参数 Session。

2. 方法 doInHibernate 的方法体就是 Spring执行的持久化操作。

3. 使用HibernateTemplate执行execute(new HibernateCallback())方法，从HibernateCallback中得到session,在此session中做多个操作，并
希望这些操作位于同一个事务中。

4. 回调实际就是一种事件触发模式，就象连环地雷一样，一旦触发一个，这个再触发另外一个，你在find这个方法被执行时，希望同时执行其他方法，就需要回调。
	 * 
	 
private HibernateTemplate hibernateTemplate ;
	
	public void setSessionFactory(SessionFactory sessionFactory){
		this.hibernateTemplate = 
			new HibernateTemplate(sessionFactory);
	}
*/
	/*
	 * 根据健康档案id查找对应的健康体检记录
	@SuppressWarnings("unchecked")
	public List<PhyExam> findByArchiveIdAndPage(final int id,final int page,final int pageSize) {
		
		return (List<PhyExam>) hibernateTemplate.execute(new HibernateCallback() {		
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {	
	//FirstResult:从firstResult开始截取
	// （page-1）*pageSize
				return session
				.createQuery("From PhyExam p where p.residentArchive.id=?").setParameter(0, id)
				.setFirstResult((page-1)*pageSize)
				.setMaxResults(pageSize)
				.list();
			}
		});
		}
	*/
	
	/**
	 * 分页查找所有的健康体检记录
	 */
	@SuppressWarnings("unchecked")
	public List<PhyExam> findByPage(int page, int pageSize) {
			Query query = getSession().createQuery("From PhyExam");
			query.setFirstResult((page-1)*pageSize);
			query.setMaxResults(pageSize);
			List<PhyExam> list = query.list();
		return list;
	}
	
	/**
	 * 根据健康档案id分页查找对应的健康体检记录
	 * 
	 */
	@SuppressWarnings("unchecked")
	public List<PhyExam> findByArchiveIdAndPage(Long id, int page, int pageSize) {
		
		return getSession()
		.createQuery("From PhyExam p where p.residentArchive.id=?").setParameter(0, id)
		.setFirstResult((page-1)*pageSize)
		.setMaxResults(pageSize)
		.list();
	}

	/**
	 * 根据页容量查询总页数
	 */
	public int findTotalPages(int pageSize) {
		//查询出总的记录数
		int rows = Integer.valueOf(getSession().createQuery("select count(*) from PhyExam ").list().get(0).toString());
		if(rows%pageSize == 0){
			return rows/pageSize;
		}else{
			return rows/pageSize + 1;
		}
	}

	/**
	 * 根据健康档案id和页容量查询总页数
	 */
	public int findTotalPagesByArchiveId(Long id, int pageSize) {
		
		//查询出总的记录数
		int rows = Integer.valueOf(getSession().createQuery("select count(*) from PhyExam p where p.residentArchive.id=? ")
				.setParameter(0, id)
				.list().get(0).toString());
		if(rows%pageSize == 0){
			return rows/pageSize;
		}else{
			return rows/pageSize + 1;
		}
	}
	

	



}
