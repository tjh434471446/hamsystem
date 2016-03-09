package com.uestc.hams.view.action;

import com.opensymphony.xwork2.ActionSupport;

public class TestAction extends ActionSupport{
	private String dateT;
	int a=0;
	public String execute() {
		System.out.println(dateT);
		a=0;
		return "success";
	}
	public String getDateT() {
		return dateT;
	}
	public void setDateT(String dateT) {
		this.dateT = dateT;
	}
	public int getA() {
		return a;
	}
	public void setA(int a) {
		this.a = a;
	}
	
}
