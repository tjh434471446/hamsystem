package com.uestc.hams.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uestc.hams.base.DaoSupportImpl;
import com.uestc.hams.entity.MessageText;
import com.uestc.hams.service.IMessageTextService;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class MessageTextServiceImpl extends DaoSupportImpl<MessageText> implements IMessageTextService {
	
	public List<MessageText> findByReceiverId(Long id) {
		
		return getSession().createQuery("from MessageText mt where mt.receiver.id=?")
				.setParameter(0, id)
				.list();

	}

	public List<MessageText> findBySenderId(Long id) {
		
		return getSession().createQuery("from MessageText mt where mt.sender.id=?")
				.setParameter(0, id)
				.list();
	}


}
