package com.uestc.hams.view.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.uestc.hams.base.BaseAction;
import com.uestc.hams.entity.Family;
import com.uestc.hams.entity.ResidentArchive;
import com.uestc.hams.entity.User;
/**
 * @author Charles
 *
 */
@Controller
@Scope("prototype")
public class FamilyAction  extends BaseAction<Family>  {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 34534543634L;
	/**
	 * 
	 */
	
	public final static int AVAILABLE = 1;
	public final static int HASFAMILY = 2;
	public final static int NOTEXIST = 3;
			
	private List<Family> familyList;
	private Long familyId;
	private User user=(User)ActionContext.getContext().getSession().get("user");
	private Long famId;
	private String name;
	private String loginName;
	private String password;
	private String relationShip;
	private Long userId;
	private List<User> doctorList;
	
	private String test;
	
	private Long doctorId;
	
	private List<User> recorderList;
	
	private Long districtInsId;
	
	private Long registerId;
	
	private int code;
	
	
	

	public String getTest() {
		return test;
	}

	public void setTest(String test) {
		this.test = test;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public Long getRegisterId() {
		return registerId;
	}

	public void setRegisterId(Long registerId) {
		this.registerId = registerId;
	}

	public Long getDistrictInsId() {
		return districtInsId;
	}

	public void setDistrictInsId(Long districtInsId) {
		this.districtInsId = districtInsId;
	}

	public Long getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(Long doctorId) {
		this.doctorId = doctorId;
	}

	public List<User> getRecorderList() {
		return recorderList;
	}

	public void setRecorderList(List<User> recorderList) {
		this.recorderList = recorderList;
	}

	public List<User> getDoctorList() {
		return doctorList;
	}

	public void setDoctorList(List<User> doctorList) {
		this.doctorList = doctorList;
	}

	private Long residentId;
	
	private String str;
	
	
	
	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}

	private List<ResidentArchive> memberList = new ArrayList<ResidentArchive>();
	
	private ResidentArchive resident;
	
	private ResidentArchive headResident = null;
	
	
	
	
	

	
	public ResidentArchive getHeadResident() {
		return headResident;
	}

	public void setHeadResident(ResidentArchive headResident) {
		this.headResident = headResident;
	}

	public List<ResidentArchive> getMemberList() {
		return memberList;
	}

	public void setMemberList(List<ResidentArchive> memberList) {
		this.memberList = memberList;
	}

	public Long getResidentId() {
		return residentId;
	}

	public void setResidentId(Long residentId) {
		this.residentId = residentId;
	}

	public ResidentArchive getResident() {
		return resident;
	}

	public void setResident(ResidentArchive resident) {
		this.resident = resident;
	}


	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getRelationShip() {
		return relationShip;
	}

	public void setRelationShip(String relationShip) {
		this.relationShip = relationShip;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Long getFamId() {
		return famId;
	}

	public void setFamId(Long famId) {
		this.famId = famId;
	}

	private Long headId;
	
	
	public Long getHeadId() {
		return headId;
	}

	public void setHeadId(Long headId) {
		this.headId = headId;
	}

	public String list() throws Exception{
		
		 familyList=familyService.findAll();
		 
		ActionContext.getContext().put("familyList", familyList);
		
		return "listUI";
		
	}
	
	public String info() throws Exception{
		
		Family family=familyService.getById(model.getId());
		
		ActionContext.getContext().put("family",family);
		
		return "showFamilyInfoUI";
		
	}
	
	
public String gainMember(){
		
	
        System.out.println("============进入方法family。gainMember");		
        System.out.println("===========residentName"+resident.getId());
        
		resident = residentArchiveService.getById(resident.getId());
		
		System.out.println("resident.name==========="+resident.getName());
		
//		setResident(resident);
		
		memberList.add(resident);
		
		System.out.println("residentSet"+memberList.get(0).getId());
		
//		setMemberList(memberList);
		
		return "returnResident";
		
		
	}
	
	
	public String addUI() throws Exception{
		
		//导入新建家庭的ID
		
		doctorList = userService.findByRoleDoctor();
		
		recorderList = userService.findByRoleRecorder();
		
		//System.out.println("doctorList "+doctorList.get(0).getName()+" doctor "+ doctorList.get(1).getName());
		
		ActionContext.getContext().put("doctorList", doctorList);
		
		ActionContext.getContext().put("recorderList", recorderList);
		
		//导入建档日期
		Date registerDate=new Date();
		
		ActionContext.getContext().put("registerDate", registerDate);
		
		
		return "saveUI";
	}
	/*
	 * 创建家庭，需先创建户主用户
	 */
	public String add() throws Exception{
		
		
		Family family=model;
		
		ResidentArchive head=residentArchiveService.getById(userId);
		family.setHead(head);
		
		User register = (User)ActionContext.getContext().getSession().get("user");
		
		System.out.println("register.name======="+register.getName());
		
		family.setRegister(register);
		
		User doctor = userService.getById(doctorId);
		
		System.out.println("doctorId========="+doctorId);
		family.setDoctor(doctor);
//		户主绑定家庭
		head.setFamily(family);
		head.setRelationShip("head");
		
//		家庭添加成员
		family.getMember().add(head);
		familyService.save(family);
		
//		family.setHead(head);
//		familyService.update(family);
		
		setFamId(family.getFamilyId());
		
		
		return "toFamilyInfo";
	}
	
    
    
    public String memberAddUI() throws Exception{
    	
    	
    	System.out.println("familyId== "+model.getId());
    	famId = model.getId();
//    	ResidentArchive residentArchive = user.getResidentArchive();
//    	System.out.println(residentArchive);
//    	ActionContext.getContext().put("residentArchive", residentArchive);
    	return "memberAddUI";
    }
    /*
     * 添加用户成员
     */
    public String memberAdd() throws Exception{
    	
    	System.out.println("familyId=="+model.getId());
    	Family family=familyService.getById(model.getId());
    	setFamId(model.getId());
    	System.out.println("relationShip=="+relationShip+"  name=="+name+ " loginName="+loginName+" password="+password);
    	ResidentArchive ra=new ResidentArchive();
    	ra.setName(name);
    	ra.setLoginName(loginName);
    	ra.setRelationShip(relationShip);
    	
    	/*
    	 * 判断该家庭的wife和head是否存在，存在则不允许添加同样身份的用户
    	 */
    	ResidentArchive wife=null;
    	ResidentArchive head=null;
    	Set<ResidentArchive> members=family.getMember();
    	for(ResidentArchive member:members){
    		if(member.getRelationShip().equals("wife")){
    			wife=member;
    		}
    		if(member.getRelationShip().equals("head")){
    			head=member;
    		}
    	}
    	if(relationShip.equals("wife") && wife!=null){
    		return "inputAddMemberUI";
    	}
    	if(relationShip.equals("head") && head!=null){
    		return "inputAddMemberUI";
    	}
    	ra.setFamily(family);
    	family.getMember().add(ra);
    	familyService.update(family);
    	
    	ActionContext.getContext().put("family",family);
		return "toFamilyInfo";
    }
    
    /*
     * 删除家庭跟用户关联
     */
    public String memberDelete() throws Exception{
    	
    	System.out.println("======进入删除方法=======");
    	
    	System.out.println(userId+"模型id");//那个用户的id
    	System.out.println("删除famId="+famId);
    	
    	ResidentArchive ra=residentArchiveService.getById(userId);
    	ra.setFamily(null);
    	ra.setRelationShip(null);
    	Family family=familyService.getById(famId);
    	family.getMember().remove(ra);
    	
    	familyService.update(family);
    	
    	ActionContext.getContext().put("family",family);
    	
    	return "toFamilyInfo";
    }
	/*
	 * 跳转修改家庭信息页面，并导入家庭信息供编辑
	 */
    public String editUI() throws Exception{
    	
    	
    	System.out.println("model.id=="+model.getId());
    	
        doctorList = userService.findByRoleDoctor();
		
		//System.out.println("doctorList "+doctorList.get(0).getName()+" doctor "+ doctorList.get(1).getName());
		
		ActionContext.getContext().put("doctorList", doctorList);
		
    	
    	Family family=familyService.getById(model.getId());
		ActionContext.getContext().getValueStack().push(family);
		setUserId(family.getHead().getId());
		
    	return "saveUI";
    }
    /*
     * 修改家庭基本信息
     */
    public String edit() throws Exception{
    	
        
//        Family fam=familyService.getById(model.getId());
        
//        System.out.println("family model.id=========="+model.getId());
        
//		家庭添加成员
		familyService.update(model);
		
		System.out.println("model.id============"+model.getId());
		ResidentArchive oldHead = familyService.getFamilyHead(model.getId());
		
		System.out.println("oldHead==========="+oldHead.getId());
    	oldHead.setFamily(null);
    	oldHead.setRelationShip(null);
    	model.getMember().remove(oldHead);
    	
       User register = (User)ActionContext.getContext().getSession().get("user");
       
//       System.out.println("register.name============"+register.getName());
		
		model.setRegister(register);
		
		User doctor = userService.getById(doctorId);
		
		model.setDoctor(doctor);
    	
    	familyService.update(model);
		
		ResidentArchive head = residentArchiveService.getById(userId);
		
		model.setHead(head);
		head.setFamily(model);
		
		head.setRelationShip("head");
		
		model.getMember().add(head);
		
		familyService.update(model);
    	
    	setFamId(model.getId());
    	
		return "toFamilyInfo";
    	
    }
    /*
     * 删除家庭，删除家庭之前需删除成员
     */
    public String delete() throws Exception{
    	
    	
        System.out.println("id=="+model.getId());
        System.out.println("familyId=="+familyId);
    	familyService.delete(model.getId());
    	
    	return "toList";
    }
    
    public String isRaExist() throws Exception{
    	
    	
    	System.out.println("residentId======="+userId);
    	
    boolean raExist = residentArchiveService.isIdExist(userId);
    boolean exist =	familyService.findByUserId(userId);
    
    if(!raExist){
    	code = NOTEXIST;
    }else if(exist){
    	code = HASFAMILY;
    }else{
    	code = AVAILABLE;
    }
    	
    		return "message";
    		
    }
    
    public String test() throws Exception{
    	
    	return "test";
    }

	public Long getFamilyId() {
		return familyId;
	}

	public void setFamilyId(Long familyId) {
		this.familyId = familyId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
    
	
    

}
