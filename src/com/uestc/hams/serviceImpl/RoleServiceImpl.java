package com.uestc.hams.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uestc.hams.base.DaoSupportImpl;
import com.uestc.hams.entity.Role;
import com.uestc.hams.service.RoleService;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class RoleServiceImpl extends DaoSupportImpl<Role> implements RoleService{


	public Role findRoleByName(String name) {
		List<Role> roles = getSession().createQuery("from Role r where r.name=?").setParameter(0, name).list();
		Role role = roles.get(0);
		return role;
	}

	/*@Resource
	private RoleDao roleDao;*/
	/*public List findAll() {
		return roleDao.findAll();
		
	}
	public void delete(Long id) {
		roleDao.delete(id);
	}
	public void save(Role role) {
		roleDao.save(role);
	}
	public Role findById(Long id) {
		return roleDao.getById(id);
	}
	public void update(Role role) {
		roleDao.update(role);
	}*/

}
