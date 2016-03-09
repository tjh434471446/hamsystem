package com.uestc.hams.entity;

import java.util.HashSet;
import java.util.Set;

public class Role implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String name;
	private String description;
	private String districtId;
	private Set<User> users=new HashSet<User>();
	private Set<Privilege> privileges=new HashSet<Privilege>();//当为集合类型的属性一般都选择初始化时，因为一般返回空集合不会报空指针异常
	
	public Role(){
		
	}
	
	public Role(String name,Set<Privilege> privileges){
		this.name=name;
		this.privileges=privileges;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	public String getDistrictId() {
		return districtId;
	}
	public void setDistrictId(String districtId) {
		this.districtId = districtId;
	}
	public Set<Privilege> getPrivileges() {
		return privileges;
	}
	public void setPrivileges(Set<Privilege> privileges) {
		this.privileges = privileges;
	}
	
	

	
}
