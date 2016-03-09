package com.uestc.hams.entity;

import java.util.HashSet;
import java.util.Set;

public class DistrictIns implements java.io.Serializable{
	private Long id;
	private String name;
	private String address;
	private String description;
	private String districtId;
	private DistrictIns parent;
	private Set<DistrictIns> children;
	private Set<User>users=new HashSet<User>();
	private Set<ResidentArchive>residentArchives=new HashSet<ResidentArchive>();
	
	
	
	
	public Set<ResidentArchive> getResidentArchives() {
		return residentArchives;
	}
	public void setResidentArchives(Set<ResidentArchive> residentArchives) {
		this.residentArchives = residentArchives;
	}
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDistrictId() {
		return districtId;
	}
	public void setDistrictId(String districtId) {
		this.districtId = districtId;
	}
	public DistrictIns getParent() {
		return parent;
	}
	public void setParent(DistrictIns parent) {
		this.parent = parent;
	}
	public Set<DistrictIns> getChildren() {
		return children;
	}
	public void setChildren(Set<DistrictIns> children) {
		this.children = children;
	}
	

}
