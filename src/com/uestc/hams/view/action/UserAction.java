package com.uestc.hams.view.action;

import java.util.HashSet;
import java.util.List;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.uestc.hams.base.BaseAction;
import com.uestc.hams.entity.DistrictIns;
import com.uestc.hams.entity.Role;
import com.uestc.hams.entity.User;
import com.uestc.hams.util.DistrictInsUtils;
@Controller//spring能找到
@Scope("prototype")//多例模式，以免访问的都是一个action
public class UserAction extends BaseAction<User>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/*private User user;
	private List<User> users;
	*/
	private Long districtInsId;
	private Long[] roleIds;
	
	public String list() throws Exception {
		List<User> userList=userService.findAll();
		ActionContext.getContext().put("userList", userList);
		return "list";
	}
	public String delete() throws Exception {
		userService.delete(model.getId());
		return "toList";
	}
	public String addUI() throws Exception {
		//准备机构列表
		List<DistrictIns> topList = districtInsService.findTopList();
		List<DistrictIns> districtInsList= DistrictInsUtils.getAllDistrictIns(topList);
		ActionContext.getContext().put("districtInsList", districtInsList);
		//准备角色列表
		List<Role>roleList=roleService.findAll();
		ActionContext.getContext().put("roleList",roleList);
		return "saveUI";
	}
	public String add() throws Exception {
		//使用model时要设置未封装的属性
		//所以需要得到部门id
		if(districtInsId!=null){
			model.setDistrictIns(districtInsService.getById(districtInsId));
		}
		if(roleIds!=null){
		model.setRoles(new HashSet<Role>(roleService.getByIds(roleIds)));
		}
		//设置默认密码为1234
		String md5Digest = DigestUtils.md5Hex("1234");
		model.setPassword(md5Digest);
		
		userService.save(model);
		
		
	/*	model.setRoles()*/
		//这个地方是否需要这个怎么存角色问题
		
		return "toList";
	}
	public String editUI() throws Exception {
		//1、页面数据
		//准备机构列表
		List<DistrictIns> topList = districtInsService.findTopList();
		List<DistrictIns> districtInsList= DistrictInsUtils.getAllDistrictIns(topList);
		ActionContext.getContext().put("districtInsList", districtInsList);
		//准备角色列表
		List<Role>roleList=roleService.findAll();
		ActionContext.getContext().put("roleList",roleList);
		
		//2、回显数据
		User user=userService.getById(model.getId());
		if(user.getDistrictIns()!=null){
			districtInsId=user.getDistrictIns().getId();
		}
		if(user.getRoles()!=null){
			roleIds=new Long[user.getRoles().size()];
			int index=0;
			for(Role role:user.getRoles()){
				roleIds[index++]=role.getId();
			}
		}
		ActionContext.getContext().getValueStack().push(user);
		
		return "saveUI";
	}
	//????????
	public String edit() throws Exception {
		//1、取出原对象??
		model=userService.getById(model.getId());//将这行的注释去掉后出现异常
		//2、设置
		model.setDistrictIns(districtInsService.getById(districtInsId));
		model.setRoles(new HashSet<Role>(roleService.getByIds(roleIds)));
		//3、更新到数据库
		userService.update(model);
		return "toList";
	}
	
	/*初始化密码*/
	public String initPassword() throws Exception {
		User user=userService.getById(model.getId());
		String md5Digest = DigestUtils.md5Hex("1234");
		model.setPassword(md5Digest);
		userService.update(user);
		return "toList";
	}
	/*登陆页面*/
	public String loginUI() throws Exception {
		return "loginUI";
	}
	/*登陆*/
	public String login() throws Exception {
		String password=DigestUtils.md5Hex(model.getPassword());
		//验证
		User user=userService.findByLoginNameAndPassword(model.getLoginName(),password);
		if(user!=null){
			//登陆用户
			ActionContext.getContext().getSession().put("user", user);
			return "toIndex";
		}else{
			addFieldError("login", "用户名或密码错误");
			return "loginUI";//??
		}
			
	}
	/*注销*/
	public String logout() throws Exception {
		//与登陆相反的操作
		ActionContext.getContext().getSession().remove("user");
		return "logout";
	}
	
	
	public Long getDistrictInsId() {
		return districtInsId;
	}
	public void setDistrictInsId(Long districtInsId) {
		this.districtInsId = districtInsId;
	}
	public Long[] getRoleIds() {
		return roleIds;
	}
	public void setRoleIds(Long[] roleIds) {
		this.roleIds = roleIds;
	}
	
	
/*
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	*/
	
	
}
