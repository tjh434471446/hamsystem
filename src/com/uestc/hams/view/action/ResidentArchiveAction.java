package com.uestc.hams.view.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionContext;
import com.uestc.hams.base.BaseAction;
import com.uestc.hams.entity.DistrictIns;
import com.uestc.hams.entity.PublicIns;
import com.uestc.hams.entity.ResidentArchive;
import com.uestc.hams.entity.Role;
import com.uestc.hams.entity.User;
import com.uestc.hams.service.PublicInsService;
import com.uestc.hams.util.ListStringUtils;
/**
 * @author sean
 *
 */
@Controller
@Scope("prototype")
public class ResidentArchiveAction extends BaseAction<ResidentArchive>{
	
	private Long doctorId;
	private Long recorderId;
	private String rsaId;
	private String rsid;//返回身份证
	private Boolean flag=false;
	private String shoushuText1;
	private String dateT;
	private List<String> txBlood=new ArrayList<String>();
	private List<String>txTraumas=new ArrayList<String>();
	private List<String>txSurgery=new ArrayList<String>();
	
	private List<String>exporeIds;
	private List<String>drugAllergyIds;
	//家族史
	private List<String>diseaseIds;
	private List<String>faDiseaseIds;
	private List<String>moDiseaseIds;
	private List<String>broDiseaseIds;
	private List<String>childDiseaseIds;
	//残疾
	private List<String>disabledIds;
	/** 列表 */
	/*在列表页面应该多个选择按钮
	public String list() throws Exception {
		得到数据库中数据
		List<ResidentArchive> residentArchiveList =residentArchiveService.findAll();
		写入回显
		ActionContext.getContext().put("residentArchiveList", residentArchiveList);
		return "list";
	}*/
	
	public String doctorArchiveList(){
		User user=(User)ActionContext.getContext().getSession().get("user");
		Long id =user.getId();
		List<ResidentArchive> residentArchiveList= residentArchiveService.findDoctorList(id);
		ActionContext.getContext().put("residentArchiveList", residentArchiveList);
		return "list";
		
	}

	/** 删除 */
	public String delete() throws Exception {
		System.out.println("进入删除");
		//userService.delete(id)
		//通过档案id删除用户
		ResidentArchive rs=residentArchiveService.getById(model.getId());
		if(rs!=null){
			//System.out.println("residentID="+rs.getResidentId());
			userService.delete(rs.getResidentId());
			//residentArchiveService.delete(model.getId());
		}
		return "toList";
	}

	/** 添加页面 */
	public String addUI() throws Exception {
		System.out.println("进入addUI");
		//准备责任医生
		List<User> doctorList=userService.findByRoleDoctor();
		ActionContext.getContext().put("doctorList", doctorList);
		//准备记录员
		List<User> recorderList=userService.findByRoleRecorder();
		ActionContext.getContext().put("recorderList",recorderList);
		//查询所有  乡镇街道地址bug
		List<DistrictIns> districtInsList= districtInsService.findAll();
		ActionContext.getContext().put("districtInsList", districtInsList);
		return "saveUI";
	}

	/** 添加 */
	public String add() throws Exception {
		System.out.println("进入add");
		User userNow=(User) ActionContext.getContext().getSession().get("user");
		//医生和记录员需要遍历出来
		User doctor=userService.getById(doctorId);
		if(doctor!=null){
			model.setDoctor(doctor);
		}else {
			model.setDoctor(userNow);
		}
		User recorder= userService.getById(recorderId);
		if(recorder!=null){
			model.setRecorder(recorder);
		}else {
			model.setRecorder(userNow);
		}
		
		
		//年龄设置（默认的0该怎么处置or设置错误消息）
		if(model.getRsBornDate()!=null){
			Date date = new Date();
			SimpleDateFormat sf =new SimpleDateFormat("yyyy-MM-dd");
			sf.format(date);
			Calendar calendarDate=Calendar.getInstance();
			Calendar calendarBornDate=Calendar.getInstance();
			calendarDate.setTime(date);
			calendarBornDate.setTime(model.getRsBornDate());
			Long ageTime=calendarDate.getTimeInMillis()-calendarBornDate.getTimeInMillis();
			model.setAge((int) (ageTime/(1000*60*60*24*356L)));
		}
		if (model.getAchiveDate()==null) {
			model.setAchiveDate(new Date());
		}
		
		//设置病史(add的问题)
		if(model.getNationality()==null||model.getNationality().equals("0")){
			model.setNationalityString(null);
		}
		
		if(model.getExposureType()==null||model.getExposureType().equals("0")){
			model.setNationalityString(null);
		}else if (exporeIds!=null) {
			model.setExposureString(ListStringUtils.listToString(exporeIds, ","));
		}
		if(model.getHeredityType()==null||model.getHeredityType().equals("0")){
			model.setHeredityString(null);
		}
		
		if(model.getDrugAllergyType()==null||model.getDrugAllergyType().equals("0")){
			model.setDrugAllergyString(null);
		}else if (drugAllergyIds!=null) {
			model.setDrugAllergyString(ListStringUtils.listToString(drugAllergyIds, ","));
		}
		
		
		if(model.getDiseaseType()!=null&&model.getDiseaseType().equals("1")){
			if(diseaseIds!=null){
				String str=ListStringUtils.listToString(diseaseIds, ",");
				System.out.println("疾病zheli"+str);
				//将long类型转化为string
				model.setDiseaseString(str);
				}
		}else {
			model.setDiseaseOccupString(null);
			model.setDiseaseOtherString(null);
			model.setDiseaseCancerString(null);
		}
		if(model.getFaDiseaseType()!=null&&model.getFaDiseaseType().equals("1")){
			if(faDiseaseIds!=null){
				String str=ListStringUtils.listToString(faDiseaseIds, ",");
				model.setFaDiseaseString(str);
			}
		}else {
			model.setFaDiseaseOccupString(null);
			model.setFaDiseaseOtherString(null);
			model.setFaDiseaseCancerString(null);
		}
		
		if(model.getMonDiseaseType()!=null&&model.getMonDiseaseType().equals("1")){
			if (moDiseaseIds!=null) {
				String str=ListStringUtils.listToString(moDiseaseIds, ",");
				model.setMonDiseaseString(str);
			}
		}else {
			model.setMonDiseaseOccupString(null);
			model.setMonDiseaseOtherString(null);
			model.setMonDiseaseCancerString(null);
		}
		
		if(model.getChildDiseaseType()!=null&&model.getChildDiseaseType().equals("1")){
			if (childDiseaseIds!=null) {
				String str=ListStringUtils.listToString(childDiseaseIds, ",");
				model.setChildDiseaseString(str);
			}
		}else {
			model.setChildDiseaseOccupString(null);
			model.setChildDiseaseOtherString(null);
			model.setChildDiseaseCancerString(null);
		}
		
		if (model.getDisabledType()!=null&&model.getDisabledType().equals("1")) {
			if (disabledIds!=null) {
				model.setDisabledString(ListStringUtils.listToString(disabledIds, ","));
			}
		}else {
			model.setDisabledOhterString(null);
		}
		
		//保存
		residentArchiveService.save(model);
		
		//能否得到新增内容
		 for(String str:txBlood){
			 PublicIns publicIns=new PublicIns("txBlood",str,model);
			 publicInsService.save(publicIns);
			 model.getBloodTrans().add(publicIns);
			 
		 }
		
		 for(String str:txTraumas){
			 PublicIns publicIns=new PublicIns("txTraumas",str,model);
			 publicInsService.save(publicIns);
			 model.getBloodTrans().add(publicIns);
		 }
		 
		//2、得到其地区编号拼接
			StringBuffer rsArcId=new StringBuffer();
			//根据建档单位设置id
			if(model.getArchiveDisId()!=0){
				DistrictIns dis=districtInsService.getById(model.getArchiveDisId());
				//一级单位
				if(dis!=null){
					//二级单位
					if(dis.getParent()!=null){
						rsArcId.append(dis.getParent().getDistrictId());
						rsArcId.append(dis.getDistrictId());
					}else{
						//只有一级单位
						rsArcId.append(dis.getDistrictId());
						rsArcId.append("000000");
					}
				}
			}else {
				//没有所有档案单位
				rsArcId.append("000000000000");
			}
			
		//3、设置位数 例如100001
			if(model.getId()<10000){
				rsArcId.append(model.getId()+10000);
			}else
				rsArcId.append(model.getId());
		//4、写入模型中
		rsaId=new String(rsArcId).trim();
		model.setRsArchiveId(rsaId);
		
		//设置user中的档案
		User user = new User();
		if(model.getName()!=null){
			user.setName(model.getName());
		}
		if(model.getPhoneNumber()!=null){
			user.setPhoneNumber(model.getPhoneNumber());
		}
		if(model.getGender()!=null){
			user.setGender(model.getGender());
		}
		
			//登录权限问题
		Set<Role> roles=new HashSet<Role>();
		Role role = roleService.findRoleByName("一般用户");		
		roles.add(role);
		user.setRoles(roles);
		user.setLoginName(rsaId);
		String md5Digest = DigestUtils.md5Hex("1234");
		user.setPassword(md5Digest);
		//需同时保存用户和档案
		user.setResidentArchive(model);
		userService.save(user);
			//是否需要判断
		model.setResidentId(user.getId());
		//跟新
		residentArchiveService.update(model);
		return "toList";
	}

	/** 修改页面 */
	public String editUI() throws Exception {
		System.out.println("进入editUI");
		//修改页面准备，upmodel需注意
		ResidentArchive ra=residentArchiveService.getById(model.getId());
		
		model.setResidentId(ra.getResidentId());
		//准备医生列表
		List<User> doctorList=userService.findByRoleDoctor();
		ActionContext.getContext().put("doctorList", doctorList);
		//准备记录员列表
		List<User> recorderList=userService.findByRoleRecorder();
		ActionContext.getContext().put("recorderList",recorderList);
		//查询所有乡镇街道地址
		List<DistrictIns> districtInsList= districtInsService.findAll();
		ActionContext.getContext().put("districtInsList", districtInsList);
	
		
		//病史
		if(ra.getExposureString()!=null){
			exporeIds = ListStringUtils.stringToList(ra.getExposureString(), ",");
			
		}
		
		if(ra.getDrugAllergyString()!=null){
			drugAllergyIds=ListStringUtils.stringToList(ra.getDrugAllergyString(), ",");
			
		}
		if (ra.getDisabledString()!=null) {
			disabledIds=ListStringUtils.stringToList(ra.getDisabledString(), ",");
		}
		if (ra.getDiseaseString()!=null) {
			diseaseIds=ListStringUtils.stringToList(ra.getDiseaseString(), ",");
		}
		if (ra.getFaDiseaseString()!=null) {
			faDiseaseIds=ListStringUtils.stringToList(ra.getFaDiseaseString(), ",");
		}
		if (ra.getMonDiseaseString()!=null) {
			moDiseaseIds=ListStringUtils.stringToList(ra.getMonDiseaseString(), ",");
		}
		if (ra.getChildDiseaseString()!=null) {
			childDiseaseIds=ListStringUtils.stringToList(ra.getChildDiseaseString(), ",");
		}
		//这是输血。。修改的地方
			//service qu find txtblood
			//ra.getBloodTrans();new ArrayList<PublicIns>()
		List<PublicIns> bloodPublicInsList=publicInsService.findByName("txBlood",model.getId());
		if(bloodPublicInsList!=null){
			ActionContext.getContext().put("bloodPublicInsList", bloodPublicInsList);
		}
		
		List<PublicIns> traumasPublicInsList=publicInsService.findByName("txTraumas", model.getId());
		if(traumasPublicInsList!=null){
			ActionContext.getContext().put("traumasPublicInsList", traumasPublicInsList);
		}
		
		List<PublicIns>surgeryPublicInsList=publicInsService.findByName("txSurgery", model.getId());
		if(surgeryPublicInsList!=null){
			ActionContext.getContext().put("surgeryPublicInsList", surgeryPublicInsList);
		}
		
		//判断
		if(ra.getDoctor()!=null){
			doctorId=ra.getDoctor().getId();
		}
		if(ra.getRecorder()!=null){
			recorderId=ra.getRecorder().getId();
		}
		ActionContext.getContext().getValueStack().push(ra);
		return "saveUI";
	}

	/** 修改 */
	public String edit() throws Exception {
		System.out.println("进入edit");
		User userNow=(User) ActionContext.getContext().getSession().get("user");
		if(doctorId!=null&&doctorId!=0l){
			model.setDoctor(userService.getById(doctorId));
		}else {
			model.setDoctor(userNow);
		}
		if(recorderId!=null&&recorderId!=0l){
			model.setRecorder(userService.getById(recorderId));
		}else {
			model.setRecorder(userNow);
			
		}
		if (model.getAchiveDate()==null) {
			model.setAchiveDate(new Date());
		}
		if(model.getRsBornDate()!=null){
			Date date = new Date();
			Calendar calendarDate=Calendar.getInstance();
			Calendar calendarBornDate=Calendar.getInstance();
			calendarDate.setTime(date);
			calendarBornDate.setTime(model.getRsBornDate());
			Long ageTime=calendarDate.getTimeInMillis()-calendarBornDate.getTimeInMillis();
			model.setAge((int) (ageTime/(1000*60*60*24*356L)));
		}
		
		//设置有无病史情况
		if(model.getNationality()==null||model.getNationality().equals("0")){
			model.setNationalityString(null);
		}
		
		if(model.getExposureType()==null||model.getExposureType().equals("0")){
			model.setNationalityString(null);
		}else if(exporeIds!=null){
				model.setExposureString(ListStringUtils.listToString(exporeIds, ","));
			
		}
		if(model.getHeredityType()==null||model.getHeredityType().equals("0")){
			model.setHeredityString(null);
		}

		if(model.getDrugAllergyType()==null||model.getDrugAllergyType().equals("0")){
			model.setDrugAllergyString(null);
		}else if (drugAllergyIds!=null) {
			model.setDrugAllergyString(ListStringUtils.listToString(drugAllergyIds, ","));
		}
		
		
		if(model.getDiseaseType()!=null&&model.getDiseaseType().equals("1")){
			if(diseaseIds!=null){
				String str=ListStringUtils.listToString(diseaseIds, ",");
				model.setDiseaseString(str);
				}
		}else {
			model.setDiseaseOccupString(null);
			model.setDiseaseOtherString(null);
			model.setDiseaseCancerString(null);
		}
		if(model.getFaDiseaseType()!=null&&model.getFaDiseaseType().equals("1")){
			if(faDiseaseIds!=null){
				String str=ListStringUtils.listToString(faDiseaseIds, ",");
				model.setFaDiseaseString(str);
			}
		}else {
			model.setFaDiseaseOccupString(null);
			model.setFaDiseaseOtherString(null);
			model.setFaDiseaseCancerString(null);
		}
		
		if(model.getMonDiseaseType()!=null&&model.getMonDiseaseType().equals("1")){
			if (moDiseaseIds!=null) {
				String str=ListStringUtils.listToString(moDiseaseIds, ",");
				model.setMonDiseaseString(str);
			}
		}else {
			model.setMonDiseaseOccupString(null);
			model.setMonDiseaseOtherString(null);
			model.setMonDiseaseCancerString(null);
		}
		
		if(model.getChildDiseaseType()!=null&&model.getChildDiseaseType().equals("1")){
			if (childDiseaseIds!=null) {
				String str=ListStringUtils.listToString(childDiseaseIds, ",");
				model.setChildDiseaseString(str);
			}
		}else {
			model.setChildDiseaseOccupString(null);
			model.setChildDiseaseOtherString(null);
			model.setChildDiseaseCancerString(null);
		}
		
		if (model.getDisabledType()!=null&&model.getDisabledType().equals("1")) {
			if (disabledIds!=null) {
				model.setDisabledString(ListStringUtils.listToString(disabledIds, ","));
			}
		}else {
			model.setDisabledOhterString(null);
		}
		//删除原来的写入现则的(有问题)
		
		if(model.getBloodTransType()==null||model.getBloodTransType().equals("0")){
			//这里有问题
			model.setBloodTranString(null);
			publicInsService.deleteByName("txBlood",model.getId());
			
		}else {
			publicInsService.deleteByName("txBlood",model.getId());
			for(String str:txBlood){
				 PublicIns publicIns=new PublicIns("txBlood",str,model);
				 publicInsService.save(publicIns);
				 model.getBloodTrans().add(publicIns);
			 }
		}
		if(model.getTraumasType()==null||model.getTraumasType().equals("0")){
			model.setTraumasString(null);
			publicInsService.deleteByName("txTraumas", model.getId());
		}else {
			publicInsService.deleteByName("txTraumas", model.getId());
			for(String str:txTraumas){
				PublicIns publicIns= new PublicIns("txTraumas", str, model);
				publicInsService.save(publicIns);
				model.getBloodTrans().add(publicIns);
			}
		}
		
		if(model.getSurgeryType()==null||model.getSurgeryType().equals("0")){
			model.setSurgeryString(null);
			publicInsService.deleteByName("txSurgery", model.getId());
		}else {
			publicInsService.deleteByName("txSurgery", model.getId());
			for(String str:txSurgery){
				PublicIns pi=new PublicIns("txSurgery",str,model);
				publicInsService.save(pi);
				model.getBloodTrans().add(pi);
			}
		}
		
		residentArchiveService.update(model);
		return "toList";
	}
	
	
	public String validateArchive() throws Exception {
		System.out.println("进入验证");
		System.out.println(rsid);
		flag=residentArchiveService.findByRsId(rsid);
		System.out.println(flag);
		return "success";
	}
	
	public String hypertensionArchiveList() throws Exception{
		List<ResidentArchive>hypertensionArchiveList= residentArchiveService.findHypertensionArchiveList();
		ActionContext.getContext().put("hypertensionArchiveList", hypertensionArchiveList);
		return "hypertensionArchiveList";
	}
	
	public String test() throws Exception{
		System.out.println("进入这个方法test" );
		System.out.println(dateT);
		shoushuText1="123";
		return "success";
	}
	
	
	public Long getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(Long doctorId) {
		this.doctorId = doctorId;
	}

	public Long getRecorderId() {
		return recorderId;
	}

	public void setRecorderId(Long recorderId) {
		this.recorderId = recorderId;
	}


	public String getShoushuText1() {
		return shoushuText1;
	}

	public void setShoushuText1(String shoushuText1) {
		this.shoushuText1 = shoushuText1;
	}

	public String getDateT() {
		return dateT;
	}

	public void setDateT(String dateT) {
		this.dateT = dateT;
	}
	public List<String> getTxBlood() {
		return txBlood;
	}

	public void setTxBlood(List<String> txBlood) {
		this.txBlood = txBlood;
	}

	public List<String> getExporeIds() {
		return exporeIds;
	}

	public void setExporeIds(List<String> exporeIds) {
		this.exporeIds = exporeIds;
	}

	public List<String> getDrugAllergyIds() {
		return drugAllergyIds;
	}

	public void setDrugAllergyIds(List<String> drugAllergyIds) {
		this.drugAllergyIds = drugAllergyIds;
	}

	public List<String> getTxTraumas() {
		return txTraumas;
	}

	public void setTxTraumas(List<String> txTraumas) {
		this.txTraumas = txTraumas;
	}

	public List<String> getTxSurgery() {
		return txSurgery;
	}

	public void setTxSurgery(List<String> txSurgery) {
		this.txSurgery = txSurgery;
	}

	


	public List<String> getDiseaseIds() {
		return diseaseIds;
	}

	public void setDiseaseIds(List<String> diseaseIds) {
		this.diseaseIds = diseaseIds;
	}

	public List<String> getFaDiseaseIds() {
		return faDiseaseIds;
	}

	public void setFaDiseaseIds(List<String> faDiseaseIds) {
		this.faDiseaseIds = faDiseaseIds;
	}

	public List<String> getMoDiseaseIds() {
		return moDiseaseIds;
	}

	public void setMoDiseaseIds(List<String> moDiseaseIds) {
		this.moDiseaseIds = moDiseaseIds;
	}

	public List<String> getBroDiseaseIds() {
		return broDiseaseIds;
	}

	public void setBroDiseaseIds(List<String> broDiseaseIds) {
		this.broDiseaseIds = broDiseaseIds;
	}

	public List<String> getChildDiseaseIds() {
		return childDiseaseIds;
	}

	public void setChildDiseaseIds(List<String> childDiseaseIds) {
		this.childDiseaseIds = childDiseaseIds;
	}

	public List<String> getDisabledIds() {
		return disabledIds;
	}

	public void setDisabledIds(List<String> disabledIds) {
		this.disabledIds = disabledIds;
	}

	public String getRsid() {
		return rsid;
	}

	public void setRsid(String rsid) {
		this.rsid = rsid;
	}

	public Boolean getFlag() {
		return flag;
	}

	public void setFlag(Boolean flag) {
		this.flag = flag;
	}

	

	 
	 
	
}
