package com.springapp.mvc.service;

import com.springapp.mvc.dao.MessageDao;
import com.springapp.mvc.entity.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by maomao on 2015/4/7.
 */
@Service
@Transactional
public class MessageService {
    @Autowired
    MessageDao messageDao;

    @Transactional
    public void addMessage(Message message) {
        messageDao.addMessage(message);
    }

    public List<Message> findAllMessage(int teacherID) {
        return messageDao.findAllMessage(teacherID);
    }

    public Integer teacherIDFindByName(
            String teacherName) {
        return messageDao.teacherIDFindByName(teacherName);
    }

    @Transactional
    public void updateMessage(Message message) {
        messageDao.updateMessage(message);
    }

    @Transactional
    public void deleteMessage(int messageID) {
        messageDao.deleteMessage(messageID);
    }

    public Message findOneMessageByMessageID(int messageID) {
        return messageDao.findOneMessageByMessageID(messageID);
    }
}
