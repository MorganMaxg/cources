package com.springapp.mvc.dao;

import com.springapp.mvc.entity.Message;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by maomao on 2015/4/7.
 */
public interface MessageDao {
    public void addMessage(@Param("message") Message message);

    public List<Message> findAllMessage(@Param("teacherID") int teacherID);

    public Integer teacherIDFindByName(String teacherName);

    public void updateMessage(@Param("message") Message message);

    public void deleteMessage(@Param("messageID") int messageID);

    public Message findOneMessageByMessageID(@Param("messageID") int messageID);
}
