package com.uestc.hams.serviceImpl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uestc.hams.base.DaoSupportImpl;
import com.uestc.hams.entity.Role;
import com.uestc.hams.entity.User;
import com.uestc.hams.service.UserService;

@Service
@Transactional//开启事物
public class UserServiceImpl extends DaoSupportImpl<User> implements UserService{

	public User findByLoginNameAndPassword(String loginName,String password) {
		//返回唯一值结果
		return (User) getSession().createQuery("From User u where u.loginName=? and u.password=?")//
		.setParameter(0, loginName)//
		.setParameter(1, password)//
		.uniqueResult();
		 
	}

	public List<User> findByRoleDoctor() {
		//此处改为id好一点。。初始化数据需要改
		Role role=(Role) getSession().createQuery("from Role r where r.name='医生'").uniqueResult();
		if(role==null){
			return Collections.EMPTY_LIST;
		}
		List<User> list = new ArrayList(role.getUsers());
		/*getSession().createQuery("from User u where ")*/
		return list;
	}

	public List<User> findByRoleRecorder() {
		Role role=(Role) getSession().createQuery("from Role r where r.name='记录员'").uniqueResult();
		if(role==null){
			return Collections.EMPTY_LIST;
		}
		List<User> list = new ArrayList(role.getUsers());
		/*getSession().createQuery("from User u where ")*/
		return list;
	}

	public User findByRsArchiveId(Long id) {
		
		return (User) getSession().createQuery("from User u where u.residentArchive.id=?")//
		.setParameter(0, id).uniqueResult();
	}



}
