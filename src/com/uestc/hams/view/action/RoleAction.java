package com.uestc.hams.view.action;

import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.uestc.hams.base.BaseAction;
import com.uestc.hams.entity.Privilege;
import com.uestc.hams.entity.Role;
import com.uestc.hams.service.RoleService;

/**
 * 
 * @author wujingnan
 *	针对页面准备数据，并返回需要的值
 */
@Controller
@Scope("prototype")
public class RoleAction extends BaseAction<Role> {
	private Long[] privilegeIds;
	/**
	 * 请求（xx.action&id=3&name="name"&age=12&xx=xx）过来后，首先经过的是拦截器(会创建和初始化一些值栈)和action和result
	 * 对于值栈valueStack中，有两个结构：1、map；2、对象栈Stack（action对象，其他push进去的对象）
	 */
	
	/*  1、结合：xx.action&id=3&name="name"&age=12&xx=xx对于发出请求传中通过参数拦截器将参数封装在值栈中
		2、首先考虑对象栈栈顶，（如果实现modeldriven的话，modeldriven会将model封装在栈顶上modeldriven拦截器的原因）
		3、其本来就封装了action这个对象，若action中有get，set方法，自动封装到里面去
		4、如果对象栈没有该参数，则考虑map，map中有parameters对象，会把所有属性封装进去
		5、值栈对象的作用范围：请求（请求，application，session），代替request作用域
		5、action类中值栈的用法，则有ActionContext.getContext().getvalueStack()得到值栈
		6、操作map中的对象用ongl表示中的#，#user.name代表map.get("user").getname();value="user"则代表：getvalue("user")；
	*/	
	/*private Long id;
	private String name;//对应于界面的上的<s:property name="">
	private String description;*/

	//列表
	public String list() throws Exception {
		//准备数据
		List roleList=roleService.findAll();
		ActionContext.getContext().put("roleList", roleList);
		return "list";
	}

	//增加
	public String add() throws Exception {
		
		//封装到对象中
		/*Role role=new Role();
		role.setName(name);
		role.setDescription(description);*/
		//保存至数据库中
		roleService.save(model);
		//重定向到list
		return "toList";
	}

	public String addUI() throws Exception {
		return "saveUI";
	}

	public String delete() throws Exception {
		//执行删除
		roleService.delete(model.getId());
		return "toList";
	}

	public String edit() throws Exception {
		//从数据库中得到修改的对象
		System.out.println(model.getId());
		Role role=roleService.getById(model.getId());
		//设置对象值
		role.setDescription(model.getDescription());
		role.setName(model.getName());
		//更新数据库
		roleService.update(role);
		return "toList";
	}

	public String editUI() throws Exception {
		//准备回显数据
		Role role=roleService.getById(model.getId());
		ActionContext.getContext().getValueStack().push(role);
		return "saveUI";
	}
	
	public String setPrivilegeUI() throws Exception {
		//准备回显数据
		Role role=roleService.getById(model.getId());
		ActionContext.getContext().getValueStack().push(role);
		//回显的应该是ids
		if(role.getPrivileges()!=null){
			int index=0;
			privilegeIds=new Long[role.getPrivileges().size()];
			for(Privilege priv:role.getPrivileges()){
				privilegeIds[index++]=priv.getId();
			}
		}
		//需要所有权限数据
		List<Privilege>privilegeList=privilegeService.findAll();
		ActionContext.getContext().put("privilegeList", privilegeList);
		
		return "setPrivilegeUI";
	}

	public String setPrivilege() throws Exception {
		//准备数据
		Role role= roleService.getById(model.getId());
		//设置
		List<Privilege>privilegeList=privilegeService.getByIds(privilegeIds);
		role.setPrivileges(new HashSet<Privilege>(privilegeList));
		//跟新数据库
		
		roleService.update(role);
		return "toList";
	}

	public Long[] getPrivilegeIds() {
		return privilegeIds;
	}

	public void setPrivilegeIds(Long[] privilegeIds) {
		this.privilegeIds = privilegeIds;
	}


	/*public Long getId() {
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
	}*/

}
