package com.uestc.hams.view.action;


import java.util.ArrayList;
import java.util.List;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.uestc.hams.base.BaseAction;
import com.uestc.hams.entity.FamilyDisHistory;
import com.uestc.hams.entity.HospitalHistory;
import com.uestc.hams.entity.Medication;
import com.uestc.hams.entity.PhyExam;
import com.uestc.hams.entity.ResidentArchive;
import com.uestc.hams.entity.User;
import com.uestc.hams.util.ListStringUtils;

/**
 * 健康体检action 
 * @author ct
 *
 */

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class PhyExamAction extends BaseAction<PhyExam> {

	//症状
	private List<String> symptom;
	//饮食习惯
	private List<String> dietList;
	//饮酒种类
	private List<String> drinkTypeList;
	//乳腺
	private List<String> breastList;
	//脑血管疾病
	private List<String> cerebroDisList;
	//肾脏疾病
	private List<String> kidneyDisList;
	//心脏疾病
	private List<String> heartDisList;
	//血管疾病
	private List<String> vesselDisList;
	//眼部疾病
	private List<String> eyeDisList;
	//住院史
	private List<HospitalHistory> hospiList;
	//家庭病床史
	private List<FamilyDisHistory> famDisList;
	//服药依从性
	private List<Medication> medList;	
	//责任医生
	private List<User> doctors;
	//录入员
	private List<User> recorders;
	//健康档案
	private ResidentArchive residentArchive;
	//页面传过来的健康档案的id
	private Long rsaId;

	//健康体检list
	private List<PhyExam> phyExams;
	//页数，请求页面传过来
	private int page = 1;
	//页容量,struts.xml文件里面配置
	private int pageSize;
	//总页数
	private int totalPages;
	
	/**
	 * 特定健康档案对应的健康体检列表显示
	 * @return
	 */
	public String archiveList(){
		//获取健康档案id对应的所有健康体检集合
		phyExams = phyExamService.findByArchiveIdAndPage(rsaId, page, pageSize);
		totalPages = phyExamService.findTotalPages(pageSize);
		System.out.println("执行列表");
		return "list";
	}
	/**
	 * 返回所有健康体检记录
	 * @return
	 */
	public String list(){
		phyExams = phyExamService.findByPage(page, pageSize);
		totalPages = phyExamService.findTotalPages(pageSize);
		return "list";
	}
	
	
 	/**
	 * addUI()方法：跳转到健康体检填写页面
	 */
	public String addUI(){
		//System.out.println(rsaId);
		//查询出所有角色为医生的用户
		doctors = userService.findAll();
		//查询出角色为录入员的用户
		recorders = userService.findAll();
		//根据id查询出对应的健康档案对象
		residentArchive = residentArchiveService.getById(rsaId);
		//ActionContext.getContext().getValueStack().push(residentArchive);
		ActionContext.getContext().put("residentArchive", residentArchive);
		
		//System.out.println(residentArchive.getRsArchiveId());
		//System.out.println(residentArchive.getRsBornDate());
		//resident = residentArchive.getResident();
		
		
		return "saveUI";
	}
	
	/**
	 * 
	 * 将页面传过来的数据保存至数据库
	 * @return
	 */
	public String add(){
		//将页面传过来的list属性转换为字符串
		String symptom1 = ListStringUtils.listToString(symptom, ",");
		String diet = ListStringUtils.listToString(dietList, ",");
		String drinkType1 = ListStringUtils.listToString(drinkTypeList, ",");
		String breast1 = ListStringUtils.listToString(breastList, ",");
		String cerebroDis1 = ListStringUtils.listToString(cerebroDisList, ",");
		String kidneyDis1 = ListStringUtils.listToString(kidneyDisList, ",");
		String heartDis1 = ListStringUtils.listToString(heartDisList, ",");
		String vesselDis1 = ListStringUtils.listToString(vesselDisList, ",");
		String eyeDis1 = ListStringUtils.listToString(eyeDisList, ",");
		//将处理过的字符串属性设置到对象的相应的字段里
		model.setSymptom1(symptom1);
		model.setDiet(diet);
		model.setDrinkType1(drinkType1);
		model.setBreast1(breast1);
		model.setCerebroDis1(cerebroDis1);
		model.setKidneyDis1(kidneyDis1);
		model.setHeartDis1(heartDis1);
		model.setVesselDis1(vesselDis1);
		model.setEyeDis1(eyeDis1);
		
		if(hospiList != null && hospiList.size() != 0){
			System.out.println("hos不为空");
			System.out.println("list为"+hospiList.size());
		}else{
			System.out.println("hos为空");
		}
		//处理住院史
		if(hospiList != null){
			for(HospitalHistory hh:hospiList){
				//将页面传过来的值存入HospitalHistory对象
				HospitalHistory hos = new HospitalHistory(hh.getInHospital(),hh.getOutHospital(),
						hh.getInHosReason(),hh.getHospitalName(),hh.getRecordNumber(),model);
				//存入住院史表
				hospitalHistoryService.save(hos);
				//存入健康体检表
				model.getHospitalHistorys().add(hos);
			}
		}
		
		//处理家庭病床史
		if(famDisList != null){
			for(FamilyDisHistory fdh:famDisList){
				FamilyDisHistory famDis = new FamilyDisHistory(fdh.getBuildBedDate(),fdh.getRemoveBedDate(),
						fdh.getFamDisReason(),fdh.getFamHospitalName(),fdh.getFamRecordNumber(),model);
				//存入家庭病床史表
				familyDisHistoryService.save(famDis);
				//存入健康体检表
				model.getFamilyDisHistorys().add(famDis);
			}
		}
		
		//处理主要用药情况
		if(medList != null){
			for(Medication md:medList){
				Medication medic = new Medication(md.getDrugName(),md.getUseage(),md.getDosage(),md.getTakeMedTime(),
						md.getCompliance(),model);
				//存入用药情况表
				medicationService.save(medic);
				//存入健康体检表
				model.getMedications().add(medic);
			}
		}
		//将对象存入数据库
		phyExamService.save(model);
		return "toList";
	}
	
	/**
	 * 为修改页面准备数据
	 * @return
	 */
	public String editUI(){
		
		String symptom1;
		String diet;
		String drinkType1;
		String breast1;
		String cerebroDis1;
		String kidneyDis1;
		String heartDis1;
		String vesselDis1;
		String eyeDis1;
		//查询出所有角色为医生的用户
		doctors = userService.findAll();
		//查询出角色为录入员的用户
		recorders = userService.findAll();
		//System.out.println(residentArchive.getRsArchiveId());
		//System.out.println(residentArchive.getRsBornDate());
		//根据页面传过来的id值查找对象
		PhyExam phyExam = phyExamService.getById(model.getId());
		if(phyExam != null){
			symptom1 = phyExam.getSymptom1();
			diet = phyExam.getDiet();
			drinkType1 = phyExam.getDrinkType1();
			breast1 = phyExam.getBreast1();
			cerebroDis1 = phyExam.getCerebroDis1();
			kidneyDis1 = phyExam.getKidneyDis1();
			heartDis1 = phyExam.getHeartDis1();
			vesselDis1 = phyExam.getVesselDis1();
			eyeDis1 = phyExam.getEyeDis1();
			//set转换为list
			hospiList = new ArrayList<HospitalHistory>(phyExam.getHospitalHistorys());
			famDisList = new ArrayList<FamilyDisHistory>(phyExam.getFamilyDisHistorys());
			medList = new ArrayList<Medication>(phyExam.getMedications());
			residentArchive = phyExam.getResidentArchive();
			
		}else{
			symptom1 = null;
			diet = null;
			drinkType1 = null;
			breast1 = null;
			cerebroDis1 = null;
			kidneyDis1 = null;
			heartDis1 = null;
			vesselDis1 = null;
			eyeDis1 = null;
			hospiList = null;
			famDisList = null;
			medList = null;
		}
		//将从数据库里查出的字符串转换为list		
		symptom = ListStringUtils.stringToList(symptom1, ",");
		dietList = ListStringUtils.stringToList(diet, ",");
		drinkTypeList = ListStringUtils.stringToList(drinkType1, ",");
		breastList = ListStringUtils.stringToList(breast1, ",");
		cerebroDisList = ListStringUtils.stringToList(cerebroDis1, ",");
		kidneyDisList = ListStringUtils.stringToList(kidneyDis1, ",");
		heartDisList = ListStringUtils.stringToList(heartDis1, ",");
		vesselDisList = ListStringUtils.stringToList(vesselDis1, ",");
		eyeDisList = ListStringUtils.stringToList(eyeDis1, ",");
		//将对象压入值栈
		ActionContext.getContext().getValueStack().push(phyExam);
		//ActionContext.getContext().getValueStack().push(residentArchive);
		ActionContext.getContext().put("residentArchive", residentArchive);
		return "editUI";
	}
	
	/**
	 * 修改数据到数据库
	 * @return
	 */
	public String edit(){
		String symptom1 = ListStringUtils.listToString(symptom, ",");
		String diet = ListStringUtils.listToString(dietList, ",");
		String drinkType1 = ListStringUtils.listToString(drinkTypeList, ",");
		String breast1 = ListStringUtils.listToString(breastList, ",");
		String cerebroDis1 = ListStringUtils.listToString(cerebroDisList, ",");
		String kidneyDis1 = ListStringUtils.listToString(kidneyDisList, ",");
		String heartDis1 = ListStringUtils.listToString(heartDisList, ",");
		String vesselDis1 = ListStringUtils.listToString(vesselDisList, ",");
		String eyeDis1 = ListStringUtils.listToString(eyeDisList, ",");
		model.setSymptom1(symptom1);
		model.setDiet(diet);
		model.setDrinkType1(drinkType1);
		model.setBreast1(breast1);
		model.setCerebroDis1(cerebroDis1);
		model.setKidneyDis1(kidneyDis1);
		model.setHeartDis1(heartDis1);
		model.setVesselDis1(vesselDis1);
		model.setEyeDis1(eyeDis1);
	//更新住院史
		//首先清空原有的住院史记录
		if(hospitalHistoryService.findByPhyExamId(model.getId())  != null){
			model.setHospitalHistorys(null);
			hospitalHistoryService.deleteByPhyExamId(model.getId());
		}
		//将修改的住院史记录存入表
		if(hospiList != null){
			for(HospitalHistory hh:hospiList){
				//将页面传过来的值存入HospitalHistory对象
				HospitalHistory hos = new HospitalHistory(hh.getInHospital(),hh.getOutHospital(),
						hh.getInHosReason(),hh.getHospitalName(),hh.getRecordNumber(),model);
				//存入住院史表
				hospitalHistoryService.save(hos);
				//存入健康体检表
				model.getHospitalHistorys().add(hos);
			}
		}
	//更新家庭病床史
		//首先清空原有的家庭病床史记录
		if(familyDisHistoryService.findByPhyExamId(model.getId()) != null){
			model.setFamilyDisHistorys(null);
			familyDisHistoryService.deleteByPhyExamId(model.getId());
		}
		if(famDisList != null){
			for(FamilyDisHistory fdh:famDisList){
				FamilyDisHistory famDis = new FamilyDisHistory(fdh.getBuildBedDate(),fdh.getRemoveBedDate(),
						fdh.getFamDisReason(),fdh.getFamHospitalName(),fdh.getFamRecordNumber(),model);
				//存入家庭病床史表
				familyDisHistoryService.save(famDis);
				//存入健康体检表
				model.getFamilyDisHistorys().add(famDis);
			}
		}		
	//更新主要用药情况
		//首先清空原有的用药情况记录
		if(medicationService.findByPhyExamId(model.getId()) != null){
			System.out.println("aa");
			model.setMedications(null);
			medicationService.deleteByPhyExamId(model.getId());
			System.out.println("bb");
		}else{
			System.out.println("hh");
		}
		if(medList != null){
			System.out.println("cc");
			System.out.println(medList.size());
			for(Medication md:medList){
				Medication medic = new Medication(md.getDrugName(),md.getUseage(),md.getDosage(),md.getTakeMedTime(),
						md.getCompliance(),model);
				System.out.println("dd");
				//存入用药情况表
				medicationService.save(medic);
				System.out.println("ee");
				//存入健康体检表
				model.getMedications().add(medic);
				System.out.println("ff");
			}
		}
		System.out.println("gg");
		phyExamService.update(model);		
		return "toList";
		}

	public List<String> getSymptom() {
		return symptom;
	}

	public void setSymptom(List<String> symptom) {
		this.symptom = symptom;
	}

	public List<String> getDietList() {
		return dietList;
	}

	public void setDietList(List<String> dietList) {
		this.dietList = dietList;
	}

	public List<String> getDrinkTypeList() {
		return drinkTypeList;
	}

	public void setDrinkTypeList(List<String> drinkTypeList) {
		this.drinkTypeList = drinkTypeList;
	}

	public List<String> getBreastList() {
		return breastList;
	}

	public void setBreastList(List<String> breastList) {
		this.breastList = breastList;
	}

	public List<String> getCerebroDisList() {
		return cerebroDisList;
	}

	public void setCerebroDisList(List<String> cerebroDisList) {
		this.cerebroDisList = cerebroDisList;
	}

	public List<String> getKidneyDisList() {
		return kidneyDisList;
	}

	public void setKidneyDisList(List<String> kidneyDisList) {
		this.kidneyDisList = kidneyDisList;
	}

	public List<String> getHeartDisList() {
		return heartDisList;
	}

	public void setHeartDisList(List<String> heartDisList) {
		this.heartDisList = heartDisList;
	}

	public List<String> getVesselDisList() {
		return vesselDisList;
	}

	public void setVesselDisList(List<String> vesselDisList) {
		this.vesselDisList = vesselDisList;
	}

	public List<String> getEyeDisList() {
		return eyeDisList;
	}

	public void setEyeDisList(List<String> eyeDisList) {
		this.eyeDisList = eyeDisList;
	}

	public List<User> getDoctors() {
		return doctors;
	}

	public void setDoctors(List<User> doctors) {
		this.doctors = doctors;
	}

	public List<User> getRecorders() {
		return recorders;
	}

	public void setRecorders(List<User> recorders) {
		this.recorders = recorders;
	}

	public ResidentArchive getResidentArchive() {
		return residentArchive;
	}

	public void setResidentArchive(ResidentArchive residentArchive) {
		this.residentArchive = residentArchive;
	}


	
	public Long getRsaId() {
		return rsaId;
	}
	public void setRsaId(Long rsaId) {
		this.rsaId = rsaId;
	}
	

	public List<PhyExam> getPhyExams() {
		return phyExams;
	}

	public void setPhyExams(List<PhyExam> phyExams) {
		this.phyExams = phyExams;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public List<HospitalHistory> getHospiList() {
		return hospiList;
	}
	public void setHospiList(List<HospitalHistory> hospiList) {
		this.hospiList = hospiList;
	}
	public List<FamilyDisHistory> getFamDisList() {
		return famDisList;
	}
	public void setFamDisList(List<FamilyDisHistory> famDisList) {
		this.famDisList = famDisList;
	}
	
	public List<Medication> getMedList() {
		return medList;
	}
	public void setMedList(List<Medication> medList) {
		this.medList = medList;
	}

	
	
	
	
}
