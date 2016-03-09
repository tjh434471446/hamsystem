package com.uestc.hams.entity;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * @author Charles
 *
 */
public class Family implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 23423425234L;

	private Long id;
	
//	家庭户主
	private ResidentArchive head;
//	户主身份证号
	private Long headIdNO;
//	医保卡号
	private Long medicalInsNo;
//	医疗证号
	private Long medicalNo;
//	邮编
	private String postalCode;
//	就业人数
	private String careerPopu;
//	家庭人数
	private String familyPopu;
//	经济状况
	private String financialSitu;

	private String address;
	//	电话号码
	private Long phoneNo;
//	管理员(登记员)表，默认登录用户 多对一
	private User register;
//	登记日期
	private Date registerDate;
	
	
//	未成年子女
	private String childrenPopu;
//	负担老人
	private String occupiedAged;
//	家庭地址
	
	private String property; //户属性，分城镇和农村
	private String lxw;  //住房面积，平方米
	private String averageLxw; //人均住房面积
	private String housePro;  //房屋类型
	private String familyLocation;  //家庭位置 分独居还是群居
	private String security; //治安状况
	
	private float toPolice; //离派出所距离
	private float toHospital;  //离医院距离
	private float toRoad;  //离公路距离
	private float toShop;   //离商店距离
	private float toSchool; //离学校距离
	
	private String wentilate; //通风程度
	private String humidity;  //湿度程度
	private String warmth;    //保暖程度
	private String brightness; //采光程度
	private String sanitation;  //卫生程度
	
	private String kitchenMethod; //厨房使用方式
	private String kitchenExhaust; //厨房排风设施
	private String dw;             //饮水来源
	private String kitchenFuel;    //使用燃料
	private String animalsField;   //禽兽栏有无
	private String rubbishDispose; //垃圾处理
	private String toilet;         //厕所类型
	private String appliances;     //电器
	private String vehicle;        //交通工具
	
	
	private String remarks;      //备注
	
	private User doctor;         //责任医生
//	家庭成员
	private Set<ResidentArchive> member=new HashSet<ResidentArchive>();
//	家庭问题评估表
	private Set<FamilyIssue> issue=new HashSet<FamilyIssue>();
//	家庭类别评估
	private Set<FamilyCategoryEvaluate> evaluate=new HashSet<FamilyCategoryEvaluate>();
	
	
	
	public String getFamilyPopu() {
		return familyPopu;
	}
	public void setFamilyPopu(String familyPopu) {
		this.familyPopu = familyPopu;
	}
	public Set<ResidentArchive> getMember() {
		return member;
	}
	public void setMember(Set<ResidentArchive> member) {
		this.member = member;
	}
	public Long getHeadIdNO() {
		return headIdNO;
	}
	public void setHeadIdNO(Long headIdNO) {
		this.headIdNO = headIdNO;
	}
	public User getDoctor() {
		return doctor;
	}
	public void setDoctor(User doctor) {
		this.doctor = doctor;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	public Set<FamilyCategoryEvaluate> getEvaluate() {
		return evaluate;
	}
	public void setEvaluate(Set<FamilyCategoryEvaluate> evaluate) {
		this.evaluate = evaluate;
	}
	public Set<FamilyIssue> getIssue() {
		return issue;
	}
	public void setIssue(Set<FamilyIssue> issue) {
		this.issue = issue;
	}
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	
	public ResidentArchive getHead() {
		return head;
	}
	public void setHead(ResidentArchive head) {
		this.head = head;
	}
	public User getRegister() {
		return register;
	}
	public void setRegister(User register) {
		this.register = register;
	}
	public Long getFamilyId() {
		return id;
	}
	public void setFamilyId(Long familyId) {
		this.id = familyId;
	}
	public Long getMedicalInsNo() {
		return medicalInsNo;
	}
	public void setMedicalInsNo(Long medicalInsNo) {
		this.medicalInsNo = medicalInsNo;
	}
	public Long getMedicalNo() {
		return medicalNo;
	}
	public void setMedicalNo(Long medicalNo) {
		this.medicalNo = medicalNo;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	public String getCareerPopu() {
		return careerPopu;
	}
	public void setCareerPopu(String careerPopu) {
		this.careerPopu = careerPopu;
	}
	public String getFinancialSitu() {
		return financialSitu;
	}
	public void setFinancialSitu(String financialSitu) {
		this.financialSitu = financialSitu;
	}
	
	
	public Long getPhoneNo() {
		return phoneNo;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	public void setPhoneNo(Long phoneNo) {
		this.phoneNo = phoneNo;
	}
	
	
	public String getChildrenPopu() {
		return childrenPopu;
	}
	public void setChildrenPopu(String childrenPopu) {
		this.childrenPopu = childrenPopu;
	}
	public String getOccupiedAged() {
		return occupiedAged;
	}
	public void setOccupiedAged(String occupiedAged) {
		this.occupiedAged = occupiedAged;
	}
	public String getProperty() {
		return property;
	}
	public void setProperty(String property) {
		this.property = property;
	}
	public String getLxw() {
		return lxw;
	}
	public void setLxw(String lxw) {
		this.lxw = lxw;
	}
	public String getAverageLxw() {
		return averageLxw;
	}
	public void setAverageLxw(String averageLxw) {
		this.averageLxw = averageLxw;
	}
	public String getHousePro() {
		return housePro;
	}
	public void setHousePro(String housePro) {
		this.housePro = housePro;
	}
	public String getFamilyLocation() {
		return familyLocation;
	}
	public void setFamilyLocation(String familyLocation) {
		this.familyLocation = familyLocation;
	}
	public String getSecurity() {
		return security;
	}
	public void setSecurity(String security) {
		this.security = security;
	}
	public float getToPolice() {
		return toPolice;
	}
	public void setToPolice(float toPolice) {
		this.toPolice = toPolice;
	}
	public float getToHospital() {
		return toHospital;
	}
	public void setToHospital(float toHospital) {
		this.toHospital = toHospital;
	}
	public float getToRoad() {
		return toRoad;
	}
	public void setToRoad(float toRoad) {
		this.toRoad = toRoad;
	}
	public float getToShop() {
		return toShop;
	}
	public void setToShop(float toShop) {
		this.toShop = toShop;
	}
	public float getToSchool() {
		return toSchool;
	}
	public void setToSchool(float toSchool) {
		this.toSchool = toSchool;
	}
	public String getWentilate() {
		return wentilate;
	}
	public void setWentilate(String wentilate) {
		this.wentilate = wentilate;
	}
	public String getHumidity() {
		return humidity;
	}
	public void setHumidity(String humidity) {
		this.humidity = humidity;
	}
	public String getWarmth() {
		return warmth;
	}
	public void setWarmth(String warmth) {
		this.warmth = warmth;
	}
	public String getBrightness() {
		return brightness;
	}
	public void setBrightness(String brightness) {
		this.brightness = brightness;
	}
	public String getSanitation() {
		return sanitation;
	}
	public void setSanitation(String sanitation) {
		this.sanitation = sanitation;
	}
	public String getKitchenMethod() {
		return kitchenMethod;
	}
	public void setKitchenMethod(String kitchenMethod) {
		this.kitchenMethod = kitchenMethod;
	}
	public String getKitchenExhaust() {
		return kitchenExhaust;
	}
	public void setKitchenExhaust(String kitchenExhaust) {
		this.kitchenExhaust = kitchenExhaust;
	}
	public String getDw() {
		return dw;
	}
	public void setDw(String dw) {
		this.dw = dw;
	}
	public String getKitchenFuel() {
		return kitchenFuel;
	}
	public void setKitchenFuel(String kitchenFuel) {
		this.kitchenFuel = kitchenFuel;
	}
	public String getAnimalsField() {
		return animalsField;
	}
	public void setAnimalsField(String animalsField) {
		this.animalsField = animalsField;
	}
	public String getRubbishDispose() {
		return rubbishDispose;
	}
	public void setRubbishDispose(String rubbishDispose) {
		this.rubbishDispose = rubbishDispose;
	}
	public String getToilet() {
		return toilet;
	}
	public void setToilet(String toilet) {
		this.toilet = toilet;
	}
	public String getAppliances() {
		return appliances;
	}
	public void setAppliances(String appliances) {
		this.appliances = appliances;
	}
	public String getVehicle() {
		return vehicle;
	}
	public void setVehicle(String vehicle) {
		this.vehicle = vehicle;
	}
	

}
