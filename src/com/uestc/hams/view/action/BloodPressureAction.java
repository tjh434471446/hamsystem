package com.uestc.hams.view.action;


import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.uestc.hams.base.BaseAction;
import com.uestc.hams.entity.BloodPressure;
import com.uestc.hams.entity.ResidentArchive;
import com.uestc.hams.entity.User;
import com.uestc.hams.util.TimeSearchUtil;

@Controller
@Scope("prototype")
public class BloodPressureAction extends BaseAction<BloodPressure> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//获取当前登录用户信息
	private User user=(User)ActionContext.getContext().getSession().get("user");
	//用户对应的健康档案
	private ResidentArchive residentArchive;
	//普通用户对应的健康档案id
	private String rsaId;
	//记录时间
	private String rt;
	//血压搜索起始时间
	private String time_start;
	//血压搜索结束时间
	private String time_end;
	//角色标志信息
	private int roleFlag;
	private String graphWid;
	//收缩压list
	private	List<Integer> ssList = new ArrayList<Integer>();
			//舒张压list
	private	List<Integer> szList = new ArrayList<Integer>();
			//记录时间list
	private	List<String> timeList = new ArrayList<String>();
			//备注list
	private	List<String> remarksList = new ArrayList<String>();
	
	public String list() throws Exception{	
		//获取当前登录用户对应的健康档案对象
		residentArchive = user.getResidentArchive();
		List<BloodPressure> bloodPressureList = new ArrayList<BloodPressure>();
		//如果健康档案不为空，则为一般用户
		if(residentArchive != null){
			roleFlag = 0;
			bloodPressureList = bloodPressureService.findByResidentArchiveId(residentArchive.getId());
		}else{
			roleFlag = 1;
			//根据页面获得的健康档案id查询血压记录集合
			bloodPressureList = bloodPressureService.findByResidentArchiveId(Long.parseLong(rsaId));
		}
		//找出当前用户的所有血压记录		
		ActionContext.getContext().put("bloodPressureList", bloodPressureList);
		return "list";
	}
	
	/**
	 * 跳转到血压记录界面
	 * @return
	 * @throws Exception
	 */
	public String addUI() throws Exception{
		//获取当前登录用户对应的健康档案对象
		residentArchive = user.getResidentArchive();
		
		ActionContext.getContext().put("residentArchive", residentArchive);
		return "saveUI";
	}
	
	/**
	 * 保存血压记录信息
	 * @return
	 * @throws Exception
	 */
	public String add() throws Exception{
		//转换时间格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.util.Date date = sdf.parse(rt);
		model.setRecordTime(Timestamp.valueOf(sdf.format(date)));;
		//保存血压表单信息
		bloodPressureService.save(model);
		return "toList";
	}
	
	/**
	 * 显示血压波形
	 * @return
	 * @throws ParseException 
	 */
	public String wave() throws ParseException{
		residentArchive = user.getResidentArchive();
		List<BloodPressure> bpList = new ArrayList<BloodPressure>();
		//如果健康档案不为空，则为一般用户
		if(residentArchive != null){
			//查出当前健康档案id号对应的血压对象
			bpList = bloodPressureService.findByResidentArchiveId(residentArchive.getId());
		}else{
			//根据页面获得的健康档案id查询血压记录集合
			bpList = bloodPressureService.findByResidentArchiveId(Long.parseLong(rsaId));
		}		
		//收缩压list
		ssList = new ArrayList<Integer>();
		//舒张压list
		szList = new ArrayList<Integer>();
		//记录时间list
		timeList = new ArrayList<String>();
		//备注list
		remarksList = new ArrayList<String>();
		
		//格式化记录时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//记录时间
		String time ;
		//循环遍历出血压对象的各个属性，并将各个属性值存到list中
		for(int i=0;i<bpList.size();i++){
			BloodPressure bp = bpList.get(i);
			Timestamp recordTime = bp.getRecordTime();
			//将timestamp格式转化为string格式
			time = sdf.format(recordTime);	
			timeList.add(time);
			remarksList.add(bp.getRemarks());
			ssList.add(bp.getSs());
			szList.add(bp.getSz());
		}
		List<Integer> seList = TimeSearchUtil.timeSearch(time_start, time_end, timeList);
		//System.out.println(seList.get(1));
		//System.out.println(seList.get(0));
		int dataNum = seList.get(1) - seList.get(0) + 1;
		//System.out.println(dataNum);
		/*strTime = "";
		for (int i = seList.get(0); i <= seList.get(1); i++)
		{
			
			strTime += timeList.get(i)+", ";
		}*/
		//根据时间条件筛选出的时间集合
		List<String> showTimeList = new ArrayList<String>();
		for(int i = seList.get(0); i <= seList.get(1); i++){
			showTimeList.add(timeList.get(i));
		}
		
		
		//根据时间条件筛选出的收缩压集合
		List<Integer> showSsList = new ArrayList<Integer>();
		for(int i = seList.get(0); i <= seList.get(1); i++){
			showSsList.add(ssList.get(i));
		}
		//根据时间条件筛选出的舒张压集合
		List<Integer> showSzList = new ArrayList<Integer>();
		for(int i = seList.get(0); i <= seList.get(1); i++){
			showSzList.add(szList.get(i));
		}
		
		//要传送给jsp页面的数据
		JSONArray showJsonArray = new JSONArray();
		
		//将时间，收缩压，舒张压的集合转换成json
		JSONArray showTimeArray = JSONArray.fromObject(showTimeList);
		showJsonArray.add(showTimeArray);
		JSONArray showSsArray = JSONArray.fromObject(showSsList);
		showJsonArray.add(showSsArray);
		JSONArray showSzArray = JSONArray.fromObject(showSzList);
		showJsonArray.add(showSzArray);
		
		ActionContext.getContext().put("showJsonArray", showJsonArray);
		return "wave";
	}
	
	public String showWave(){
		return "showWave";
	}
	
	public String waveUI(){
		return "waveUI";
	}

	public ResidentArchive getResidentArchive() {
		return residentArchive;
	}

	public void setResidentArchive(ResidentArchive residentArchive) {
		this.residentArchive = residentArchive;
	}

	public String getRt() {
		return rt;
	}

	public void setRt(String rt) {
		this.rt = rt;
	}

	public String getTime_start() {
		return time_start;
	}

	public void setTime_start(String time_start) {
		this.time_start = time_start;
	}

	public String getTime_end() {
		return time_end;
	}

	public void setTime_end(String time_end) {
		this.time_end = time_end;
	}
	
	
	public String getGraphWid() {
		return graphWid;
	}

	public String getRsaId() {
		return rsaId;
	}

	public void setRsaId(String rsaId) {
		this.rsaId = rsaId;
	}

	public void setGraphWid(String graphWid) {
		this.graphWid = graphWid;
	}

	public List<Integer> getSsList() {
		return ssList;
	}

	public void setSsList(List<Integer> ssList) {
		this.ssList = ssList;
	}

	public List<Integer> getSzList() {
		return szList;
	}

	public void setSzList(List<Integer> szList) {
		this.szList = szList;
	}

	public List<String> getTimeList() {
		return timeList;
	}

	public void setTimeList(List<String> timeList) {
		this.timeList = timeList;
	}

	public int getRoleFlag() {
		return roleFlag;
	}

	public void setRoleFlag(int roleFlag) {
		this.roleFlag = roleFlag;
	}	
	
}
