package com.uestc.hams.entity;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class BloodPressure implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Long id;
	
	//收缩压
	private Integer ss;
	//舒张压
	private Integer sz;
	//记录时间
	private Timestamp recordTime;
	//备注
	private String remarks;
	//健康档案
	private ResidentArchive residentArchive;
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Integer getSs() {
		return ss;
	}
	public void setSs(Integer ss) {
		this.ss = ss;
	}
	public Integer getSz() {
		return sz;
	}
	public void setSz(Integer sz) {
		this.sz = sz;
	}
	
	
	public Timestamp getRecordTime() {
		return recordTime;
	}
	public void setRecordTime(Timestamp recordTime) {
		this.recordTime = recordTime;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public ResidentArchive getResidentArchive() {
		return residentArchive;
	}
	public void setResidentArchive(ResidentArchive residentArchive) {
		this.residentArchive = residentArchive;
	}
	
	
}
