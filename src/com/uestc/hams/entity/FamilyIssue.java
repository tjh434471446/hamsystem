package com.uestc.hams.entity;

import java.sql.Date;

public class FamilyIssue {
	
	private Long id;
//	关联家庭
//	家庭问题发生时间
	private Date happenedDate;
//	结束日期
	private Date overDate;
	private User doctor; //建档医生
	private String eventName; //问题名称
	private Date recordDate; //记录日期
	private String remarks;  //备注
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getHappenedDate() {
		return happenedDate;
	}
	public void setHappenedDate(Date happenedDate) {
		this.happenedDate = happenedDate;
	}
	public Date getOverDate() {
		return overDate;
	}
	public void setOverDate(Date overDate) {
		this.overDate = overDate;
	}
	public User getDoctor() {
		return doctor;
	}
	public void setDoctor(User doctor) {
		this.doctor = doctor;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public Date getRecordDate() {
		return recordDate;
	}
	public void setRecordDate(Date recordDate) {
		this.recordDate = recordDate;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	
	

}
