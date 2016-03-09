package com.uestc.hams.entity;
/**
 * 家庭病床史
 * @author 陈婷
 *
 */

public class FamilyDisHistory {

	private Long id;
	private String buildBedDate;//建床日期
	private String removeBedDate;//撤床日期
	private String famDisReason;//原因
	private String famHospitalName;//医疗机构名称
	private String famRecordNumber;//病案号
	private PhyExam phyExam;//对应的健康体检表
	
	
	public FamilyDisHistory(){
			
	}
	public FamilyDisHistory(String buildBedDate,String removeBedDate,String famDisReason,
			String famHospitalName,String famRecordNumber,PhyExam phyExam){
		this.buildBedDate = buildBedDate;
		this.removeBedDate = removeBedDate;
		this.famDisReason = famDisReason;
		this.famHospitalName = famHospitalName;
		this.famRecordNumber = famRecordNumber;
		this.phyExam = phyExam;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getBuildBedDate() {
		return buildBedDate;
	}
	public void setBuildBedDate(String buildBedDate) {
		this.buildBedDate = buildBedDate;
	}
	public String getRemoveBedDate() {
		return removeBedDate;
	}
	public void setRemoveBedDate(String removeBedDate) {
		this.removeBedDate = removeBedDate;
	}
	public String getFamDisReason() {
		return famDisReason;
	}
	public void setFamDisReason(String famDisReason) {
		this.famDisReason = famDisReason;
	}
	public String getFamHospitalName() {
		return famHospitalName;
	}
	public void setFamHospitalName(String famHospitalName) {
		this.famHospitalName = famHospitalName;
	}
	public String getFamRecordNumber() {
		return famRecordNumber;
	}
	public void setFamRecordNumber(String famRecordNumber) {
		this.famRecordNumber = famRecordNumber;
	}
	public PhyExam getPhyExam() {
		return phyExam;
	}
	public void setPhyExam(PhyExam phyExam) {
		this.phyExam = phyExam;
	}
	
	
}
