package com.uestc.hams.entity;

import java.sql.Date;

/**
 * @author Charles
 * 后期拓展任务
 *
 */
public class FamilyCategoryEvaluate {
	
	private Long id;
//	关联家庭
	private String category; //家庭类别
	private String remarks;  //备注
 	private User doctor ;  //评估医生
 	private Date evaluateDate; //评估日期
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public User getDoctor() {
		return doctor;
	}
	public void setDoctor(User doctor) {
		this.doctor = doctor;
	}
	public Date getEvaluateDate() {
		return evaluateDate;
	}
	public void setEvaluateDate(Date evaluateDate) {
		this.evaluateDate = evaluateDate;
	}
 	
 	
	
	

}
