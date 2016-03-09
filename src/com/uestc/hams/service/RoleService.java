package com.uestc.hams.service;

import com.uestc.hams.base.DaoSupport;
import com.uestc.hams.entity.Role;

/**
 * 服务层
 * @author wujingnan
 *
 */

public interface RoleService extends DaoSupport<Role>{
	/**
	 * 根据角色名称找到角色对象
	 * @param name
	 * @return
	 */
	Role findRoleByName(String name);
	/*List findAll();

	void delete(Long id);

	void save(Role role);

	Role findById(Long id);

	void update(Role role);*/
}
