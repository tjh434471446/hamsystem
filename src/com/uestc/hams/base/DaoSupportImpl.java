package com.uestc.hams.base;

import java.lang.reflect.ParameterizedType;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * 
 * @author wujingnan
 *
 * @param <T>
 */
//@Repository  标识为数据访问层，（Dao层） 但是可在子类中用，父类同样会注入
@Transactional//这个注解可以被继承
@SuppressWarnings("unchecked")
public class DaoSupportImpl<T> implements DaoSupport<T>{

	@Resource
	private SessionFactory sessionFactory;
	
	private Class<T> clazz=null;
	
	//在父类的构造方法，在调用子类的时候能被调用父类的构造方法
	public DaoSupportImpl() {
		//this代表新建的对象而不是当前类,getGenericInterfaces代表 带泛型的父类
		ParameterizedType pt=(ParameterizedType) this.getClass().getGenericSuperclass();//转换为泛化的类型
		this.clazz=(Class<T>) pt.getActualTypeArguments()[0];//返回类型参数数组，获取第一个.
		System.out.println("调用baseDaoImpl");
		System.out.println("clazz-->"+clazz);
		System.out.println( this.getClass().getGenericSuperclass());
	}
	
	//让子类也可以调用
	protected Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public void delete(Long id) {
		if (id != null) {
			getSession().delete(getById(id));
		}
	}

	public List<T> findAll() {
		return getSession().createQuery("FROM " + clazz.getSimpleName()).list();
	}

	public T getById(Long id) {
		if(id==null){
			return null;
		}
		return (T) getSession().get(clazz, id);
	}

	public List<T> getByIds(Long[] ids) {
		if (ids == null || ids.length == 0) {
			return Collections.EMPTY_LIST;// 这里应该返回是空集合(当返回对象为集合时，最好不返回空值)
		} else {
			return getSession().createQuery(//
					"FROM " + clazz.getSimpleName() + " WHERE id IN (:ids)")//
					.setParameterList("ids", ids)//
					.list();
		}

	}

	public void save(T entity) {
		getSession().save(entity);
	}

	public void update(T entity) {
		getSession().update(entity);
	}

}
