package com.uestc.hams.entity;

import java.sql.Timestamp;
/**
 * 留言 
 * @author 陈婷
 * 
 */
public class MessageText {

	private Long id;
	//主题
	private String title;
	//内容
	private String content;
	//留言时间
	private Timestamp time;
	//发送者
	private User sender;
	//接收者
	private User receiver;
	//消息状态
	private int state;
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public User getSender() {
		return sender;
	}
	public void setSender(User sender) {
		this.sender = sender;
	}
	public User getReceiver() {
		return receiver;
	}
	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	
}
