package com.uestc.hams.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 健康档案类
 * @author wujingnan
 *
 */
public class ResidentArchive implements java.io.Serializable{
    
	/**
	 * 
	 */
	private static final long serialVersionUID = -9158138438455920564L;
	private Long id;
	private String rsArchiveId;//档案id
	private String addressId;
	private String committee;//居委会
	private String rsId;//身份证号
	private String workAddr;//工作单位
	private String linkManName;//联系人姓名
	private Date achiveDate;//建档日期
	private Date rsBornDate;//出生日期
	private int age;
	
	//现地址，乡镇街道名称，建档单位,建档人，联系人电话，联系电话
	private String nowAdr;//现地址
	private String streetDisString;//乡镇街道地址
	private Long archiveDisId;//建档单位
	
	private String linkManPhoneNum;//联系人电话
	//是否使用静态变量问题
	private String nationality;//民族??
	private String nationalityString;
	
	
	private String livingType;//常住类型：户籍与非户籍
	private String workingType;//职业类型
	private String marriageType;//婚姻类型
	private String bloodType;//血型
	private String rhType;//是否rh阴性
	private String educateType;//文化程度
	
	
	
	//resident信息(一对一关联的用户信息，剩下的自己保存)
	private Long residentId;
	private String loginName;
	private String name;
	private String gender;
	private String phoneNumber; // 电话号码
	private DistrictIns districtIns;//当前管理机构

	private String paperRecorder;//建档人
	
	//
	private String exposureType;//暴露史类型
	private String exposureString;
	private String heredityType;//遗传史类型
	private String heredityString;
	private String drugAllergyType;//药物过敏史
	private String drugAllergyString;
	//支付方式
	private String payType;
	private String payTypeString;
	
	/*private User resident;//rs=resident
*/	
	private User doctor;//责任医生
	private User recorder;//记录员
	
	
	private Set<PublicIns> bloodTrans=new HashSet<PublicIns>();//输血
	private String bloodTransType;
	private String bloodTranString;
	private String surgeryType;
	private String surgeryString;
	private String traumasType;
	private String traumasString;
	/*private Set<PublicIns> surgerys;//手术
	private Set<PublicIns> traumas;//外伤
	*/
	//支付类型
	
	//家族病史
	private String diseaseType;
	private String diseaseString;
	private String diseaseCancerString;//肿瘤
	private String diseaseOccupString;
	private String diseaseOtherString;
	
	
	private String monDiseaseType;
	private String monDiseaseString;
	private String monDiseaseCancerString;//肿瘤
	private String monDiseaseOccupString;
	private String monDiseaseOtherString;
	
	
	private String faDiseaseType;
	private String faDiseaseString;
	private String faDiseaseCancerString;//肿瘤
	private String faDiseaseOccupString;
	private String faDiseaseOtherString;
	
	private String broDiseaseType;
	private String broDiseaseString;
	private String broDiseaseCancerString;//肿瘤
	private String broDiseaseOccupString;
	private String broDiseaseOtherString;
	
	private String childDiseaseType;
	private String childDiseaseString;
	private String childDiseaseCancerString;//肿瘤
	private String childDiseaseOccupString;
	private String childDiseaseOtherString;
	
	private String disabledType;
	private String disabledString;
	private String disabledOhterString;
	
	private String kitchenEquiType;
	private String fuelType;
	private String waterType;
	private String wcType;
	private String animalType;
	
	/*
	 * by yang
	 */
	private Family family;
//	与户主关系
	private String relationShip;
	
	
	public Family getFamily() {
		return family;
	}

	public void setFamily(Family family) {
		this.family = family;
	}

	public String getRelationShip() {
		return relationShip;
	}

	public void setRelationShip(String relationShip) {
		this.relationShip = relationShip;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRsArchiveId() {
		return rsArchiveId;
	}

	public void setRsArchiveId(String rsArchiveId) {
		this.rsArchiveId = rsArchiveId;
	}

	public String getAddressId() {
		return addressId;
	}

	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}

	

	public Set<PublicIns> getBloodTrans() {
		return bloodTrans;
	}

	public void setBloodTrans(Set<PublicIns> bloodTrans) {
		this.bloodTrans = bloodTrans;
	}

	public String getCommittee() {
		return committee;
	}

	public void setCommittee(String committee) {
		this.committee = committee;
	}

	public String getRsId() {
		return rsId;
	}

	public void setRsId(String rsId) {
		this.rsId = rsId;
	}


	public String getWorkAddr() {
		return workAddr;
	}

	public void setWorkAddr(String workAddr) {
		this.workAddr = workAddr;
	}

	public String getLinkManName() {
		return linkManName;
	}
	

	public void setLinkManName(String linkManName) {
		this.linkManName = linkManName;
	}


	public String getLivingType() {
		return livingType;
	}

	public void setLivingType(String livingType) {
		this.livingType = livingType;
	}

	public String getWorkingType() {
		return workingType;
	}

	public void setWorkingType(String workingType) {
		this.workingType = workingType;
	}

	public String getMarriageType() {
		return marriageType;
	}

	public void setMarriageType(String marriageType) {
		this.marriageType = marriageType;
	}

	public String getBloodType() {
		return bloodType;
	}

	public void setBloodType(String bloodType) {
		this.bloodType = bloodType;
	}

	public String getRhType() {
		return rhType;
	}

	public void setRhType(String rhType) {
		this.rhType = rhType;
	}

	public String getEducateType() {
		return educateType;
	}

	public void setEducateType(String educateType) {
		this.educateType = educateType;
	}

	

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getPayTypeString() {
		return payTypeString;
	}

	public void setPayTypeString(String payTypeString) {
		this.payTypeString = payTypeString;
	}

	
	
	public String getSurgeryType() {
		return surgeryType;
	}

	public void setSurgeryType(String surgeryType) {
		this.surgeryType = surgeryType;
	}

	public String getTraumasType() {
		return traumasType;
	}

	public void setTraumasType(String traumasType) {
		this.traumasType = traumasType;
	}

	public User getDoctor() {
		return doctor;
	}



	public Long getResidentId() {
		return residentId;
	}

	public void setResidentId(Long residentId) {
		this.residentId = residentId;
	}

	public void setDoctor(User doctor) {
		this.doctor = doctor;
	}

	public User getRecorder() {
		return recorder;
	}

	public void setRecorder(User recorder) {
		this.recorder = recorder;
	}

	public String getNowAdr() {
		return nowAdr;
	}

	public void setNowAdr(String nowAdr) {
		this.nowAdr = nowAdr;
	}


	public String getLinkManPhoneNum() {
		return linkManPhoneNum;
	}

	public void setLinkManPhoneNum(String linkManPhoneNum) {
		this.linkManPhoneNum = linkManPhoneNum;
	}

	

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getNationalityString() {
		return nationalityString;
	}

	public void setNationalityString(String nationalityString) {
		this.nationalityString = nationalityString;
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

	public String getPaperRecorder() {
		return paperRecorder;
	}

	public void setPaperRecorder(String paperRecorder) {
		this.paperRecorder = paperRecorder;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public DistrictIns getDistrictIns() {
		return districtIns;
	}

	public void setDistrictIns(DistrictIns districtIns) {
		this.districtIns = districtIns;
	}

	public String getStreetDisString() {
		return streetDisString;
	}

	public void setStreetDisString(String streetDisString) {
		this.streetDisString = streetDisString;
	}

	public Long getArchiveDisId() {
		return archiveDisId;
	}

	public void setArchiveDisId(Long archiveDisId) {
		this.archiveDisId = archiveDisId;
	}

	public Date getAchiveDate() {
		return achiveDate;
	}

	public void setAchiveDate(Date achiveDate) {
		this.achiveDate = achiveDate;
	}

	public Date getRsBornDate() {
		return rsBornDate;
	}

	public void setRsBornDate(Date rsBornDate) {
		this.rsBornDate = rsBornDate;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getExposureType() {
		return exposureType;
	}

	public void setExposureType(String exposureType) {
		this.exposureType = exposureType;
	}

	public String getHeredityType() {
		return heredityType;
	}

	public void setHeredityType(String heredityType) {
		this.heredityType = heredityType;
	}

	public String getDrugAllergyType() {
		return drugAllergyType;
	}

	public void setDrugAllergyType(String drugAllergyType) {
		this.drugAllergyType = drugAllergyType;
	}

	public String getExposureString() {
		return exposureString;
	}

	public void setExposureString(String exposureString) {
		this.exposureString = exposureString;
	}

	public String getHeredityString() {
		return heredityString;
	}

	public void setHeredityString(String heredityString) {
		this.heredityString = heredityString;
	}

	public String getDrugAllergyString() {
		return drugAllergyString;
	}

	public void setDrugAllergyString(String drugAllergyString) {
		this.drugAllergyString = drugAllergyString;
	}

	public String getBloodTransType() {
		return bloodTransType;
	}

	public void setBloodTransType(String bloodTransType) {
		this.bloodTransType = bloodTransType;
	}

	public String getBloodTranString() {
		return bloodTranString;
	}

	public void setBloodTranString(String bloodTranString) {
		this.bloodTranString = bloodTranString;
	}

	public String getSurgeryString() {
		return surgeryString;
	}

	public void setSurgeryString(String surgeryString) {
		this.surgeryString = surgeryString;
	}

	public String getTraumasString() {
		return traumasString;
	}

	public void setTraumasString(String traumasString) {
		this.traumasString = traumasString;
	}

	public String getDiseaseType() {
		return diseaseType;
	}

	public void setDiseaseType(String diseaseType) {
		this.diseaseType = diseaseType;
	}

	public String getDiseaseString() {
		return diseaseString;
	}

	public void setDiseaseString(String diseaseString) {
		this.diseaseString = diseaseString;
	}

	public String getMonDiseaseType() {
		return monDiseaseType;
	}

	public void setMonDiseaseType(String monDiseaseType) {
		this.monDiseaseType = monDiseaseType;
	}

	public String getMonDiseaseString() {
		return monDiseaseString;
	}

	public void setMonDiseaseString(String monDiseaseString) {
		this.monDiseaseString = monDiseaseString;
	}

	public String getFaDiseaseType() {
		return faDiseaseType;
	}

	public void setFaDiseaseType(String faDiseaseType) {
		this.faDiseaseType = faDiseaseType;
	}

	public String getFaDiseaseString() {
		return faDiseaseString;
	}

	public void setFaDiseaseString(String faDiseaseString) {
		this.faDiseaseString = faDiseaseString;
	}

	public String getBroDiseaseType() {
		return broDiseaseType;
	}

	public void setBroDiseaseType(String broDiseaseType) {
		this.broDiseaseType = broDiseaseType;
	}

	public String getBroDiseaseString() {
		return broDiseaseString;
	}

	public void setBroDiseaseString(String broDiseaseString) {
		this.broDiseaseString = broDiseaseString;
	}

	public String getChildDiseaseType() {
		return childDiseaseType;
	}

	public void setChildDiseaseType(String childDiseaseType) {
		this.childDiseaseType = childDiseaseType;
	}

	public String getChildDiseaseString() {
		return childDiseaseString;
	}

	public void setChildDiseaseString(String childDiseaseString) {
		this.childDiseaseString = childDiseaseString;
	}

	public String getDiseaseCancerString() {
		return diseaseCancerString;
	}

	public void setDiseaseCancerString(String diseaseCancerString) {
		this.diseaseCancerString = diseaseCancerString;
	}

	public String getDiseaseOccupString() {
		return diseaseOccupString;
	}

	public void setDiseaseOccupString(String diseaseOccupString) {
		this.diseaseOccupString = diseaseOccupString;
	}

	public String getDiseaseOtherString() {
		return diseaseOtherString;
	}

	public void setDiseaseOtherString(String diseaseOtherString) {
		this.diseaseOtherString = diseaseOtherString;
	}

	public String getMonDiseaseCancerString() {
		return monDiseaseCancerString;
	}

	public void setMonDiseaseCancerString(String monDiseaseCancerString) {
		this.monDiseaseCancerString = monDiseaseCancerString;
	}

	public String getMonDiseaseOccupString() {
		return monDiseaseOccupString;
	}

	public void setMonDiseaseOccupString(String monDiseaseOccupString) {
		this.monDiseaseOccupString = monDiseaseOccupString;
	}

	public String getMonDiseaseOtherString() {
		return monDiseaseOtherString;
	}

	public void setMonDiseaseOtherString(String monDiseaseOtherString) {
		this.monDiseaseOtherString = monDiseaseOtherString;
	}

	public String getFaDiseaseCancerString() {
		return faDiseaseCancerString;
	}

	public void setFaDiseaseCancerString(String faDiseaseCancerString) {
		this.faDiseaseCancerString = faDiseaseCancerString;
	}

	public String getFaDiseaseOccupString() {
		return faDiseaseOccupString;
	}

	public void setFaDiseaseOccupString(String faDiseaseOccupString) {
		this.faDiseaseOccupString = faDiseaseOccupString;
	}

	public String getFaDiseaseOtherString() {
		return faDiseaseOtherString;
	}

	public void setFaDiseaseOtherString(String faDiseaseOtherString) {
		this.faDiseaseOtherString = faDiseaseOtherString;
	}

	public String getBroDiseaseCancerString() {
		return broDiseaseCancerString;
	}

	public void setBroDiseaseCancerString(String broDiseaseCancerString) {
		this.broDiseaseCancerString = broDiseaseCancerString;
	}

	public String getBroDiseaseOccupString() {
		return broDiseaseOccupString;
	}

	public void setBroDiseaseOccupString(String broDiseaseOccupString) {
		this.broDiseaseOccupString = broDiseaseOccupString;
	}

	public String getBroDiseaseOtherString() {
		return broDiseaseOtherString;
	}

	public void setBroDiseaseOtherString(String broDiseaseOtherString) {
		this.broDiseaseOtherString = broDiseaseOtherString;
	}

	public String getChildDiseaseCancerString() {
		return childDiseaseCancerString;
	}

	public void setChildDiseaseCancerString(String childDiseaseCancerString) {
		this.childDiseaseCancerString = childDiseaseCancerString;
	}

	public String getChildDiseaseOccupString() {
		return childDiseaseOccupString;
	}

	public void setChildDiseaseOccupString(String childDiseaseOccupString) {
		this.childDiseaseOccupString = childDiseaseOccupString;
	}

	public String getChildDiseaseOtherString() {
		return childDiseaseOtherString;
	}

	public void setChildDiseaseOtherString(String childDiseaseOtherString) {
		this.childDiseaseOtherString = childDiseaseOtherString;
	}

	public String getKitchenEquiType() {
		return kitchenEquiType;
	}

	public void setKitchenEquiType(String kitchenEquiType) {
		this.kitchenEquiType = kitchenEquiType;
	}

	public String getFuelType() {
		return fuelType;
	}

	public void setFuelType(String fuelType) {
		this.fuelType = fuelType;
	}

	public String getWaterType() {
		return waterType;
	}

	public void setWaterType(String waterType) {
		this.waterType = waterType;
	}

	public String getWcType() {
		return wcType;
	}

	public void setWcType(String wcType) {
		this.wcType = wcType;
	}

	public String getAnimalType() {
		return animalType;
	}

	public void setAnimalType(String animalType) {
		this.animalType = animalType;
	}

	public String getDisabledType() {
		return disabledType;
	}

	public void setDisabledType(String disabledType) {
		this.disabledType = disabledType;
	}

	public String getDisabledString() {
		return disabledString;
	}

	public void setDisabledString(String disabledString) {
		this.disabledString = disabledString;
	}

	public String getDisabledOhterString() {
		return disabledOhterString;
	}

	public void setDisabledOhterString(String disabledOhterString) {
		this.disabledOhterString = disabledOhterString;
	}

	
	
	
}
