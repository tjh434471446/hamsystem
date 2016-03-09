package com.uestc.hams.view.action;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.uestc.hams.base.BaseAction;
import com.uestc.hams.entity.MessageText;
import com.uestc.hams.entity.ResidentArchive;
import com.uestc.hams.entity.User;

public class MessageTextAction extends BaseAction<MessageText> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//获取当前登录用户信息
	private User user=(User)ActionContext.getContext().getSession().get("user");
	private String receiverId;
	//收件人可选集合
	private List<User> receivers = new ArrayList<User>();
	//留言时间
	private Timestamp time;
	//角色标志信息
	private String roleFlag;
	

	public String homeUI() throws Exception{
		//获得当前用户的个人健康档案
		ResidentArchive rs = user.getResidentArchive();
		//System.out.println(rs+"xx");
		//如果健康档案不为空，则为一般用户
		if(rs != null){
			roleFlag = "0";
		}else{
			roleFlag = "1";
		}
		System.out.println("yy"+roleFlag);
		return "homeUI";
	}
	
	/**
	 * 查询出以当前用户作为收件人留言列表
	 * @return
	 * @throws Exception
	 */
	public String receiveList() throws Exception{
		List<MessageText> receiveMessageList = messageTextService.findByReceiverId(user.getId());
		ActionContext.getContext().put("receiveMessageList", receiveMessageList);
		return "receiveList";
	}
	/**
	 * 查询出以当前用户作为发件人留言列表
	 * @return
	 * @throws Exception
	 */
	public String sendList() throws Exception{
		List<MessageText> sendMessageList = messageTextService.findBySenderId(user.getId());
		ActionContext.getContext().put("sendMessageList", sendMessageList);
		return "sendList";
	}
	
	/**
	 * 跳转到居民留言页面
	 * @return
	 * @throws Exception
	 */
	public String residentAddUI() throws Exception{
		//获取当前居民用户的责任医生，作为留言的收件人
		ResidentArchive rs = user.getResidentArchive();
		Long i =rs.getId();
		rs=residentArchiveService.getById(i);		
		User receiver = rs.getDoctor();
		receivers.add(receiver);
		return "saveUI";
	}
	
	/**
	 * 跳转到医生留言页面
	 * @return
	 * @throws Exception
	 */
	public String doctorAddUI() throws Exception{
		//根据当前用户id找到以此用户作为责任医生的个人健康档案集合
		List<ResidentArchive> residentArchives = residentArchiveService.findDoctorList(user.getId());
		//根据个人健康档案找到对应的用户，加入收件人集合
		if(residentArchives != null){
			for(ResidentArchive rs:residentArchives){
				receivers.add(userService.findByRsArchiveId(rs.getId()));
				
			}
		}		
		return "saveUI";
	}
	
	/**
	 * 保存留言信息
	 * @return
	 */
	public String add() throws Exception{
		//获取收件人
		User receiver = userService.getById(Long.parseLong(receiverId));
		//保存收件人
		model.setReceiver(receiver);
		//保存发件人
		model.setSender(user);
		//获取当前系统时间戳
		time = new Timestamp(System.currentTimeMillis());
		model.setTime(time);
		//保存留言页面传来的数据
		messageTextService.save(model);
		return "addSucc";
	}
	
	/**
	 * 显示收到留言详细信息
	 * @return
	 */
	public String receiveDetailInfo() throws Exception{	
		System.out.println("ab"+roleFlag);
		MessageText messageText = messageTextService.getById(model.getId());
		if(messageText.getState() == 0){
			//将留言状态设置为已读	
			messageText.setState(1);
			messageTextService.update(messageText);
		}
		//获得留言发送者的居民个人健康档案id
		Long residentArchiveId = messageText.getSender().getResidentArchive().getId();
		ActionContext.getContext().put("messageText", messageText);
		ActionContext.getContext().put("residentArchiveId", residentArchiveId);
		return "receiveDetailInfoUI";
	}
	/**
	 * 显示发送留言的详细信息
	 * @return
	 * @throws Exception
	 */
	public String sendDetailInfo() throws Exception{
		MessageText messageText = messageTextService.getById(model.getId());
		ActionContext.getContext().put("messageText", messageText);
		return "sendDetailInfoUI";
	}
	/**
	 * 跳转到留言回复界面
	 * @return
	 * @throws Exception
	 */
	public String replyUI() throws Exception{
		//发送者为当前用户
		User sender = user;
		//根据jsp页面传递的id查询出对应的留言信息
		MessageText messageText = messageTextService.getById(model.getId());
		//接收者为前面留言的发送者
		User receiver = messageText.getSender();
		messageText.setSender(sender);
		messageText.setReceiver(receiver);
		ActionContext.getContext().put("messageText", messageText);
		return "replyUI";
	}

	public List<User> getReceivers() {
		return receivers;
	}

	public void setReceivers(List<User> receivers) {
		this.receivers = receivers;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}


	public String getRoleFlag() {
		return roleFlag;
	}

	public void setRoleFlag(String roleFlag) {
		this.roleFlag = roleFlag;
	}

	public String getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
