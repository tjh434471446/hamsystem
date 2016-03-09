package com.uestc.hams.entity;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;

/*
 *用户类，实现序列化接口，当服务器重启时，不会重新登陆 
 */
public class User implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3605490609027461140L;
	private Long id;
	private String loginName;
	private String name;
	private String gender;
	private String password;
	private String phoneNumber; // 电话号码
	private String email; // 电子邮件
	private String description; // 说明
	private Set<Role> roles=new HashSet<Role>();
	private DistrictIns districtIns;
	
	
	//档案相关
	private Set<ResidentArchive>doctorArchives;//医生责任档案
	private Set<ResidentArchive>recorderArchives;//记录员档案
	private ResidentArchive residentArchive;//居民档案
	
	/**
	 * 判断是否有权限
	 * @param name
	 * @return
	 */
	public boolean hasPrivilegeByName(String name){
		if("admin".equals(loginName)){
			return true;
		}
		
		for(Role role:roles){
			for(Privilege priv:role.getPrivileges()){
				if(priv.getName().equals(name)){
					return true;
				}
			}
		}
		return false;
	}
	
	public boolean hasPrivilegeByUrl(String privUrl){
		
		
		if("admin".equals(loginName)){
			return true;
		}
		// >> 去掉后面的参数
		int pos = privUrl.indexOf("?");
		if (pos > -1) {
			privUrl = privUrl.substring(0, pos);
		}
		// >> 去掉UI后缀
		if (privUrl.endsWith("UI")) {
			privUrl = privUrl.substring(0, privUrl.length() - 2);
		}
		
		//如果本url不需要控制，登陆用户可以使用：例如主页面，权限控制也
		Collection<String>allPrivilegeUrls=(Collection<String>) ActionContext.getContext().getApplication().get("allPrivilegeUrls");
		if(!allPrivilegeUrls.contains(privUrl)){
			return true;
		}else{
			for(Role role:roles){
				for(Privilege priv:role.getPrivileges()){
					if(privUrl.equals(priv.getUrl())){
						return true;
					}
				}
			}
			return false;
		}
			
		
	}
	
	
	public DistrictIns getDistrictIns() {
		return districtIns;
	}
	public void setDistrictIns(DistrictIns districtIns) {
		this.districtIns = districtIns;
	}
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<ResidentArchive> getDoctorArchives() {
		return doctorArchives;
	}

	public void setDoctorArchives(Set<ResidentArchive> doctorArchives) {
		this.doctorArchives = doctorArchives;
	}

	public Set<ResidentArchive> getRecorderArchives() {
		return recorderArchives;
	}

	public void setRecorderArchives(Set<ResidentArchive> recorderArchives) {
		this.recorderArchives = recorderArchives;
	}

	public ResidentArchive getResidentArchive() {
		return residentArchive;
	}

	public void setResidentArchive(ResidentArchive residentArchive) {
		this.residentArchive = residentArchive;
	}
	
}
