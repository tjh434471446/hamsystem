package com.uestc.hams.service;

import java.util.List;

import com.uestc.hams.base.DaoSupport;
import com.uestc.hams.entity.User;

public interface UserService extends DaoSupport<User>{

	User findByLoginNameAndPassword(String loginName,String password);

	List<User> findByRoleDoctor();

	List<User> findByRoleRecorder();

	User findByRsArchiveId(Long id);


}
