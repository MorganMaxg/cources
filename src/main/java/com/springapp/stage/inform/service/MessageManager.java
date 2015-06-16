package com.springapp.stage.inform.service;

import ch.qos.logback.classic.Logger;
import com.springapp.stage.inform.dao.MessageDao;
import com.springapp.stage.inform.entity.Message;
import com.springapp.stage.utils.Page;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ASUS on 2015/4/28.
 */
@Service
@Transactional
public class MessageManager {
    private static Logger logger = (Logger) LoggerFactory.getLogger(MessageManager.class);
    @Autowired
    private MessageDao messageDao;

    @Transactional(readOnly = true)
    public List<Message> findMessages(Page page) throws Exception {
        return messageDao.findMessages(page);
    }

    @Transactional(readOnly = true)
    public Integer countMessages() throws Exception {
        return messageDao.countMessages();
    }

    @Transactional(readOnly = true)
    public Message findMessageById(Integer messageId) {
        return messageDao.findMessageById(messageId);
    }

}
