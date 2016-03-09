package com.uestc.hams.base;

import java.util.List;

public interface DaoSupport<T> {
	
	  void save(T entity);
	  void delete(Long id);
	  void update(T entity);
	  T getById(Long id);
	  List<T> findAll();
	  List<T> getByIds(Long[] ids);
	  
}
