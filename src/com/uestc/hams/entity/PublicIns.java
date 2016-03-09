package com.uestc.hams.entity;

/**
 * 输血，手术，外伤公共信息
 * @author wujingnan
 *
 */
public class PublicIns {

	private Long id;
	private String name;
	private String info;//应该是日期，后面再改；
	private ResidentArchive rsBloodTran;//该信息对应的档案
	/*private ResidentArchive rsSurgerys;
	private ResidentArchive rsTraumas;*/
	public PublicIns(){
		
	}
	
	public PublicIns(String name,String info,ResidentArchive rsA){
		this.name=name;
		this.info=info;
		this.rsBloodTran=rsA;
		
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public ResidentArchive getRsBloodTran() {
		return rsBloodTran;
	}
	public void setRsBloodTran(ResidentArchive rsBloodTran) {
		this.rsBloodTran = rsBloodTran;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}


	
	
}
