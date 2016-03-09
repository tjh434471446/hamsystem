package com.uestc.hams.service;

import java.util.List;

import com.uestc.hams.base.DaoSupport;
import com.uestc.hams.entity.MessageText;

public interface IMessageTextService extends DaoSupport<MessageText> {

	/**
	 * 根据收件人id找到对应的留言
	 * @param id 收件人id
	 * @return 接收留言集合
	 */
	List<MessageText> findByReceiverId(Long id);
	/**
	 * 根据发件人id找到对应的留言
	 * @param id 发件人id
	 * @return 发送留言集合
	 */
	List<MessageText> findBySenderId(Long id);

}
