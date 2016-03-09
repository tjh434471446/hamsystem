package com.uestc.hams.entity;
/**
 * 主要用药情况
 * @author 陈婷
 *
 */
public class Medication {

	private Long id;
	private String drugName;
	private String useage;
	private String dosage;
	private String takeMedTime;
	private String compliance;
	private PhyExam phyExam;
	
	public Medication(){
		
	}
	
	public Medication(String drugName,String useage,String dosage,String takeMedTime,String compliance,
			PhyExam phyExam){
		this.drugName = drugName;
		this.useage = useage;
		this.dosage = dosage;
		this.takeMedTime = takeMedTime;
		this.compliance = compliance;
		this.phyExam = phyExam;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDrugName() {
		return drugName;
	}

	public void setDrugName(String drugName) {
		this.drugName = drugName;
	}

	public String getUseage() {
		return useage;
	}

	public void setUseage(String useage) {
		this.useage = useage;
	}

	public String getDosage() {
		return dosage;
	}

	public void setDosage(String dosage) {
		this.dosage = dosage;
	}

	public String getTakeMedTime() {
		return takeMedTime;
	}

	public void setTakeMedTime(String takeMedTime) {
		this.takeMedTime = takeMedTime;
	}

	public String getCompliance() {
		return compliance;
	}

	public void setCompliance(String compliance) {
		this.compliance = compliance;
	}

	public PhyExam getPhyExam() {
		return phyExam;
	}

	public void setPhyExam(PhyExam phyExam) {
		this.phyExam = phyExam;
	}
	
	
	
}
