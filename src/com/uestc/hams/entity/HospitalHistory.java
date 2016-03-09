package com.uestc.hams.entity;
/**
 * 住院史
 * @author 陈婷
 *
 */
public class HospitalHistory {

	private Long id;
	private String inHospital;//入院日期
	private String outHospital;//出院日期
	private String inHosReason;//原因
	private String hospitalName;//医疗机构名称
	private String recordNumber;//病案号
	private PhyExam phyExam;//对应的健康体检表
	
	//构造方法
	public HospitalHistory(){
		
	}
	
	public HospitalHistory(String inHospital,String outHospital,String inHosReason,String hospitalName,String recordNumber,PhyExam phyExam){
		this.inHospital = inHospital;
		this.outHospital = 	outHospital;
		this.inHosReason = inHosReason;
		this.hospitalName = hospitalName;
		this.recordNumber = recordNumber;
		this.phyExam = phyExam;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getInHospital() {
		return inHospital;
	}
	public void setInHospital(String inHhospital) {
		this.inHospital = inHhospital;
	}
	public String getOutHospital() {
		return outHospital;
	}
	public void setOutHospital(String outHospital) {
		this.outHospital = outHospital;
	}
	public String getInHosReason() {
		return inHosReason;
	}
	public void setInHosReason(String inHosReason) {
		this.inHosReason = inHosReason;
	}
	public String getHospitalName() {
		return hospitalName;
	}
	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}
	public String getRecordNumber() {
		return recordNumber;
	}
	public void setRecordNumber(String recordNumber) {
		this.recordNumber = recordNumber;
	}
	public PhyExam getPhyExam() {
		return phyExam;
	}
	public void setPhyExam(PhyExam phyExam) {
		this.phyExam = phyExam;
	}
	
	
}
