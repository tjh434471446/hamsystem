package com.uestc.hams.view.action;

import java.util.List;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.uestc.hams.base.BaseAction;
import com.uestc.hams.entity.DistrictIns;
import com.uestc.hams.util.DistrictInsUtils;

/**
 * 地区医疗机构类
 * @author 吴静南
 *
 */
@Controller
@Scope("prototype")
public class DistrictInsAction extends BaseAction<DistrictIns>{
	
	private DistrictIns model=new DistrictIns();
	private Long parentId;
	
	
	public DistrictIns getModel() {
		return model;
	}
	
	
	/** 列表 */
	public String list() throws Exception {
		List<DistrictIns> districtInsList=null;
		if(parentId==null){
			districtInsList=districtInsService.findTopList();
		}else {
			districtInsList=districtInsService.findChildren(parentId);
			DistrictIns parent = districtInsService.getById(parentId);
			ActionContext.getContext().put("parent", parent);
		}
		ActionContext.getContext().put("districtInsList", districtInsList);
		
		return "list"; 
		}

	/** 删除 */
	public String delete() throws Exception {
		//删除部门时，要将下级的机构都删除，需要在districtIns映射里写上级联配置cascade="delete" order-by="id ASC"
		districtInsService.delete(model.getId());
		return "toList";
		}

	/** 添加页面 */
	public String addUI() throws Exception {
		//准备数据
		List<DistrictIns> topList = districtInsService.findTopList();
		List<DistrictIns> districtInsList= DistrictInsUtils.getAllDistrictIns(topList);
		ActionContext.getContext().put("districtInsList", districtInsList);
		
		return "saveUI";
		}

	/** 添加 */
	public String add() throws Exception { 
		if(parentId!=null){
			DistrictIns parent = districtInsService.getById(parentId);
			model.setParent(parent);
		}
		districtInsService.save(model);
				return "toList"; 
		}

	/** 修改页面 */
	public String editUI() throws Exception {
		// 因为要返回到list页面准备数据
		List<DistrictIns> topList = districtInsService.findTopList();
		List<DistrictIns> districtInsList=DistrictInsUtils.getAllDistrictIns(topList);
		ActionContext.getContext().put("districtInsList", districtInsList);// 获取#号获取
		// 准备回显的数据
		DistrictIns districtIns = districtInsService.getById(model.getId());
		ActionContext.getContext().getValueStack().push(districtIns);
		if (districtIns.getParent() != null) {
			parentId = districtIns.getParent().getId();
		}
		return "saveUI";
		}

	/** 修改 */
	public String edit() throws Exception {
		System.out.println("进入修改成功方法");
		// 1从数据库中获取源对象
		DistrictIns districtIns = districtInsService.getById(model.getId());
		// 2 设置要修改的属性
		districtIns.setName(model.getName());
		districtIns.setDescription(model.getDescription());
		System.out.println("dedao"+model.getDescription());
		districtIns.setParent(districtInsService.getById(parentId));//设置所属的上级部门
		// 3、跟新数据库
		districtInsService.update(districtIns);
		return "toList";
		}




	public Long getParentId() {
		return parentId;
	}


	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	
	
}
